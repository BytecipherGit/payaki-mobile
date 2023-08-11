import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/addTraining/viewModel/training_promo_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'dart:async';

class TrainingPromoScreen extends StatefulWidget {
  const TrainingPromoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingPromoScreen> createState() => _TrainingPromoScreenState();
}

class _TrainingPromoScreenState extends State<TrainingPromoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Training",
      ),
      body: Consumer<TrainingPromoScreenVm>(
        builder: (context, trainingPromoScreenVm,child) {
          return SafeArea(
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
                            "Promo Image",
                            style: StyleUtility.headingTextStyle,
                          ),
                          SizedBox(height: 25.h),
                          UploadImageWidget(
                              onTap: () {
                                trainingPromoScreenVm.getImages();
                              },
                              title: "Attach File"),
                          if (trainingPromoScreenVm.selectedImages != null)
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.r),
                                    child: Image.file(
                                      File(trainingPromoScreenVm.selectedImages?.path ?? ""),
                                      fit: BoxFit.cover,
                                      height: 85.sp,
                                      width: 85.sp,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      trainingPromoScreenVm.removeImage();
                                    },
                                    child: Container(
                                      height: 85.sp,
                                      width: 85.sp,
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
                            ),
                          SizedBox(height: 23.h),
                          Text(
                            "Promo Video",
                            style: StyleUtility.headingTextStyle,
                          ),
                          SizedBox(height: 25.h),
                          UploadImageWidget(
                            onTap: () {
                              trainingPromoScreenVm.getVideo();
                            },
                            title: "Attach File",
                            type: Constant.videoFile,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (trainingPromoScreenVm.selectedVideo != null)
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5.r),
                                    child:
                                        // Image.file(
                                        //   File(selectedImages?.path ?? ""),
                                        //   fit: BoxFit.cover,
                                        //   height: 85.sp,
                                        //   width: 85.sp,
                                        // ),
                                    trainingPromoScreenVm.thumbnailPath.isNotEmpty
                                            ? Image.file(
                                                File(trainingPromoScreenVm.thumbnailPath),
                                                height: 85.sp,
                                                width: 85.sp,
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                width: 85.0,
                                                height: 85.0,
                                                color: ColorUtility.colorB3B3B3,
                                                child: Center(
                                                    child: Text(
                                                  "Video",
                                                  style: StyleUtility.inputTextStyle
                                                      .copyWith(
                                                          color: Colors.white),
                                                )),
                                              )),
                                InkWell(
                                  onTap: () {

                                    trainingPromoScreenVm.removeVideo();

                                  },
                                  child: Container(
                                    height: 85.sp,
                                    width: 85.sp,
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
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                      buttonText: "Next",
                      onTab: () {
                        if (trainingPromoScreenVm.selectedImages == null) {
                          context.flushBarTopErrorMessage(
                              message: "Please Upload Promo Image.");
                        } else if (trainingPromoScreenVm.selectedVideo == null) {
                          context.flushBarTopErrorMessage(
                              message: "Please Upload Promo Video.");
                        } else {
                          Navigator.pushNamed(
                              context, RouteName.trainingGalleryScreen);
                        }
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

enum FileType { video }
