import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/network/model/response/training/training_list_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TrainingDetailsScreen extends StatefulWidget {
  final Data? trainingData;

  const TrainingDetailsScreen({Key? key, this.trainingData}) : super(key: key);

  @override
  State<TrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {
  var imageHeight = 330.h;
  String promoVideoThumbnailPath = '';

  @override
  void initState() {
    super.initState();
    loadThumbnail();
  }

  loadThumbnail() async {
    if (widget.trainingData?.promoVideo != null &&
        widget.trainingData?.promoVideo != "") {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: widget.trainingData?.promoVideo ?? "",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        maxHeight: 64,
        quality: 75,
      );
      promoVideoThumbnailPath = fileName!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((widget.trainingData?.image?.length ?? 0) > 0) {
                          Navigator.pushNamed(
                              context, RouteName.imageViewScreen, arguments: {
                            "images": widget.trainingData?.image
                          });
                        }
                      },
                      child: Container(
                        child: (widget.trainingData?.image?.length ?? 0) > 0
                            ? NetworkImageWidget(
                                width: double.infinity,
                                height: imageHeight,
                                errorIconSize: 70.sp,
                                url: widget.trainingData?.image![0])
                            : SizedBox(
                                height: imageHeight,
                                child: Container(
                                  color: ColorUtility.colorEFEFEF,
                                  child: Center(
                                    child: Icon(
                                      Icons.image_not_supported_rounded,
                                      color: ColorUtility.color43576F,
                                      size: 70.sp,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SafeArea(
                        top: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Constant.currencySymbol} ${CommonMethod.numberFormat(widget.trainingData?.price ?? "")}",
                              style: StyleUtility.headingTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize26),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.trainingData?.productName ?? "",
                                    style: StyleUtility.postDescTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize18,
                                            color: ColorUtility.color43576F),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                if (widget.trainingData?.createdAt != null)
                                  Text(
                                    Moment(DateTime.parse(
                                            widget.trainingData!.createdAt!))
                                        .fromNow(),
                                    style: StyleUtility.postDescTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize12),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Location",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ImageUtility.locationIcon,
                                  width: 12.5.w,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Expanded(
                                  child: Text(
                                      widget.trainingData?.fullAddress ?? "",
                                      style: StyleUtility.postDescTextStyle),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Description",
                              style: StyleUtility.headingTextStyle,
                            ),
                            Text(widget.trainingData?.description ?? "",
                                style: StyleUtility.postDescTextStyle),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Posted By",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageUtility.userDummyIcon,
                                        width: 60.w,
                                        height: 60.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.trainingData
                                                      ?.postUserName ??
                                                  "",
                                              style: StyleUtility
                                                  .headingTextStyle
                                                  .copyWith(
                                                      color: ColorUtility
                                                          .color43576F),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                  color: ColorUtility.color43576F,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Expire Ad",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (widget.trainingData?.expiredDate != null)
                              Text(
                                  Moment(DateTime.parse(
                                          widget.trainingData!.expiredDate!))
                                      .fromNow(),
                                  style: StyleUtility.postDescTextStyle),
                            if (Preference().getUserId() ==
                                widget.trainingData?.userId)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Text(
                                    "Video Gallery",
                                    style: StyleUtility.headingTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 90.w,
                                    child: ListView.builder(
                                        itemCount: widget.trainingData?.gallery
                                                ?.length ??
                                            0,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(right: 15.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              child: Image.asset(
                                                ImageUtility.videoThumbnail,
                                                width: 85.w,
                                                height: 85.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Text(
                              "Promo Video",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            // promoVideoThumbnailPath.isNotEmpty
                            //     ? ClipRRect(
                            //         borderRadius: BorderRadius.circular(5.r),
                            //         child: Image.file(
                            //           File(promoVideoThumbnailPath),
                            //           height: 85.sp,
                            //           width: 85.sp,
                            //           fit: BoxFit.cover,
                            //         ),
                            //       )
                            //     : const SizedBox(),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.asset(
                                ImageUtility.videoThumbnail,
                                width: 85.w,
                                height: 85.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 90,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 22.w),
                      child: InkWell(
                        onTap: () {
                          Share.share(widget.trainingData?.productName ?? "");
                        },
                        child: Image.asset(
                          ImageUtility.shareIcon,
                          width: 17.w,
                        ),
                      ),
                    )
                  ],
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorUtility.color844193,
                          ColorUtility.color844193.withOpacity(0.5),
                          Colors.transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
