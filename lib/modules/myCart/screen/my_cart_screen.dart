import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/myCart/viewModel/my_cart_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/payment/paypal_payment.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/delete_alert_dialog.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:payaki/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/mobile_number_text_field.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  MyCartScreenVm myCartScreenVm = MyCartScreenVm();

  int length = 0;

  String? paymentId;
  String? status;
  String? payerId;

  List<String> productIds = [];
  List<String> amounts = [];

  @override
  void initState() {
    super.initState();

    logD("User Id is ${Preference().getUserId()}");
    myCartScreenVm = Provider.of<MyCartScreenVm>(context, listen: false);
    myCartScreenVm.cartList(
        onSuccess: (String value) {},
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar:  CustomAppBar(
        title: S.of(context).myCart,
      ),
      body: SafeArea(
        child:
            Consumer<MyCartScreenVm>(builder: (context, myCartScreenVm, child) {
          var myCart = myCartScreenVm.cartListResponse?.data;
          return myCartScreenVm.isLoading == true
              ? const CircularProgressWidget()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: (myCart?.products?.length ?? 0) > 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 23.h,
                            ),
                            Text(
                              S.of(context).myCart,
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                        padding: EdgeInsets.only(bottom: 20.h),
                                        itemCount: myCart?.products?.length,
                                        primary: false,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RouteName.postDetailsScreen,
                                                  arguments: {
                                                    "postId": myCart
                                                        ?.products?[index]
                                                        .productId
                                                  });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0, top: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    child: NetworkImageWidget(
                                                      url: myCart
                                                          ?.products?[index]
                                                          .productImage,
                                                      height: 80.w,
                                                      width: 80.w,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          myCart
                                                                  ?.products?[
                                                                      index]
                                                                  .productName ??
                                                              "",
                                                          style: StyleUtility
                                                              .titleTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize16,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          height: 4.w,
                                                        ),
                                                        Text(
                                                          "Kz ${myCart?.products?[index].productPrice ?? ""}",
                                                          style: StyleUtility
                                                              .headingTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize20,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showRemovePostDialog(
                                                        context: context,
                                                        onDeleteTap: () {
                                                          CommonDialog
                                                              .showLoadingDialog(
                                                                  context);
                                                          myCartScreenVm
                                                              .removeFromCart(
                                                                  onSuccess:
                                                                      (message) {
                                                                    Navigator.pop(
                                                                        context);
                                                                    context.flushBarTopSuccessMessage(
                                                                        message:
                                                                            message);

                                                                    myCartScreenVm
                                                                        .cartList(
                                                                            onSuccess: (String
                                                                                value) {},
                                                                            onFailure:
                                                                                (value) {
                                                                              Navigator.pop(context);
                                                                              context.flushBarTopErrorMessage(message: value.toString());
                                                                            });
                                                                  },
                                                                  onFailure:
                                                                      (message) {
                                                                    Navigator.pop(
                                                                        context);
                                                                    context.flushBarTopErrorMessage(
                                                                        message:
                                                                            message);
                                                                  },
                                                                  index: index,
                                                                  postId: myCart
                                                                      ?.products?[
                                                                          index]
                                                                      .productId);
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 45.w,
                                                      width: 45.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: ColorUtility
                                                              .colorDBC8DD),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.w),
                                                        child: Image.asset(
                                                          ImageUtility
                                                              .deleteIcon,
                                                          // width: 5.w,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    Text(
                                      S.of(context).orderInfo,
                                      style: StyleUtility.headingTextStyle,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          S.of(context).total,
                                          style: StyleUtility.totalTextStyle,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Kz ${myCart?.total ?? ""}",
                                            style: StyleUtility.headingTextStyle
                                                .copyWith(
                                                    fontSize: TextSizeUtility
                                                        .textSize16),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                                buttonText:
                                    "${S.of(context).checkOut} (${"${myCart?.total ?? ""}"})",
                                onTab: () {
                                  productIds.clear();
                                  amounts.clear();
                                  for (var i = 0;
                                      i < (myCart?.products?.length ?? 0);
                                      i++) {
                                    productIds.add(
                                        myCart?.products?[i].productId ?? "0");
                                    amounts.add(
                                        myCart?.products?[i].productPrice ??
                                            "0");
                                  }

                                  print(productIds);
                                  print(amounts);
                                  Timer(const Duration(seconds: 1), () {
                                    CommonDialog.showLoadingDialog(context);
                                    myCartScreenVm.checkoutCart(
                                        request: CheckoutRequest(
                                          name: Endpoints
                                              .cartEndPoints.checkoutPaypal,
                                          param: Param(
                                            totalAmount:
                                                myCart?.total.toString(),
                                            productIds: productIds,
                                            amounts: amounts,
                                          ),
                                        ),
                                        onSuccess: (String id) {
                                          Navigator.pop(context);
                                          showPaymentLoadingDialog(
                                            ctx: context,
                                            onSuccess: (String message) {
                                              Navigator.pop(context);
                                              context.flushBarTopSuccessMessage(
                                                  message: message.toString());
                                            },
                                            onFailure: (String message) {
                                              Navigator.pop(context);
                                              context.flushBarTopErrorMessage(
                                                  message: message.toString());
                                            },
                                            amount:
                                                myCart?.total.toString() ?? "0",
                                            id: id,
                                          );
                                        },
                                        onFailure: (String message) {
                                          Navigator.pop(context);
                                          context.flushBarTopErrorMessage(
                                              message: message);
                                        });
                                  });
                                }),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        )
                      :  NoDataWidget(
                          title: S.of(context).noItemAvailable,
                        ),
                );
        }),
      ),
    );
  }

  static showPaymentLoadingDialog(
      {required BuildContext ctx,
      ValueChanged<String>? onSuccess,
      ValueChanged<String>? onFailure,
      required String amount,
      required String id}) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        TextEditingController mobileController = TextEditingController();
        return Dialog(
            child: Container(
                height: 400.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorUtility.whiteColor,
                ),
                child: ChangeNotifierProvider(
                  create: (context) => Payment(),
                  child: Consumer<Payment>(builder: (context, payment, child) {
                    return WillPopScope(
                      onWillPop: () async{
                        return false;
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.cancel_sharp,
                                    color: Colors.black,
                                  ))
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
                                Text(
                                  S.of(context).enterYourMobileNumber,
                                  style: StyleUtility.headingTextStyle,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
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
                                    buttonText:S.of(context).authorisePayment,
                                    onTab: () async {
                                      if (mobileController.text.isEmpty) {
                                        context.flushBarTopErrorMessage(
                                            message:
                                            S.of(context).pleaseEnterYourPhoneNumber);
                                      } else {
                                        payment.pay(
                                            amount: amount,
                                            phoneNumber: mobileController.text,
                                            id: id,
                                            onSuccess: (valueData) {
                                              onSuccess!.call(valueData);
                                            },
                                            onFailure: (value) {
                                              onFailure!.call(value);
                                            },
                                            context: ctx);
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )));
      },
    );
  }

  Future<dynamic> showRemovePostDialog({
    required BuildContext context,
    required VoidCallback onDeleteTap,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DeleteAlertDialog(
            onDeleteTap: onDeleteTap,
            yesText: S.of(context).deleteItem,
          );
        });
  }
}
