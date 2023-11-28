import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/integration/firebase_integration.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';

class EventPurchaseScreen extends StatefulWidget {
  const EventPurchaseScreen({Key? key}) : super(key: key);

  @override
  State<EventPurchaseScreen> createState() =>
      _EventPurchaseScreenState();
}

class _EventPurchaseScreenState
    extends State<EventPurchaseScreen> {
  TextEditingController mobileController = TextEditingController();

  String? countryCode;
  String? deviceToken;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    deviceToken = await FirebaseIntegration().getFirebaseToken();
    logD("Token $deviceToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Authorise Payment",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Enter your Mobile Number",
                style: StyleUtility.headingTextStyle,
              ),
              SizedBox(
                height: 25.h,
              ),
              MobileNumberTextField(
                controller: mobileController,
                onChanged: (phone) {
                  countryCode = phone.countryCode;
                  logD(phone.number);
                  logD(phone.countryCode);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child:CustomButton(
                          buttonText: "Authorise Payment",
                          onTab: () {
                            if (mobileController.text.isEmpty) {
                              context.flushBarTopErrorMessage(
                                  message: "Please Enter Mobile Number");
                            } else {
                              CommonDialog.showPaymentLoadingDialog(context);
                              startTimer();

                              // loginWithPhoneSendOtpVm.sendOtp(
                              //   request: LoginWithPhoneSendOtpRequest(
                              //       name: Endpoints.auth.loginWithPhone,
                              //       param: Param(
                              //           phone: mobileController.text,
                              //           countryCode: countryCode,
                              //           deviceType: Platform.isAndroid
                              //               ? Constant.android
                              //               : Constant.ios,
                              //           deviceToken: deviceToken)),
                              //   onSuccess: (value) {
                              //     Navigator.pop(context);
                              //     context.flushBarTopErrorMessage(
                              //         message:
                              //         "${value.message} ${value.data!.otp}");
                              //     Navigator.pushNamed(context,
                              //         RouteName.loginWithPhoneVerifyOtpScreen,
                              //         arguments: {
                              //           "countryCode": countryCode,
                              //           "mobile": mobileController.text,
                              //         });
                              //   },
                              //   onFailure: (value) {
                              //     Navigator.pop(context);
                              //     context.flushBarTopErrorMessage(message: value);
                              //   },
                              // );
                            }
                          }))),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _start = 1;
  Timer _timer = Timer(Duration(milliseconds: 1), () {});


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(
      oneSec,
          (timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pop(context);
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
