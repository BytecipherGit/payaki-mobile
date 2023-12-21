import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/add_review_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';
import '../../../../generated/l10n.dart';
import '../viewModel/add_review_screen_vm.dart';

class AddReviewScreen extends StatefulWidget {
  final String postId;

  const AddReviewScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController descriptionController = TextEditingController();

  int? selectRating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar:  CustomAppBar(
        title:S.of(context).review,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 23.h),
                      Text(
                        S.of(context).addYourReview,
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 15.h),
                      Text(S.of(context).howWouldYouRateThisProduct,
                          style: StyleUtility.reviewTitleTextStyle),
                      SizedBox(height: 15.h),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => const Icon(Icons.star,
                            color: ColorUtility.colorFFA500),
                        onRatingUpdate: (rating) {
                          selectRating = rating.toInt();
                          logD(rating);
                        },
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: descriptionController,
                        hintText:S.of(context).yourReviews,
                        titleText: S.of(context).review,
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<AddReviewScreenVm>(
                  builder: (context, addReviewScreenVm, child) {
                return CustomButton(
                    buttonText: S.of(context).submitReview,
                    onTab: () {
                      if (descriptionController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message:S.of(context).pleaseEnterYourReviews);
                      } else {
                        CommonDialog.showLoadingDialog(context);
                        addReviewScreenVm.addReview(
                          request: AddReviewRequest(
                              name: Endpoints.reviewEndPoints.addReview,
                              param: Param(
                                  userId: Preference().getUserId(),
                                  productId: widget.postId,
                                  rating: selectRating.toString(),
                                  comment: descriptionController.text)),
                          onSuccess: (message) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            context.flushBarTopSuccessMessage(message: message);
                          },
                          onFailure: (message) {
                            Navigator.pop(context);
                            context.flushBarTopErrorMessage(message: message);
                          },
                        );
                      }
                    });
              }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
