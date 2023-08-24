import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/widgets/event_training_widget.dart';
import 'package:payaki/modules/training/trainingList/viewModel/training_list_screen_vm.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

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
        title: widget.isAllPost == true ? "All Training" : "My Training",
      ),
      body: Consumer<TrainingListScreenVm>(
          builder: (context, trainingListScreenVm, child) {
        var eventList = trainingListScreenVm.trainingList?.data;
        return trainingListScreenVm.trainingListLoading == true
            ? const CircularProgressWidget()
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: (eventList?.length ?? 0) > 0
                    ? GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
                        itemCount: eventList?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 15.w,
                            childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          String? image;
                          if ((eventList?[index].image?.length ?? 0) > 0) {
                            image = eventList?[index].image?[0];
                          }
                          return EventTrainingWidget(
                            title: eventList?[index].productName ?? "",
                            imageUrl: image ?? "",
                            expiredDate: eventList?[index].expiredDate,
                            isShowDeleteIcon: widget.isAllPost == false,
                            price: eventList?[index].price,
                            onTap: () {},
                            onDeleteIconTap: () {},
                          );
                        },
                      )
                    : const NoDataWidget(
                        title: 'You haven’t listed anything yet.',
                      ),
              );
      }),
    );
  }
}
