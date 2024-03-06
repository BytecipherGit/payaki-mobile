import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/modules/myAds/viewModel/my_ads_screen_vm.dart';
import 'package:payaki/network/model/response/profile/transaction_list_response.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';

import '../../../generated/l10n.dart';

class TransactionDetailScreen extends StatefulWidget {
  final Data? transaction;
  final EventList? eventListItem;
  final PurchasedList? purchasedListItem;

  const TransactionDetailScreen({Key? key, this.transaction, this.eventListItem, this.purchasedListItem}) : super(key: key);

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  MyAdsScreenVm myAdsScreenVm = MyAdsScreenVm();

  String type = "AdPost";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar:  CustomAppBar(title: S.of(context).transactionDetail),
      body:builtContent(eventListItem: widget.eventListItem,purchasedListItem: widget.purchasedListItem,transaction: widget.transaction)
   ,
    );
  }

 builtContent({
    Data? transaction,
    EventList? eventListItem,
    PurchasedList? purchasedListItem,
  }){
if(transaction!=null)
  { return Container(
   width: double.infinity,
   margin:
   EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h, top: 25.h),
   padding:
   EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 57.h),
   decoration: BoxDecoration(
       color: ColorUtility.whiteColor,
       borderRadius: BorderRadius.circular(10.r)),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisSize: MainAxisSize.min,
     children: [
       Text(S
           .of(context)
           .title, style: StyleUtility.titleTextStyle),
       Text(
         widget.transaction?.productName ?? "",
         style: StyleUtility.headingTextStyle
             .copyWith(color: ColorUtility.color43576F),
       ),
       SizedBox(
         height: 15.sp,
       ),
       Text(S
           .of(context)
           .amount, style: StyleUtility.titleTextStyle),
       Text(
         "${Constant.currencySymbol} ${CommonMethod.numberFormat(
             widget.transaction?.amount ?? "")}",
         style: StyleUtility.headerTextStyle.copyWith(
             fontSize: TextSizeUtility.textSize18,
             color: ColorUtility.color43576F),
       ),
       SizedBox(
         height: 15.sp,
       ),
       type == "AdPost"
           ? Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
           Text(S
               .of(context)
               .premium, style: StyleUtility.titleTextStyle),
           Wrap(
             alignment: WrapAlignment.end,
             children: [
               if (widget.transaction?.urgent == "1")
                 Text(
                   S
                       .of(context)
                       .urgent,
                   style: StyleUtility.headingTextStyle.copyWith(
                     color: ColorUtility.color5DB85C,
                   ),
                 ),
               if (widget.transaction?.featured == "1")
                 Padding(
                   padding: EdgeInsets.only(left: 10.w),
                   child: Text(
                     S
                         .of(context)
                         .featured,
                     style: StyleUtility.headingTextStyle.copyWith(
                       color: ColorUtility.colorF1AD4E,
                     ),
                   ),
                 ),
               if (widget.transaction?.highlight == "1")
                 Padding(
                   padding: EdgeInsets.only(left: 10.w),
                   child: Text(
                     S
                         .of(context)
                         .highlight,
                     style: StyleUtility.headingTextStyle.copyWith(
                       color: ColorUtility.color5BC1DF,
                     ),
                   ),
                 ),
             ],
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .paymentMethod,
               style: StyleUtility.titleTextStyle),
           Text(
             widget.transaction?.transactionGatway ?? "",
             style: StyleUtility.headingTextStyle
                 .copyWith(color: ColorUtility.color43576F),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .date, style: StyleUtility.titleTextStyle),
           Text(
             //  "22/02/2023",
             widget.transaction?.transactionTime ?? "",
             style: StyleUtility.headingTextStyle
                 .copyWith(color: ColorUtility.color43576F),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .status, style: StyleUtility.titleTextStyle),
           Text(
             widget.transaction?.status?.toUpperCase() ?? "",
             style: StyleUtility.headingTextStyle
                 .copyWith(
                 color: widget.transaction?.status.toString() == "success"
                     ? ColorUtility
                     .color06C972
                     : Colors.red),
           ),
         ],
       )
           :
       // Training traction detail ui
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
           Text(S
               .of(context)
               .phoneNumber, style: StyleUtility.titleTextStyle),
           Text(
             "+244812024778",
             style: StyleUtility.headingTextStyle
                 .copyWith(color: ColorUtility.color43576F),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .descriptionDetail, style: StyleUtility.titleTextStyle),
           Text(
             "Lorem ipsum dolor sit ame lorem ipsum dolor sit ame lorem ipsum dolor sit ame lorem ipsum dolor sit ame",
             style: StyleUtility.headingTextStyle
                 .copyWith(color: ColorUtility.color43576F),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .date, style: StyleUtility.titleTextStyle),
           Text(
             widget.transaction?.transactionTime ?? "",
             style: StyleUtility.headingTextStyle
                 .copyWith(color: ColorUtility.color43576F),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .status, style: StyleUtility.titleTextStyle),
           Text(
             widget.transaction?.status?.toUpperCase() ?? "",
             style: StyleUtility.headingTextStyle
                 .copyWith(
                 color: widget.transaction?.status.toString() == "success"
                     ? ColorUtility
                     .color06C972
                     : Colors.red),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .image, style: StyleUtility.titleTextStyle),
           ClipRRect(
             borderRadius: BorderRadius.circular(5.r),
             child: Image.asset(
               ImageUtility.productImage,
               width: 85.w,
               height: 85.w,
               fit: BoxFit.cover,
             ),
           ),
           SizedBox(
             height: 15.sp,
           ),
           Text(S
               .of(context)
               .video, style: StyleUtility.titleTextStyle),
           ClipRRect(
             borderRadius: BorderRadius.circular(5.r),
             child: Image.asset(
               ImageUtility.productImage,
               width: 85.w,
               height: 85.w,
               fit: BoxFit.cover,
             ),
           )
         ],
       )
     ],
   ),
 );
  }
if(eventListItem!=null){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40.h),
    margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 15.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 9.h,
              bottom: 17.h),
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
              SizedBox(
                height: 7.sp,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    eventListItem
                        .eventTitle,
                    style: StyleUtility
                        .headerTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize14),
                  ),
                  Text(Moment( eventListItem
                      .transactionTime).fromNow()
                      ??
                      "",
                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        color: ColorUtility
                            .color8B97A4),
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: 1.0,
                color: ColorUtility
                    .colorE2E5EF,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Flexible(flex:5,
                    child: Text(
                      S.of(context).tickedAdded,
                      style: StyleUtility
                          .headingTextStyle
                          .copyWith(
                          fontSize:
                          TextSizeUtility.textSize15),
                      overflow:
                      TextOverflow
                          .ellipsis,
                    ),
                  ),
                  Flexible(flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).quantity,
                          style: StyleUtility
                              .headingTextStyle
                              .copyWith(
                              fontSize:
                              TextSizeUtility.textSize15),
                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                        Text(
                          S.of(context).amount,
                          style: StyleUtility
                              .headerTextStyle
                              .copyWith(
                              fontSize:
                              TextSizeUtility.textSize16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 7.sp,
              ),
              Container(
                height: 1.0,
                color: ColorUtility
                    .colorE2E5EF,
              ),
              SizedBox(
                height: 7.sp,
              ),
              ListView.builder(
                shrinkWrap: true,padding: EdgeInsets.all(0),
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: eventListItem.tickets.length,
                itemBuilder: (context,
                    productIndex) {
                  return Column(

                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Flexible(flex:5,
                            child: Text(
                              eventListItem.tickets[productIndex].ticketType,
                              style: StyleUtility
                                  .titleTextStyle
                                  .copyWith(
                                  fontSize:
                                  TextSizeUtility.textSize15),
                              overflow:
                              TextOverflow
                                  .ellipsis,
                            ),
                          ),
                          Flexible(flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  eventListItem.tickets[productIndex].quantity,
                                  style: StyleUtility
                                      .titleTextStyle
                                      .copyWith(
                                      fontSize:
                                      TextSizeUtility.textSize15),
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                ),
                                Text(
                                  "${Constant.currencySymbol} ${CommonMethod.numberFormat( eventListItem.tickets[productIndex].amount ?? "")}",
                                  style: StyleUtility
                                      .headerTextStyle
                                      .copyWith(
                                      fontSize:
                                      TextSizeUtility.textSize16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if(eventListItem.tickets.last!=eventListItem.tickets[productIndex])  Container(
                        height: 1.0,
                        color: ColorUtility
                            .colorE2E5EF,
                      ),
                      if(eventListItem.tickets.last!=eventListItem.tickets[productIndex]) SizedBox(
                        height: 7.sp,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
        Container(
          height: 1.0,
          color:
          ColorUtility.colorE2E5EF,
        ),
        Container(
          padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 9.h,
              bottom: 7.h),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    S
                        .of(context)
                        .paymentMethod
                        .toUpperCase(),
                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                  Text(
                    S
                        .of(context)
                        .status
                        .toUpperCase(),
                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    eventListItem
                        .transactionGatway ??
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
                  Text(
                    eventListItem
                        .status
                        .toUpperCase() ??
                        "",
                    style: StyleUtility
                        .axiforma500
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize16,
                        color:eventListItem
                            .status ==
                            "success"
                            ? ColorUtility
                            .color06C972
                            : Colors
                            .red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
if(purchasedListItem!=null){
  return  Container(
    padding: EdgeInsets.symmetric(vertical: 40.h),
    margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 15.h),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 9.h,
              bottom: 17.h),
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
              SizedBox(
                height: 7.sp,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .end,
                children: [
                  // Text(
                  //   S
                  //       .of(context)
                  //       .time
                  //       .toUpperCase(),
                  //   style: StyleUtility
                  //       .headingTextStyle
                  //       .copyWith(
                  //       fontSize:
                  //       TextSizeUtility
                  //           .textSize12),
                  // ),
                  Text(Moment.parse(purchasedListItem
                      .transactionTime.toString()).fromNow(),

                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        color: ColorUtility
                            .color8B97A4),
                  ),
                ],
              ),

              SizedBox(
                height: 15.sp,
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    S
                        .of(context)
                        .productName
                        .toUpperCase(),
                    style: StyleUtility
                        .headingTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                  Text(
                    S
                        .of(context)
                        .amount
                        .toUpperCase(),
                    style: StyleUtility
                        .headingTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                ],
              ),
              SizedBox(
                height: 7.sp,
              ),
              Container(
                height: 1.0,
                color: ColorUtility
                    .colorE2E5EF,
              ),
              SizedBox(
                height: 7.sp,
              ),
              ListView.builder(
                shrinkWrap: true,padding: EdgeInsets.all(0),
                physics:
                const ClampingScrollPhysics(),
                itemCount: purchasedListItem.products.length,
                itemBuilder: (context,
                    productIndex) {
                  return Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                            '${  purchasedListItem.products[productIndex].productName.toString()[0].toUpperCase()}${ purchasedListItem.products[productIndex].productName.toString().substring(1)}'
                            ,
                            style: StyleUtility
                                .titleTextStyle
                                .copyWith(
                                fontSize:
                                TextSizeUtility.textSize15),
                            overflow:
                            TextOverflow
                                .ellipsis,
                          ),
                          Text(
                            "${Constant.currencySymbol} ${CommonMethod.numberFormat( purchasedListItem.products[productIndex].amount ?? "")}",
                            style: StyleUtility
                                .headerTextStyle
                                .copyWith(
                                fontSize:
                                TextSizeUtility.textSize22),
                          )
                        ],
                      ),
                      if(purchasedListItem.products.last!=purchasedListItem.products[productIndex])  Container(
                        height: 1.0,
                        color: ColorUtility
                            .colorE2E5EF,
                      ),
                      if(purchasedListItem.products.last!=purchasedListItem.products[productIndex])  SizedBox(
                        height: 7.sp,
                      ),

                    ],
                  );
                },
              )
            ],
          ),
        ),
        Container(
          height: 1.0,
          color:
          ColorUtility.colorE2E5EF,
        ),
        Container(
          padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 9.h,
              bottom: 7.h),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    S
                        .of(context)
                        .paymentMethod
                        .toUpperCase(),
                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                  Text(
                    S
                        .of(context)
                        .status
                        .toUpperCase(),
                    style: StyleUtility
                        .titleTextStyle
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    purchasedListItem
                        .transactionGatway ??
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
                  Text(
                    purchasedListItem
                        .status
                        .toUpperCase() ??
                        "",
                    style: StyleUtility
                        .axiforma500
                        .copyWith(
                        fontSize:
                        TextSizeUtility
                            .textSize16,
                        color:purchasedListItem
                            .status ==
                            "success"
                            ? ColorUtility
                            .color06C972
                            : Colors
                            .red ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
 }
}
