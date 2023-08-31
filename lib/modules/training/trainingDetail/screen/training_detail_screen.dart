import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/training/trainingDetail/viewModel/training_detail_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/model/response/training/training_list_response.dart';
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

class TrainingDetailsScreen extends StatefulWidget {
  final Data? trainingData;

  const TrainingDetailsScreen({Key? key, this.trainingData}) : super(key: key);

  @override
  State<TrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {
  var imageHeight = 330.h;
  String? paymentId;
  String? status;
  String? payerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  if ((widget.trainingData?.image?.length ?? 0) > 0) {
                    Navigator.pushNamed(context, RouteName.imageViewScreen,
                        arguments: {"images": widget.trainingData?.image});
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
                        style: StyleUtility.headingTextStyle
                            .copyWith(fontSize: TextSizeUtility.textSize26),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.trainingData?.productName ?? "",
                              style: StyleUtility.postDescTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize18,
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
                              style: StyleUtility.postDescTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize12),
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
                            child: Text(widget.trainingData?.fullAddress ?? "",
                                style: StyleUtility.postDescTextStyle),
                          )
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.trainingData?.postUserName ?? "",
                                        style: StyleUtility.headingTextStyle
                                            .copyWith(
                                                color:
                                                    ColorUtility.color43576F),
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
                                  itemCount:
                                      widget.trainingData?.gallery?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 15.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (widget
                                                  .trainingData
                                                  ?.gallery?[index]
                                                  .trainingVideo !=
                                              null) {
                                            Navigator.pushNamed(context,
                                                RouteName.videoPlayerScreen,
                                                arguments: {
                                                  "videoUrl": widget
                                                      .trainingData!
                                                      .gallery![index]
                                                      .trainingVideo!
                                                });
                                          }
                                        },
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
                      GestureDetector(
                        onTap: () {
                          if (widget.trainingData?.promoVideo != null) {
                            Navigator.pushNamed(
                                context, RouteName.videoPlayerScreen,
                                arguments: {
                                  "videoUrl": widget.trainingData!.promoVideo!
                                });
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: Image.asset(
                            ImageUtility.videoThumbnail,
                            width: 85.w,
                            height: 85.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Preference().getUserId() != widget.trainingData?.userId
                          ? Consumer<TrainingDetailScreenVm>(builder:
                              (context, trainingDetailScreenVm, child) {
                              return CustomButton(
                                  buttonText: "Purchase Training",
                                  onTab: () {
                                    PayPalPayment().pay(
                                        context: context,
                                        amount:
                                            widget.trainingData?.price ?? "0",
                                        onSuccess: (Map params) {
                                          logD("onSuccess: $params");

                                          status = params["status"].toString();
                                          paymentId =
                                              params["paymentId"].toString();
                                          payerId = params["data"]["payer"]
                                              ["payer_info"]["payer_id"];

                                          Timer(const Duration(seconds: 1), () {
                                            CommonDialog.showLoadingDialog(
                                                context);
                                            trainingDetailScreenVm
                                                .purchaseTraining(
                                                    request: CheckoutRequest(
                                                      name: Endpoints
                                                          .cartEndPoints
                                                          .checkoutPaypal,
                                                      param: Param(
                                                          totalAmount: widget
                                                                  .trainingData
                                                                  ?.price ??
                                                              "0",
                                                          productIds: [
                                                            "${widget.trainingData?.id}"
                                                          ],
                                                          amounts: [
                                                            "${widget.trainingData?.price}"
                                                          ],
                                                          paymentId: paymentId,
                                                          payerId: payerId,
                                                          status: status),
                                                    ),
                                                    onSuccess:
                                                        (String message) {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                      context
                                                          .flushBarTopSuccessMessage(
                                                              message: message);
                                                    },
                                                    onFailure:
                                                        (String message) {
                                                      Navigator.pop(context);
                                                      context
                                                          .flushBarTopSuccessMessage(
                                                              message: message);
                                                    });
                                          });
                                        },
                                        onFailure: (String message) {
                                          context.flushBarTopErrorMessage(
                                              message: message.toString());
                                        });
                                  });
                            })
                          : const SizedBox(),
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
    ));
  }
}
