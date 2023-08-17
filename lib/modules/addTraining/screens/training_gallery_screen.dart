import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/addTraining/viewModel/training_gallery_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/add_training_video_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:provider/provider.dart';

class TrainingGalleryScreen extends StatefulWidget {

  final String productId;
  const TrainingGalleryScreen({
    Key? key, required this.productId,
  }) : super(key: key);

  @override
  State<TrainingGalleryScreen> createState() => _TrainingGalleryScreenState();
}

class _TrainingGalleryScreenState extends State<TrainingGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Training",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Consumer<TrainingGalleryScreenVm>(
              builder: (context, trainingGalleryScreenVm, child) {
            return Column(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 23.h),
                      Text(
                        "Gallery",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      UploadImageWidget(
                        onTap: () {
                          trainingGalleryScreenVm.getVideos();
                        },
                        title: "Attach File",
                        type: Constant.videoFile,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (trainingGalleryScreenVm.selectedVideos != null)
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.file(
                                File(trainingGalleryScreenVm.thumbnailPath ??
                                    ""),
                                fit: BoxFit.cover,
                                height: 85,
                                width: 85,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                trainingGalleryScreenVm.removeVideo();
                              },
                              child: Container(
                                height: 85,
                                width: 85,
                                alignment: Alignment.topRight,
                                padding: EdgeInsets.all(3.sp),
                                child: Image.asset(
                                  ImageUtility.removeImage,
                                  width: 15.w,
                                ),
                              ),
                            )
                          ],
                        ),
                    ])),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    buttonText: "Upload",
                    onTab: () {
                      if (trainingGalleryScreenVm.selectedVideos == null) {
                        context.flushBarTopErrorMessage(
                            message: "Please Select Images.");
                      } else {
                        CommonDialog.showLoadingDialog(context);

                        trainingGalleryScreenVm.uploadVideo(
                            request: AddTrainingVideoRequest(
                              name: Endpoints.trainingEndPoints.addTrainingVideo,
                              maxSize: "500",
                              productId: widget.productId
                            ),
                            onSuccess: (String message) {
                              Navigator.pop(context);
                              trainingGalleryScreenVm.removeVideo();
                              context.flushBarTopSuccessMessage(
                                  message: message);
                            },
                            onFailure: (value) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: value);
                            });
                      }
                    }),
                SizedBox(
                  height: 20.h,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
