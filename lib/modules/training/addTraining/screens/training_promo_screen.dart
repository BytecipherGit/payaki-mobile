import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/training/addTraining/viewModel/training_promo_screen_vm.dart';
import 'package:payaki/network/model/response/post/add_post_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class TrainingPromoScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String description;
  final String price;
  final String location;
  final String city;
  final String country;
  final String latlong;
  final String state;
  final String phone;
  final int availableDays;

  const TrainingPromoScreen({
    Key? key,
    required this.catId,
    required this.subCatId,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.city,
    required this.country,
    required this.latlong,
    required this.state,
    required this.phone,
    required this.availableDays,
  }) : super(key: key);

  @override
  State<TrainingPromoScreen> createState() => _TrainingPromoScreenState();
}

class _TrainingPromoScreenState extends State<TrainingPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar:  CustomAppBar(
        title: S.of(context).training,
      ),
      body: Consumer<TrainingPromoScreenVm>(
          builder: (context, trainingPromoScreenVm, child) {
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
                          S.of(context).promoImage,
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(height: 25.h),
                        UploadImageWidget(
                            onTap: () {
                              trainingPromoScreenVm.getImages();
                            },
                            title: S.of(context).attachFile),
                        if (trainingPromoScreenVm.selectedImages != null)
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: Image.file(
                                    File(trainingPromoScreenVm
                                            .selectedImages?.path ??
                                        ""),
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
                          S.of(context).promoVideo,
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(height: 25.h),
                        UploadImageWidget(
                          onTap: () {
                            trainingPromoScreenVm.getVideo();
                          },
                          title: S.of(context).attachFile,
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
                                      trainingPromoScreenVm
                                              .thumbnailPath.isNotEmpty
                                          ? Image.file(
                                              File(trainingPromoScreenVm
                                                  .thumbnailPath),
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
                                                    S.of(context).video,
                                                style: StyleUtility
                                                    .inputTextStyle
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
                    buttonText: S.of(context).next,
                    onTab: () {
                      if (trainingPromoScreenVm.selectedImages == null) {
                        context.flushBarTopErrorMessage(
                            message:S.of(context).pleaseUploadPromoImage);
                      } else if (trainingPromoScreenVm.selectedVideo == null) {
                        context.flushBarTopErrorMessage(
                            message: S.of(context).pleaseUploadPromoVideo);
                      } else {
                        CommonDialog.showLoadingDialog(context);
                        trainingPromoScreenVm.addPostApi(
                            images: trainingPromoScreenVm.selectedImages!,
                            video: trainingPromoScreenVm.selectedVideo!,
                            productName: widget.title,
                            description: widget.description,
                            categoryId: widget.catId,
                            subCategoryId: widget.subCatId,
                            price: widget.price,
                            location: widget.location,
                            city: widget.city,
                            country: widget.country,
                            latlong: widget.latlong,
                            state: widget.state,
                            phone: widget.phone,
                            availableDays: widget.availableDays.toString(),
                            amount: widget.price,
                            onSuccess: (AddPostResponse response) {
                              Navigator.pop(context);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteName.bottomNavigationBarScreen,
                                // Replace with the route name of your dashboard screen
                                (route) => false,
                              );
                              Navigator.pushNamed(
                                  context, RouteName.trainingGalleryScreen,
                                  arguments: {"product_id": response.data.id});

                              context.flushBarTopSuccessMessage(
                                  message: response.message ?? "");
                            },
                            onFailure: (value) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: value);
                            });
                      }
                    }),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
