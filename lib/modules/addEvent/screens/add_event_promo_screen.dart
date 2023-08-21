import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/addEvent/viewModel/add_event_promo_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:provider/provider.dart';


class AddEventPromoScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String description;
  final String eventDate;
  final String eventTime;



  const AddEventPromoScreen({
    Key? key, required this.catId, required this.subCatId, required this.title, required this.description, required this.eventDate, required this.eventTime,
  }) : super(key: key);

  @override
  State<AddEventPromoScreen> createState() => _AddEventPromoScreenState();
}

class _AddEventPromoScreenState extends State<AddEventPromoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Event",
      ),
      body: Consumer<AddEventPromoScreenVm>(
          builder: (context, addEventPromoScreenVm,child) {
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
                                  addEventPromoScreenVm.getImages();
                                },
                                title: "Attach File"),
                            if (addEventPromoScreenVm.selectedImages != null)
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child: Image.file(
                                        File(addEventPromoScreenVm.selectedImages?.path ?? ""),
                                        fit: BoxFit.cover,
                                        height: 85.sp,
                                        width: 85.sp,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        addEventPromoScreenVm.removeImage();
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
                                addEventPromoScreenVm.getVideo();
                              },
                              title: "Attach File",
                              type: Constant.videoFile,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            if (addEventPromoScreenVm.selectedVideo != null)
                              Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child:
                                      addEventPromoScreenVm.thumbnailPath.isNotEmpty
                                          ? Image.file(
                                        File(addEventPromoScreenVm.thumbnailPath),
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

                                      addEventPromoScreenVm.removeVideo();

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
                          if (addEventPromoScreenVm.selectedImages == null) {
                            context.flushBarTopErrorMessage(
                                message: "Please Upload Promo Image.");
                          } else if (addEventPromoScreenVm.selectedVideo == null) {
                            context.flushBarTopErrorMessage(
                                message: "Please Upload Promo Video.");
                          } else {
                            Navigator.pushNamed(
                                context, RouteName.addEventTicketScreen,
                            arguments: {
                              "catId": widget.catId,
                              "subCatId": widget.subCatId,
                              "title": widget.title,
                              "description": widget.description,
                              "eventDate": widget.eventDate,
                              "eventTime": widget.eventTime,
                              "promoImage":addEventPromoScreenVm.selectedImages,
                              "promoVideo":addEventPromoScreenVm.selectedVideo,
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
          }
      ),
    );
  }
}

enum FileType { video }
