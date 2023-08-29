import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/event/eventDetails/viewModel/event_detail_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/event/event_checkout_request.dart';
import 'package:payaki/network/model/response/event/event_list_response.dart';
import 'package:payaki/network/payment/paypal_payment.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';
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
  num totalAmount = 0;

  String? paymentId;
  String? status;
  String? payerId;

  @override
  void initState() {
    super.initState();
    refreshTicketQuantity();
  }
  refreshTicketQuantity() {
    for (var i = 0; i < (widget.eventList?.event?.length ?? 0); i++) {
      widget.eventList?.event![i].bookQuantity = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<EventDetailScreenVm>(
            builder: (context, eventDetailScreenVm, child) {
          return Column(
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
                                    style: StyleUtility.headingTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize26),
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
                                        return (Preference().getUserId() !=
                                                widget.eventList?.userId)
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h),
                                                child: DottedBorder(
                                                    strokeWidth: 2,
                                                    borderType:
                                                        BorderType.RRect,
                                                    color: ColorUtility
                                                        .colorDEDEDE,
                                                    radius:
                                                        Radius.circular(10.r),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 13.sp,
                                                                    left: 12.w,
                                                                    right: 12.w,
                                                                    bottom:
                                                                        10.sp),
                                                            decoration: BoxDecoration(
                                                                color: ColorUtility
                                                                    .whiteColor,
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(10
                                                                            .r),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10.r))),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        tickets?[index].ticketType ??
                                                                            "",
                                                                        style: StyleUtility
                                                                            .titleTextStyle,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
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
                                                                            .copyWith(fontSize: TextSizeUtility.textSize22),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                      Text(
                                                                        tickets?[index].sellingMode?.toUpperCase() ??
                                                                            "",
                                                                        style: StyleUtility.axiforma500.copyWith(
                                                                            fontSize:
                                                                                TextSizeUtility.textSize16,
                                                                            color: ColorUtility.color152D4A),
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
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          7.h,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            if (tickets![index].bookQuantity! <
                                                                                int.parse(tickets[index].remainingQuantity!)) {
                                                                              tickets[index].bookQuantity = (tickets[index].bookQuantity! + 1);

                                                                              totalAmount = totalAmount + num.parse(tickets[index].ticketPrice!);
                                                                              eventDetailScreenVm.updateUi();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                28.sp,
                                                                            height:
                                                                                28.sp,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(5.r), border: Border.all(color: ColorUtility.color9C5FA3)),
                                                                            child: Center(
                                                                                child: Icon(
                                                                              Icons.add,
                                                                              size: 24.sp,
                                                                              color: ColorUtility.color9C5FA3,
                                                                            )),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 5.w),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(minWidth: 40.sp),
                                                                            child:
                                                                                Text(
                                                                              "${tickets?[index].bookQuantity ?? ""}",
                                                                              style: StyleUtility.titleTextStyle,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              maxLines: 1,
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            if (tickets![index].bookQuantity! >
                                                                                0) {
                                                                              tickets[index].bookQuantity = (tickets[index].bookQuantity! - 1);

                                                                              totalAmount = totalAmount - num.parse(tickets[index].ticketPrice!);

                                                                              eventDetailScreenVm.updateUi();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                28.sp,
                                                                            height:
                                                                                28.sp,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(5.r), border: Border.all(color: ColorUtility.color9C5FA3)),
                                                                            child: Center(
                                                                                child: Icon(
                                                                              Icons.remove,
                                                                              size: 24.sp,
                                                                              color: ColorUtility.color9C5FA3,
                                                                            )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            )),
                                                      ],
                                                    )),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h),
                                                child: DottedBorder(
                                                    strokeWidth: 2,
                                                    borderType:
                                                        BorderType.RRect,
                                                    color: ColorUtility
                                                        .colorDEDEDE,
                                                    radius:
                                                        Radius.circular(10.r),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: ColorUtility
                                                              .whiteColor),
                                                      padding: EdgeInsets.only(
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
                                                            tickets?[index]
                                                                    .ticketType ??
                                                                "",
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
                                                              tickets?[index]
                                                                      .ticketPrice ??
                                                                  "",
                                                            )}",
                                                            style: StyleUtility
                                                                .headingTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        TextSizeUtility
                                                                            .textSize22),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                  child: Text(
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
                                                              )),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    "Quantity",
                                                                    style: StyleUtility
                                                                        .axiforma300
                                                                        .copyWith(
                                                                            fontSize:
                                                                                TextSizeUtility.textSize12,
                                                                            color: ColorUtility.color43576F),
                                                                  ),
                                                                  Text(
                                                                    tickets?[index]
                                                                            .availableQuantity ??
                                                                        "",
                                                                    style: StyleUtility
                                                                        .titleTextStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                TextSizeUtility.textSize16,
                                                                            color: ColorUtility.color152D4A),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                              );
                                      }),
                                  SizedBox(height: 25.h),
                                  (Preference().getUserId() !=
                                              widget.eventList?.userId &&
                                          totalAmount > 0)
                                      ? CustomButton(
                                          buttonText: "Purchase ($totalAmount)",
                                          onTab: () {
                                            if (widget.eventList != null) {
                                              onBuyTickets(widget.eventList!,
                                                  eventDetailScreenVm);
                                            }
                                          })
                                      : const SizedBox(),
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
                        // actions: [
                        //   Padding(
                        //     padding: EdgeInsets.only(right: 22.w),
                        //     child: InkWell(
                        //       onTap: () {
                        //         Share.share("Share");
                        //       },
                        //       child: Image.asset(
                        //         ImageUtility.shareIcon,
                        //         width: 17.w,
                        //       ),
                        //     ),
                        //   )
                        // ],
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
          );
        }));
  }

  onBuyTickets(Data eventData, EventDetailScreenVm eventDetailScreenVm) {
    List<String> ticketIds = [];
    List<String> ticketAmounts = [];
    List<String> ticketQuantity = [];
    int ticketLength = eventData.event?.length ?? 0;
    for (var i = 0; i < ticketLength; i++) {
      if ((eventData.event?[i].bookQuantity ?? 0) > 0) {
        ticketIds.add(eventData.event![i].id!);
        ticketAmounts.add(eventData.event![i].ticketPrice!);
        ticketQuantity.add(eventData.event![i].bookQuantity!.toString());
      }
    }
    logD("Ticket Id is ${ticketIds}");
    logD("Ticket amounts is ${ticketAmounts}");
    logD("Ticket Quantity is ${ticketQuantity}");
    logD("Total amount is ${totalAmount}");

    PayPalPayment().pay(
        context: context,
        amount: totalAmount.toString(),
        onSuccess: (Map params) {
          logD("onSuccess: $params");
          status = params["status"].toString();
          paymentId = params["paymentId"].toString();
          payerId = params["data"]["payer"]["payer_info"]["payer_id"];

          Timer(const Duration(seconds: 1), () {
            CommonDialog.showLoadingDialog(context);
            eventDetailScreenVm.eventCheckout(
                request: EventCheckoutRequest(
                  name: Endpoints.eventEndPoints.checkoutEventPaypal,
                  param: Param(
                      productId: eventData.id,
                      ticketTypeIds: ticketIds,
                      ticketAmounts: ticketAmounts,
                      ticketQuantities: ticketQuantity,
                      totalAmount: totalAmount.toString(),
                      paymentId: paymentId,
                      payerId: payerId,
                      status: status),
                ),
                onSuccess: (String message) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  context.flushBarTopSuccessMessage(message: message);
                },
                onFailure: (String message) {
                  Navigator.pop(context);
                  context.flushBarTopSuccessMessage(message: message);
                });
          });
        },
        onFailure: (String message) {
          context.flushBarTopErrorMessage(message: message.toString());
        });
  }
}
