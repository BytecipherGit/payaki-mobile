import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/provider/add_post_vm.dart';
import 'package:payaki/modules/postAdd/widget/premium_widget.dart';
import 'package:payaki/network/payment/paypal_payment.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../network/end_points.dart';
import '../../../network/model/request/cart/checkout_request.dart';
import '../../../network/model/request/payment/payment_status_request.dart';
import '../../../network/model/response/cart/checkout_cart_response.dart';
import '../../../utilities/image_utility.dart';
import '../../../widgets/mobile_number_text_field.dart';
import '../../event/event_purchase_screen/event_purchase_screen.dart';

class SelectAddTypeScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;
  final String price;
  final int negotiate;
  final List<XFile> selectedImages;
  final String location;
  final String city;
  final String country;
  final String latlong;
  final String state;
  final String phone;
  final int availableDays;
  final String sellerName;

  const SelectAddTypeScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.tag,
      required this.description,
      required this.price,
      required this.negotiate,
      required this.selectedImages,
      required this.location,
      required this.city,
      required this.country,
      required this.latlong,
      required this.state,
      required this.phone,
      required this.availableDays,
      required this.sellerName})
      : super(key: key);

  @override
  State<SelectAddTypeScreen> createState() => _SelectAddTypeScreenState();
}

class _SelectAddTypeScreenState extends State<SelectAddTypeScreen> {
  String? selectAddTypeValue; //no radio button will be selected on initial

  String? selectPremiumValue;

  String freeAd = "Free Ad";
  String premium = "Premium";

  bool featuredValue = false;
  bool urgentValue = false;
  bool highlightValue = false;

  String? amount;
  String? currency;
  String? status;
  String? paymentId;
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: CustomAppBar(
        title: S.of(context).postAd,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => AddPostVm(),
          child: Consumer<AddPostVm>(builder: (context, addPostVm, child) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 23.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          S.of(context).makeYourAdPremium,
                          style: StyleUtility.headingTextStyle,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Material(
                          color: ColorUtility.colorF8FAFB,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            onTap: () {
                              onFreeAddSelect(addPostVm);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  // color: ColorUtility.colorF8FAFB,
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: ColorUtility.colorE2E5EF)),
                              child: Row(
                                children: [
                                  Radio(
                                    splashRadius: 0,
                                    activeColor: ColorUtility.color9C5FA3,
                                    value: freeAd,
                                    groupValue: selectAddTypeValue,
                                    onChanged: (value) {
                                      // selectAddTypeValue = value;
                                      // selectPremiumValue = null;
                                      // addPostVm.updateUi();
                                      onFreeAddSelect(addPostVm);
                                    },
                                  ),
                                  Text(
                                    S.of(context).freeAd,
                                    style: StyleUtility.radioTitleTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Material(
                          color: ColorUtility.whiteColor,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            onTap: () {
                              selectAddTypeValue = premium;
                              addPostVm.updateUi();
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: ColorUtility.colorA3803F)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        splashRadius: 0,
                                        activeColor: ColorUtility.color9C5FA3,
                                        value: premium,
                                        groupValue: selectAddTypeValue,
                                        onChanged: (value) {
                                          selectAddTypeValue = value;
                                          addPostVm.updateUi();
                                        },
                                      ),
                                      Text(
                                        S.of(context).premium,
                                        style: StyleUtility.radioTitleTextStyle
                                            .copyWith(
                                                color:
                                                    ColorUtility.colorD19830),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 19.w),
                                    padding: EdgeInsets.only(
                                        right: 5.w,
                                        left: 5,
                                        top: 2.w,
                                        bottom: 2.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      color: ColorUtility.color9C5FA3,
                                    ),
                                    child: Text(
                                      S.of(context).recommended,
                                      style: StyleUtility.axiforma400.copyWith(
                                          color: ColorUtility.whiteColor,
                                          fontSize: TextSizeUtility.textSize10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      selectAddTypeValue == premium
                          ? SizedBox(
                              height: 310.h,
                              child: ListView(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PremiumWidget(
                                    title: S.of(context).featured,
                                    description: S.of(context).featuredDetails,
                                    price: "100",
                                    month: "300 ${S.of(context).days}",
                                    checkBoxValue: featuredValue,
                                    onSelect: (vale) {
                                      featuredValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  PremiumWidget(
                                    title: S.of(context).urgent,
                                    description: S.of(context).urgentDetails,
                                    price: "100",
                                    month: "300 ${S.of(context).days}",
                                    checkBoxValue: urgentValue,
                                    onSelect: (vale) {
                                      urgentValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  PremiumWidget(
                                    title: S.of(context).highlight,
                                    description: S.of(context).highlightDetails,
                                    price: "100",
                                    month: "300 ${S.of(context).days}",
                                    checkBoxValue: highlightValue,
                                    onSelect: (vale) {
                                      highlightValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                      buttonText: S.of(context).postAdd,
                      onTab: () {
                        if (selectAddTypeValue == null) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseSelectAddType);
                        } else if (selectAddTypeValue == freeAd) {
                          addPost(addPostVm: addPostVm);
                        } else if (selectAddTypeValue == premium &&
                            featuredValue == false &&
                            urgentValue == false &&
                            highlightValue == false) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseSelectPremiumType);
                        } else {
                          int calculateAmount = 0;
                          if (featuredValue == true) {
                            calculateAmount = calculateAmount + 100;
                          }
                          if (urgentValue == true) {
                            calculateAmount = calculateAmount + 100;
                          }
                          if (highlightValue == true) {
                            calculateAmount = calculateAmount + 100;
                          }
                          addPost(addPostVm: addPostVm,calculateAmount: calculateAmount);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const EventPurchaseScreen(),
                          //     ));
                          // amount = calculateAmount.toString();
                          // logD("amount: $amount");
                          // logD("currency: $currency");
                          // logD("status: $status");
                          // logD("paymentId: $paymentId");
                          // showPaymentLoadingDialog(ctx: context,
                          //       onSuccess: ( params) {
                          //         logD("onSuccess: $params");
                          //
                          //         amount = calculateAmount.toString();
                          //         // status = params["status"].toString();
                          //         // paymentId = params["paymentId"].toString();
                          //         // currency = params["data"]["transactions"][0]
                          //         //         ["amount"]["currency"]
                          //         //     .toString();
                          //
                          //         logD("amount: $amount");
                          //         logD("currency: $currency");
                          //         logD("status: $status");
                          //         logD("paymentId: $paymentId");
                          //         Timer(const Duration(seconds: 1), () {
                          //           addPost(addPostVm: addPostVm);
                          //         });
                          //       },
                          //       onFailure: (String message) {
                          //   Navigator.pop(context);
                          //         context.flushBarTopErrorMessage(
                          //             message: message.toString());
                          //       }, amount: amount
                          // );
                          // Payment().payPal(
                          //     context: context,
                          //     amount: calculateAmount.toString(),
                          //     onSuccess: (Map params) {
                          //       logD("onSuccess: $params");
                          //       amount = calculateAmount.toString();
                          //       status = params["status"].toString();
                          //       paymentId = params["paymentId"].toString();
                          //       currency = params["data"]["transactions"][0]
                          //               ["amount"]["currency"]
                          //           .toString();
                          //       logD("amount: $amount");
                          //       logD("currency: $currency");
                          //       logD("status: $status");
                          //       logD("paymentId: $paymentId");
                          //       Timer(const Duration(seconds: 1), () {
                          //
                          //       });
                          //     },
                          //     onFailure: (String message) {
                          //       context.flushBarTopErrorMessage(
                          //           message: message.toString());
                          //     });
                        }
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  onFreeAddSelect(AddPostVm addPostVm) {
    selectAddTypeValue = freeAd;
    selectPremiumValue = null;
    featuredValue = false;
    urgentValue = false;
    highlightValue = false;
    addPostVm.updateUi();
  }

  addPost({required AddPostVm addPostVm,calculateAmount}) {
    // context.showSnackBar(message: "Post Added ${amount ?? ""}");
    var featured = featuredValue == true ? "1" : "0";
    var urgent = urgentValue == true ? "1" : "0";
    var highlight = highlightValue == true ? "1" : "0";
    logD("featured $featured");
    logD("urgent $urgent");
    logD("highlight $highlight");
    CommonDialog.showLoadingDialog(context);
    addPostVm.addPostApi(
        images: widget.selectedImages,
        productName: widget.title,
        tag: widget.tag,
        description: widget.description,
        categoryId: widget.catId,
        subCategoryId: widget.subCatId,
        price: widget.price,
        negotiable: widget.negotiate,
        location: widget.location,
        city: widget.city,
        country: widget.country,
        latlong: widget.latlong,
        state: widget.state,
        phone: widget.phone,
        sellerName: widget.sellerName,
        availableDays: widget.availableDays.toString(),
        featured: featured,
        urgent: urgent,
        highlight: highlight,
        amount: amount,
        currency: currency,
        status: status,
        paymentId: paymentId,
        onSuccess: (String message) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.bottomNavigationBarScreen, (route) => false);
          context.flushBarTopSuccessMessage(message: message);
        },
        onPaidSuccess: (response) {
          Navigator.pop(context);
          showPaymentLoadingDialog(
              ctx: context,
              mobileController: mobileController,
              onSuccess: (number) {
                CommonDialog.showLoadingDialog(context);

                addPostVm.checkoutAddPaidPost(
                    request: AddPostRequest(
                      name: Endpoints.cartEndPoints.checkoutPaypalForProduct,
                      param: AddPostParam(
                          merchantTransactionId: response.merchantTransactionId,
                          product_name: response.data.productName,mobileNumber: mobileController.text.trim(),
                          totalAmount:calculateAmount.toString()),
                    ),
                    onSuccess: (CartCheckoutResponse success) {
                      Navigator.pop(context);
                      if (success.success == true) {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.bottomNavigationBarScreen,
                            (route) => false);
                        context.flushBarTopSuccessMessage(
                            message: success.message);
                      } else {
                        CommonDialog.showPaymentLoadingDialog(context);
                        Future.delayed(const Duration(seconds: 90))
                            .then((value) {
                          return addPostVm.checkPaymentStatus(
                            request: PaymentStatusApiRequest(
                              name: Endpoints.cartEndPoints.finalCallAppyPayApi,
                              param: Parameter(
                                transactionId: success.transactionId,
                                merchantTransactionId:
                                    success.merchantTransactionId,
                                accessToken: success.accessToken,
                                // orderId:
                                // success.orderId
                              ),
                            ),
                            onSuccess: (response) {
                              if (response.success == true) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RouteName.bottomNavigationBarScreen,
                                    (route) => false);
                                context.flushBarTopSuccessMessage(
                                    message: response.message);
                              } else {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                context.flushBarTopErrorMessage(
                                    message: response.message);
                              }
                            },
                              onFailure: (message){
                                Navigator.pop(context);
                                Navigator.pop(context);
                                context.flushBarTopErrorMessage(
                                    message: message
                                        .toString());
                              }
                          );
                        });
                      }
                    },
                    onFailure: (String message) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      context.flushBarTopErrorMessage(message: message);
                    });
              });
        },
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value);
        });
  }

  static showPaymentLoadingDialog({
    required BuildContext ctx,
    ValueChanged<String>? onSuccess,
    required TextEditingController mobileController,
  }) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return Dialog(

            child: InkWell(onTap: (){
              FocusScope.of(context).unfocus();
            },
              child: Container(
                  height: 460.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorUtility.whiteColor,
                  ),
                  child: ChangeNotifierProvider(
                    create: (context) => Payment(),
                    child: Consumer<Payment>(builder: (context, payment, child) {
                      return WillPopScope(
                        onWillPop: () async {
                          return false;
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          ImageUtility.paymentGatewayLogo,
                                          height: 120.h,
                                          width: 120.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.cancel_sharp,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Multicaixa Express",
                                        style: StyleUtility.headingTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  // Text(
                                  //   S.of(context).enterYourMobileNumber,
                                  //   style: StyleUtility.headingTextStyle,
                                  // ),

                                  MobileNumberTextField(
                                    controller: mobileController,
                                    onChanged: (phone) {
                                      logD(phone.number);
                                      logD(phone.countryCode);
                                      payment.countryCode = phone.countryCode;
                                      payment.notifyListeners();
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomButton(
                                      buttonText: S.of(context).authorisePayment,
                                      onTab: () async {
                                        if (mobileController.text.isEmpty) {
                                          context.flushBarTopErrorMessage(
                                              message: S
                                                  .of(context)
                                                  .pleaseEnterYourPhoneNumber);
                                        } else {
                                          onSuccess!.call(mobileController.text);
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
            ));
      },
    );
  }
}
