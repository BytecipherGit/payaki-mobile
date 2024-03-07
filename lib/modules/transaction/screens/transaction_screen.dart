import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/transaction/viewModel/transaction_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionScreenVm transactionScreenVm = TransactionScreenVm();

  @override
  void initState() {
    super.initState();
    transactionScreenVm =
        Provider.of<TransactionScreenVm>(context, listen: false);
    transactionScreenVm.getTransactionList(onFailure: (message) {
      // Navigator.pop(context);
      context.flushBarTopErrorMessage(message: message);
    });
    transactionScreenVm.getTransactionEventList(onFailure: (message) {
      // Navigator.pop(context);
      context.flushBarTopErrorMessage(message: message);
    });
    transactionScreenVm.getTransactionPurchasedList(onFailure: (message) {
      // Navigator.pop(context);
      context.flushBarTopErrorMessage(message: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: ColorUtility.colorF6F6F6,
          appBar: CustomAppBar(title: S.of(context).transactionHistory),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  unselectedLabelColor: ColorUtility.color8B97A4,
                  labelColor: ColorUtility.color152D4A,
                  labelStyle: StyleUtility.inputTextStyle,
                  unselectedLabelStyle: StyleUtility.hintTextStyle,
                  indicatorColor: ColorUtility.color152D4A,
                  tabs: [
                    Tab(
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorUtility.colorE2E5EF))),
                          child: Center(
                              child: Text(
                            S.of(context).purchased,
                            textAlign: TextAlign.center,
                          ))),
                    ),
                    Tab(
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorUtility.colorE2E5EF))),
                          child: Center(
                              child: Text(
                            S.of(context).myAd,
                            textAlign: TextAlign.center,
                          ))),
                    ),
                    Tab(
                      child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorUtility.colorE2E5EF))),
                          child: Center(
                              child: Text(
                            S.of(context).eventAddTicket,
                            textAlign: TextAlign.center,
                          ))),
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer<TransactionScreenVm>(
                      builder: (context, model, child) {
                    var transactionList =model.transactionListResponse==null?[] : model.transactionListResponse!.data;
                    var eventList =model.eventHistoryResponse==null?[]: model.eventHistoryResponse!.data==null?[]: model.eventHistoryResponse!.data!.eventList;
                    var purchasedList = model.purchasedHistoryResponse==null?[]:model.purchasedHistoryResponse!.data==null?[]:model.purchasedHistoryResponse!.data!.purchasedList;
                    return Container(
                      color: ColorUtility.colorF6F6F6,
                      child: TabBarView(
                        children: [
                          model.isLoading == true
                              ? const Center(
                                  child: CircularProgressWidget(),
                                )
                              : (purchasedList.length ?? 0) > 0
                                  ? ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          top: 25.h, bottom: 50.h),
                                      itemCount: purchasedList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context,
                                                RouteName
                                                    .transactionDetailScreen,
                                                arguments: {
                                                  "purchased":
                                                      purchasedList[index],
                                                  "event": null,
                                                  "transaction": null,
                                                });
                                          },
                                          child: Container(
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
                                                      Text(Moment.parse(purchasedList[index]
                                                          .transactionTime.toString()).fromNow(),

                                                        style: StyleUtility
                                                            .titleTextStyle
                                                            .copyWith(
                                                                color: ColorUtility
                                                                    .color8B97A4),
                                                      ),
                                                      SizedBox(
                                                        height: 7.sp,
                                                      ),
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const ClampingScrollPhysics(),
                                                        itemCount: purchasedList[index].products.length>3?3:purchasedList[index].products.length,
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
                                                                    '${    purchasedList[index].products[productIndex].productName.toString()[0].toUpperCase()}${    purchasedList[index].products[productIndex].productName.toString().substring(1)}'
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
                                                                    "${Constant.currencySymbol} ${CommonMethod.numberFormat(  purchasedList[index].products[productIndex].amount ?? "")}",
                                                                    style: StyleUtility
                                                                        .headerTextStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                TextSizeUtility.textSize22),
                                                                  )
                                                                ],
                                                              ),
                                                              if(productIndex!=2&&purchasedList[index].products.last!=purchasedList[index].products[productIndex])  Container(
                                                                height: 1.0,
                                                                color: ColorUtility
                                                                    .colorE2E5EF,
                                                              ),
                                                              if(productIndex!=2&&purchasedList[index].products.last!=purchasedList[index].products[productIndex])  SizedBox(
                                                                height: 7.sp,
                                                              ),
                                                              if (purchasedList[index].products.length>3&&productIndex==2)
                                                                Text(
                                                                  "+${(purchasedList[index].products.length-3)}  ${S.of(context).seeAll}",
                                                                  style: StyleUtility
                                                                      .titleTextStyle
                                                                      .copyWith(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      TextSizeUtility.textSize15),
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
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
                                                            purchasedList[
                                                                        index]
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
                                                            purchasedList[
                                                                        index]
                                                                    .status
                                                                    .toUpperCase() ??
                                                                "",
                                                            style: StyleUtility
                                                                .axiforma500
                                                                .copyWith(
                                                                    fontSize:
                                                                        TextSizeUtility
                                                                            .textSize16,
                                                                    color:purchasedList[index]
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
                                          ),
                                        );
                                      })
                                  : Center(
                                      child: Text(
                                          S.of(context).noTransactionFound),
                                    ),

                          // MY ADS  LIST
                          model.isLoading == true
                              ? const Center(
                                  child: CircularProgressWidget(),
                                )
                              : (transactionList!.length ?? 0) > 0
                                  ? ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          top: 25.h, bottom: 50.h),
                                      itemCount: transactionList.length,
                                      itemBuilder: (context, index) {
                                        // String dateString =
                                        //     transactionList[index]
                                        //             .transactionTime ??
                                        //         "";
                                        //
                                        // // Define the date format
                                        // DateFormat format =
                                        //     DateFormat("dd MMM yyyy hh:mm a");
                                        //
                                        // // Parse the string to DateTime
                                        // DateTime dateTime =
                                        //     format.parse(dateString);
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context,
                                                RouteName
                                                    .transactionDetailScreen,
                                                arguments: {
                                                  "transaction":
                                                      transactionList?[index],
                                                  "purchased":
                                            null,
                                                  "event": null,

                                                });
                                          },
                                          child: Container(
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
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                  transactionList[index]
                                                      .transactionTime ??
                                                      "",
                                                            style: StyleUtility
                                                                .titleTextStyle
                                                                .copyWith(
                                                                    color: ColorUtility
                                                                        .color8B97A4),
                                                          ),
                                                          Expanded(
                                                            child: Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .end,
                                                              children: [
                                                                if (transactionList?[
                                                                            index]
                                                                        .urgent ==
                                                                    "1")
                                                                  Text(
                                                                    S
                                                                        .of(context)
                                                                        .urgent,
                                                                    style: StyleUtility
                                                                        .titleTextStyle
                                                                        .copyWith(
                                                                            color:
                                                                                ColorUtility.color5DB85C,
                                                                            fontSize: TextSizeUtility.textSize12),
                                                                  ),
                                                                if (transactionList?[
                                                                            index]
                                                                        .featured ==
                                                                    "1")
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 5
                                                                            .w),
                                                                    child: Text(
                                                                      S
                                                                          .of(context)
                                                                          .featured,
                                                                      style: StyleUtility.titleTextStyle.copyWith(
                                                                          color: ColorUtility
                                                                              .colorF1AD4E,
                                                                          fontSize:
                                                                              TextSizeUtility.textSize12),
                                                                    ),
                                                                  ),
                                                                if (transactionList?[
                                                                            index]
                                                                        .highlight ==
                                                                    "1")
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 5
                                                                            .w),
                                                                    child: Text(
                                                                      S
                                                                          .of(context)
                                                                          .highlight,
                                                                      style: StyleUtility.titleTextStyle.copyWith(
                                                                          color: ColorUtility
                                                                              .color5BC1DF,
                                                                          fontSize:
                                                                              TextSizeUtility.textSize12),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 7.sp,
                                                      ),
                                                      Text('${ transactionList?[index]
                                                          .productName.toString()[0].toUpperCase()}${  transactionList?[index]
                                                          .productName.toString().substring(1)}',
                                                        style: StyleUtility
                                                            .titleTextStyle
                                                            .copyWith(
                                                                fontSize:
                                                                    TextSizeUtility
                                                                        .textSize15),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                        height: 7.sp,
                                                      ),
                                                      Text(
                                                        "${Constant.currencySymbol} ${CommonMethod.numberFormat(transactionList?[index].amount ?? "")}",
                                                        style: StyleUtility
                                                            .headerTextStyle
                                                            .copyWith(
                                                                fontSize:
                                                                    TextSizeUtility
                                                                        .textSize22),
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
                                                            transactionList?[
                                                                        index]
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
                                                            transactionList?[
                                                                        index]
                                                                    .status
                                                                    ?.toUpperCase() ??
                                                                "",
                                                            style: StyleUtility.axiforma500.copyWith(
                                                                fontSize:
                                                                    TextSizeUtility
                                                                        .textSize16,
                                                                color: transactionList?[index]
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
                                          ),
                                        );
                                      })
                                  : Center(
                                      child: Text(
                                          S.of(context).noTransactionFound),
                                    ),

                          // EVENT LIST
                          model.isLoading == true
                              ? const Center(
                                  child: CircularProgressWidget(),
                                )
                              : (eventList!.length ?? 0) > 0
                                  ? ListView.builder(
                                      padding: EdgeInsets.only(
                                          top: 25.h, bottom: 50.h),
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: eventList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context,
                                                RouteName
                                                    .transactionDetailScreen,
                                                arguments: {
                                                  "purchased":
                                                 null,
                                                  "event": eventList[index],
                                                  "transaction": null,
                                                });
                                          },
                                          child: Container(
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
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            eventList[index]
                                                                .eventTitle,
                                                            style: StyleUtility
                                                                .headerTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        TextSizeUtility
                                                                            .textSize14),
                                                          ),
                                                          Text(Moment( eventList[index]
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
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount: eventList[index].tickets.length>3?3:eventList[index].tickets.length,
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
                                                                      eventList[index].tickets[productIndex].ticketType,
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
                                                                          eventList[index].tickets[productIndex].quantity,
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
                                                                          "${Constant.currencySymbol} ${CommonMethod.numberFormat( eventList[index].tickets[productIndex].amount ?? "")}",
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
                                                            if(productIndex!=2&&eventList[index].tickets.last!=eventList[index].tickets[productIndex])  Container(
                                                                height: 1.0,
                                                                color: ColorUtility
                                                                    .colorE2E5EF,
                                                              ),
                                                              if(productIndex!=2&&eventList[index].tickets.last!=eventList[index].tickets[productIndex]) SizedBox(
                                                                height: 7.sp,
                                                              ),
                                                              if (eventList[index].tickets.length>3&&productIndex==2)
                                                                Text(
                                                                  "+${(eventList[index].tickets.length-3)}  ${S.of(context).seeAll}",
                                                                  style: StyleUtility
                                                                      .titleTextStyle
                                                                      .copyWith(
                                                                          color: Colors
                                                                              .blueAccent,
                                                                          fontSize:
                                                                              TextSizeUtility.textSize15),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
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
                                                            eventList[
                                                                        index]
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
                                                            eventList[
                                                                        index]
                                                                    .status
                                                                    .toUpperCase() ??
                                                                "",
                                                            style: StyleUtility
                                                                .axiforma500
                                                                .copyWith(
                                                                    fontSize:
                                                                        TextSizeUtility
                                                                            .textSize16,
                                                                    color:  eventList[
                                                                    index]
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
                                          ),
                                        );
                                      })
                                  : Center(
                                      child: Text(
                                          S.of(context).noTransactionFound),
                                    ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }
}
