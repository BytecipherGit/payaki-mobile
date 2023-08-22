import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/myAds/viewModel/my_ads_screen_vm.dart';
import 'package:payaki/network/model/response/profile/transaction_list_response.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';

class TransactionDetailScreen extends StatefulWidget {
  final Data? transaction;

  const TransactionDetailScreen({Key? key, this.transaction}) : super(key: key);

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
      appBar: const CustomAppBar(title: "Transaction Detail"),
      body: Container(
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
            Text("Title", style: StyleUtility.titleTextStyle),
            Text(
              widget.transaction?.productName ?? "",
              style: StyleUtility.headingTextStyle
                  .copyWith(color: ColorUtility.color43576F),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text("Amount", style: StyleUtility.titleTextStyle),
            Text(
              "${Constant.currencySymbol} ${CommonMethod.numberFormat(widget.transaction?.amount ?? "")}",
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
                      Text("Premium", style: StyleUtility.titleTextStyle),
                      Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          if (widget.transaction?.urgent == "1")
                            Text(
                              "URGENT",
                              style: StyleUtility.headingTextStyle.copyWith(
                                color: ColorUtility.color5DB85C,
                              ),
                            ),
                          if (widget.transaction?.featured == "1")
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text(
                                "FEATURED",
                                style: StyleUtility.headingTextStyle.copyWith(
                                  color: ColorUtility.colorF1AD4E,
                                ),
                              ),
                            ),
                          if (widget.transaction?.highlight == "1")
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text(
                                "HIGHLIGHT",
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
                      Text("Payment Method",
                          style: StyleUtility.titleTextStyle),
                      Text(
                        // "ONLINE",
                        widget.transaction?.transactionGatway ?? "",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color43576F),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Date", style: StyleUtility.titleTextStyle),
                      Text(
                        //  "22/02/2023",
                        widget.transaction?.transactionTime ?? "",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color43576F),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Status", style: StyleUtility.titleTextStyle),
                      Text(
                        widget.transaction?.status?.toUpperCase() ?? "",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color06C972),
                      ),
                    ],
                  )
                :
                // Training traction detail ui
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Phone Number", style: StyleUtility.titleTextStyle),
                      Text(
                        "+244812024778",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color43576F),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Description", style: StyleUtility.titleTextStyle),
                      Text(
                        // "ONLINE",
                        "Lorem ipsum dolor sit ame lorem ipsum dolor sit ame lorem ipsum dolor sit ame lorem ipsum dolor sit ame",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color43576F),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Date", style: StyleUtility.titleTextStyle),
                      Text(
                        //  "22/02/2023",
                        widget.transaction?.transactionTime ?? "",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color43576F),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Status", style: StyleUtility.titleTextStyle),
                      Text(
                        widget.transaction?.status?.toUpperCase() ?? "",
                        style: StyleUtility.headingTextStyle
                            .copyWith(color: ColorUtility.color06C972),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text("Image", style: StyleUtility.titleTextStyle),
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
                      Text("Video", style: StyleUtility.titleTextStyle),
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
      ),
    );
  }
}
