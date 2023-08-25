import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/network/model/response/event/event_list_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:share_plus/share_plus.dart';

class EventDetailsScreen extends StatefulWidget {
  final Data? eventList;

  const EventDetailsScreen({Key? key, required this.eventList})
      : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  var imageHeight = 330.h;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                            if ((widget.eventList?.image?.length ?? 0) > 0) {
                              Navigator.pushNamed(
                                  context, RouteName.imageViewScreen,
                                  arguments: {
                                    "images": widget.eventList?.image
                                  });
                            }
                          },
                          child: Container(
                            child: (widget.eventList?.image?.length ?? 0) > 0
                                ? NetworkImageWidget(
                                    width: double.infinity,
                                    height: imageHeight,
                                    errorIconSize: 70.sp,
                                    url: widget.eventList?.image![0])
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
                                  widget.eventList?.productName ?? "",
                                  style: StyleUtility.headingTextStyle.copyWith(
                                      fontSize: TextSizeUtility.textSize26),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  "Event Date",
                                  style: StyleUtility.headingTextStyle,
                                ),
                                Text(widget.eventList?.eventDate ?? "",
                                    style: StyleUtility.postDescTextStyle),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  "Description",
                                  style: StyleUtility.headingTextStyle,
                                ),
                                Text(widget.eventList?.description ?? "",
                                    style: StyleUtility.postDescTextStyle),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  "Ticket List",
                                  style: StyleUtility.headingTextStyle,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount:
                                        widget.eventList?.event?.length ?? 0,
                                    padding: EdgeInsets.only(top: 5.h),
                                    itemBuilder: (context, index) {
                                      var tickets = widget.eventList?.event;
                                      return


                                       (Preference().getUserId() !=
                                           widget.eventList?.userId)
                                      ?


                                        Padding(
                                        padding: EdgeInsets.only(bottom: 20.h),
                                        child: DottedBorder(
                                            strokeWidth: 2,
                                            borderType: BorderType.RRect,
                                            color: ColorUtility.colorDEDEDE,
                                            radius: Radius.circular(10.r),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.only(
                                                        top: 13.sp,
                                                        left: 12.w,
                                                        right: 12.w,
                                                        bottom: 10.sp),
                                                    decoration: BoxDecoration(
                                                        color: ColorUtility
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.r),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.r))),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    tickets?[index]
                                                                            .ticketType ??
                                                                        "",
                                                                    style: StyleUtility
                                                                        .titleTextStyle,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines:
                                                                        1,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        7.h,
                                                                  ),
                                                                  Text(
                                                                    "${Constant.currencySymbol} ${CommonMethod.numberFormat(
                                                                      tickets?[index].ticketPrice ??
                                                                          "",
                                                                    )}",
                                                                    style: StyleUtility
                                                                        .headingTextStyle
                                                                        .copyWith(
                                                                            fontSize: TextSizeUtility.textSize22),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines:
                                                                        1,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  "Avai. Quantity : ${tickets?[index].remainingQuantity ?? ""}",
                                                                  style: StyleUtility
                                                                      .titleTextStyle,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                ),
                                                                SizedBox(
                                                                  height: 7.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      width: 28
                                                                          .sp,
                                                                      height:
                                                                          28.sp,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.r),
                                                                          border: Border.all(color: ColorUtility.color9C5FA3)),
                                                                      child: Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .add,
                                                                        size:
                                                                            24.sp,
                                                                        color:
                                                                            ColorUtility.color9C5FA3,
                                                                      )),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.symmetric(horizontal: 15.w),
                                                                      child:
                                                                          Text(
                                                                        "20",
                                                                        style:
                                                                            StyleUtility.titleTextStyle,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 28
                                                                          .sp,
                                                                      height:
                                                                          28.sp,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.r),
                                                                          border: Border.all(color: ColorUtility.color9C5FA3)),
                                                                      child: Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            24.sp,
                                                                        color:
                                                                            ColorUtility.color9C5FA3,
                                                                      )),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          tickets?[index]
                                                                  .sellingMode
                                                                  ?.toUpperCase() ??
                                                              "",
                                                          style: StyleUtility
                                                              .axiforma500
                                                              .copyWith(
                                                                  fontSize:
                                                                      TextSizeUtility
                                                                          .textSize16,
                                                                  color: ColorUtility
                                                                      .color152D4A),
                                                        ),
                                                      ],
                                                    )),
                                                Container(
                                                  color: ColorUtility
                                                      .colorE2E5EF,
                                                  height: 1,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(
                                                      top: 13.sp,
                                                      left: 12.w,
                                                      right: 12.w,
                                                      bottom: 10.sp),
                                                  decoration: BoxDecoration(
                                                      color: ColorUtility
                                                          .colorF8FAFB,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10.r),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      10.r))),
                                                  child: CustomButton.withIcon(
                                                      buttonText:
                                                          "Add to Cart",
                                                      image: ImageUtility
                                                          .addToCartIcon,
                                                      buttonHeight:
                                                          TextSizeUtility
                                                              .smallHeightButtonHeight,
                                                      onTab: () {}),
                                                )
                                              ],
                                            )),
                                      ):

                                            Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.h),
                                            child: DottedBorder(
                                                strokeWidth: 2,
                                                borderType:
                                                    BorderType.RRect,
                                                color: ColorUtility
                                                    .colorDEDEDE,
                                                radius: Radius.circular(
                                                    10.r),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  10.r),
                                                      color: ColorUtility
                                                          .whiteColor),
                                                  padding:
                                                      EdgeInsets.only(
                                                          top: 12.sp,
                                                          bottom: 12.sp,
                                                          left: 13.w,
                                                          right: 13.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        tickets?[index].ticketType ?? "",
                                                        style: StyleUtility
                                                            .titleTextStyle,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      SizedBox(
                                                        height: 7.h,
                                                      ),
                                                      Text(
                                                        "${Constant.currencySymbol} ${CommonMethod.numberFormat(
                                                          tickets?[index].ticketPrice ?? "",)}",
                                                        style: StyleUtility
                                                            .headingTextStyle
                                                            .copyWith(
                                                                fontSize:
                                                                    TextSizeUtility.textSize22),
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child:
                                                                  Text(
                                                            tickets?[index]
                                                                .sellingMode
                                                                ?.toUpperCase() ??
                                                            "",
                                                            style: StyleUtility.axiforma500.copyWith(
                                                                fontSize: TextSizeUtility
                                                                    .textSize16,
                                                                color:
                                                                    ColorUtility.color152D4A),
                                                          )),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "Quantity",
                                                                style: StyleUtility.axiforma300.copyWith(
                                                                    fontSize: TextSizeUtility.textSize12,
                                                                    color: ColorUtility.color43576F),
                                                              ),
                                                              Text(
                                                                tickets?[index]
                                                                    .availableQuantity ??
                                                                "",
                                                                style: StyleUtility.titleTextStyle.copyWith(
                                                                    fontSize: TextSizeUtility.textSize16,
                                                                    color: ColorUtility.color152D4A),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          )

                                          ;
                                    }),
                                SizedBox(height: 25.h),
                                SizedBox(
                                  height: 5.h,
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
                              Share.share("Share");
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
