import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
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
import 'package:permission_handler/permission_handler.dart';

import '../../../../generated/l10n.dart';
import '../../../../network/model/request/payment/payment_status_request.dart';
import '../../../../network/model/response/cart/checkout_cart_response.dart';
import '../../../../widgets/mobile_number_text_field.dart';
import '../../../event/event_purchase_screen/event_purchase_screen.dart';

class TrainingDetailsScreen extends StatefulWidget {
  final Datum? trainingData;

  const TrainingDetailsScreen({Key? key, this.trainingData}) : super(key: key);

  @override
  State<TrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {
  var imageHeight = 330.h;
  String? paymentId;
  String? status;
  String? payerId;
  int progress = 0;
  final ReceivePort _receivePort = ReceivePort();
  TextEditingController mobileController = TextEditingController();
  @pragma('vm:entry-point')
  static downloadingCallback(id, status, progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
    sendPort!.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      IsolateNameServer.registerPortWithName(
          _receivePort.sendPort, "downloading");
      _receivePort.listen((message) {
        setState(() {
          progress = message[2];
        });

        print(progress);
      });
      FlutterDownloader.registerCallback(downloadingCallback);
    }
  }

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
                                      widget.trainingData!.createdAt!.toString()))
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
                        S.of(context).location,
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
                        S.of(context).description,
                        style: StyleUtility.headingTextStyle,
                      ),
                      Text(widget.trainingData?.description ?? "",
                          style: StyleUtility.postDescTextStyle),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        S.of(context).postedBy,
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
                                    widget.trainingData!.expiredDate!.toString()))
                                .fromNow(),
                            style: StyleUtility.postDescTextStyle),
                      if (Preference().getUserId() ==
                              widget.trainingData?.userId ||
                          (widget.trainingData!.isPurchased!))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.sp,
                            ),
                            Text(
                              S.of(context).videoGallery,
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
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            child: Image.asset(
                                              ImageUtility.videoThumbnail,
                                              width: 85.w,
                                              height: 85.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -10,
                                              right: -10,
                                              child: IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                icon: Icon(
                                                  Icons.download,
                                                  size: 25.h,
                                                  color:
                                                      ColorUtility.color9C5FA3,
                                                ),
                                                onPressed: () async {
                                                  final status =
                                                      await Permission.storage
                                                          .request();

                                                  if (status.isGranted) {
                                                    final externalDir = Platform
                                                            .isAndroid
                                                        ? await getExternalStorageDirectory() //FOR ANDROID
                                                        : await getApplicationSupportDirectory(); //FOR iOS

                                                    await FlutterDownloader
                                                        .enqueue(
                                                      url: widget
                                                          .trainingData!
                                                          .gallery![index]
                                                          .trainingVideo!,
                                                      savedDir:
                                                          externalDir!.path,
                                                      fileName: DateTime.now()
                                                          .millisecondsSinceEpoch
                                                          .toString(),
                                                      showNotification: true,
                                                      openFileFromNotification:
                                                          true,
                                                    ).then((id) {
                                                      print("file Id ${id}");
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content:  Text(
                                                              S.of(context).downloadCompleted),
                                                          action:
                                                              SnackBarAction(
                                                            label: S.of(context).Open,
                                                            onPressed:
                                                                () async {
                                                              // Open the downloaded file in the Files app
                                                              await OpenFile.open(
                                                                  '${externalDir.path}/$id');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  } else {
                                                    print("Permission deined");
                                                  }
                                                },
                                              ))
                                        ]),
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
                        S.of(context).promoVideo,
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
                      if (!(widget.trainingData!.isPurchased!))
                        Preference().getUserId() != widget.trainingData?.userId
                            ? Consumer<TrainingDetailScreenVm>(builder:
                                (context, trainingDetailScreenVm, child) {
                                return CustomButton(
                                    buttonText: S.of(context).purchaseTraining,
                                    onTab: () {
                                      showPaymentLoadingDialog(
                                        ctx: context,
                                        onSuccess: (String message) {
                                          CommonDialog.showLoadingDialog(context);
                                          trainingDetailScreenVm
                                              .purchaseTraining(
                                              request: CheckoutRequest(
                                                name: Endpoints
                                                    .cartEndPoints.checkoutPaypal,
                                                param: Param(
                                                  totalAmount: widget
                                                      .trainingData
                                                      ?.price ??
                                                      "0",mobile: mobileController.text.toString(),
                                                  productIds: [
                                                    "${widget.trainingData?.id}"
                                                  ],
                                                  amounts: [
                                                    "${widget.trainingData?.price}"
                                                  ],
                                                ),
                                              ),
                                              onSuccess: (CartCheckoutResponse success) {
                                                Navigator.pop(context);
                                                if (success.success == true) {
                                                  Navigator.pop(context);
                                                  trainingDetailScreenVm.updateUi();
                                                } else {
                                                  CommonDialog
                                                      .showPaymentLoadingDialog(
                                                      context);
                                                  Future.delayed(const Duration(seconds: 5)).then((value) {
                                                    return  trainingDetailScreenVm
                                                        .checkPaymentStatus(
                                                      request: PaymentStatusApiRequest(
                                                        name: Endpoints
                                                            .cartEndPoints
                                                            .finalCallAppyPayApi,
                                                        param: Parameter(
                                                            transactionId: success
                                                                .transactionId,
                                                            merchantTransactionId:
                                                            success
                                                                .merchantTransactionId,
                                                            accessToken:
                                                            success.accessToken,
                                                            orderId:
                                                            success.orderId),
                                                      ),
                                                      onSuccess: (response) {
                                                        if (response.success == true) {
                                                          trainingDetailScreenVm.updateUi();
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          context.flushBarTopSuccessMessage(
                                                              message:
                                                              response.message);
                                                        }else{
                                                          trainingDetailScreenVm.updateUi();
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          context.flushBarTopErrorMessage(
                                                              message: response.success==null? "Transaction Failed !":response.message);
                                                        }
                                                      },
                                                    );
                                                  });

                                                }
                                              },
                                              onFailure: (String message) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                context.flushBarTopErrorMessage(
                                                    message: message);
                                              });
                                        },
                                        mobileController: mobileController,
                                      );
                                      // Timer(const Duration(seconds: 1), () {
                                      //   CommonDialog.showLoadingDialog(context);
                                      //   trainingDetailScreenVm
                                      //       .purchaseTraining(
                                      //       request: CheckoutRequest(
                                      //         name: Endpoints
                                      //             .cartEndPoints.checkoutPaypal,
                                      //         param: Param(
                                      //           totalAmount: widget
                                      //               .trainingData
                                      //               ?.price ??
                                      //               "0",
                                      //           productIds: [
                                      //             "${widget.trainingData?.id}"
                                      //           ],
                                      //           amounts: [
                                      //             "${widget.trainingData?.price}"
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       onSuccess: (String id) {
                                      //         Navigator.pop(context);
                                      //         showPaymentLoadingDialog(
                                      //           ctx: context,
                                      //           onSuccess: (String message) {
                                      //             Navigator.pop(context);
                                      //             context.flushBarTopSuccessMessage(
                                      //                 message: message.toString());
                                      //           },
                                      //           onFailure: (String message) {
                                      //             Navigator.pop(context);
                                      //             context.flushBarTopErrorMessage(
                                      //                 message: message.toString());
                                      //           },
                                      //           amount:
                                      //           widget
                                      //               .trainingData
                                      //               ?.price ??
                                      //               "0",
                                      //           id: id,
                                      //         );
                                      //       },
                                      //       onFailure: (String message) {
                                      //         Navigator.pop(context);
                                      //         context.flushBarTopErrorMessage(
                                      //             message: message);
                                      //       });
                                      // });
                                    });
                              })
                            : const SizedBox(),
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

  static showPaymentLoadingDialog(
      {required BuildContext ctx,
        ValueChanged<String>? onSuccess, required TextEditingController mobileController,
      }) {
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {

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
                    return Column(
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
                                  buttonText: S.of(context).authorisePayment,
                                  onTab: () async {
                                    if (mobileController.text.isEmpty) {
                                      context.flushBarTopErrorMessage(
                                          message:
                                          S.of(context).pleaseEnterMobileNumber);
                                    } else {
                                      onSuccess!.call(mobileController.text);
                                      // payment.pay(
                                          // amount: amount,
                                          // phoneNumber: mobileController.text,
                                          // id: id,
                                          // onSuccess: (valueData) {
                                          //
                                          // },
                                          // onFailure: (value) {
                                          //   onFailure!.call(value);
                                          // },
                                          // context: ctx);
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                )));
      },
    );
  }

}
