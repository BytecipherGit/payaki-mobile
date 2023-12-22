import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/training/trainingDetail/screen/training_detail_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/delete_alert_dialog.dart';
import 'package:payaki/widgets/event_training_widget.dart';
import 'package:payaki/modules/training/trainingList/viewModel/training_list_screen_vm.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class TrainingListScreen extends StatefulWidget {
  final bool isAllPost;

  const TrainingListScreen({Key? key, required this.isAllPost})
      : super(key: key);

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  TrainingListScreenVm trainingListScreenVm = TrainingListScreenVm();

  @override
  void initState() {
    super.initState();
    trainingListScreenVm = Provider.of(context, listen: false);
    trainingListScreenVm.getTraining(
        isAllPost: widget.isAllPost,
        onSuccess: (String value) {},
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: CustomAppBar(
        title: widget.isAllPost == true ? S.of(context).allTraining: S.of(context).myTrainings,
      ),
      body: Consumer<TrainingListScreenVm>(
          builder: (context, trainingListScreenVm, child) {
        var trainingList = trainingListScreenVm.trainingList?.data;
        return trainingListScreenVm.trainingListLoading == true
            ? const CircularProgressWidget()
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: (trainingList?.length ?? 0) > 0
                    ? GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
                        itemCount: trainingList?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 15.w,
                            childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          String? image;
                          if ((trainingList?[index].image?.length ?? 0) > 0) {
                            image = trainingList?[index].image?[0];
                          }
                          return EventTrainingWidget(
                            title: trainingList?[index].productName ?? "",
                            imageUrl: image ?? "",
                            expiredDate: trainingList![index].expiredDate.toString(),
                            isShowDeleteIcon: widget.isAllPost == false,
                            price: trainingList[index].price,
                            onTap: () {

                              Navigator.pushNamed(context, RouteName.trainingDetailsScreen,
                              arguments: {
                                "trainingData": trainingList[index],
                              });



                            },
                            onDeleteIconTap: () {
                              showDeletePostDialog(
                                  onDeleteTap: () {
                                    CommonDialog.showLoadingDialog(context);
                                    trainingListScreenVm.deletePost(
                                        postId: trainingList?[index].id ?? "",
                                        index: index,
                                        onSuccess: (message) {
                                          Navigator.pop(context);
                                          context.flushBarTopSuccessMessage(
                                              message: message);
                                        },
                                        onFailure: (message) {
                                          Navigator.pop(context);
                                          context.flushBarTopErrorMessage(
                                              message: message);
                                        });
                                  },
                                  context: context);
                            },
                          );
                        },
                      )
                    :  NoDataWidget(
                        title: S.of(context).youHaveNotListedAnythingYet,
                      ),
              );
      }),
    );
  }

  Future<dynamic> showDeletePostDialog({
    required BuildContext context,
    required VoidCallback onDeleteTap,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DeleteAlertDialog(
            onDeleteTap: onDeleteTap,
          );
        });
  }
}
