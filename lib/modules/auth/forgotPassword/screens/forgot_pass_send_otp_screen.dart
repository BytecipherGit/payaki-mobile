import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_send_opt_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/forgotPassword/forgot_pass_send_otp_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:provider/provider.dart';

class ForgotPassSendOtpScreen extends StatefulWidget {
  const ForgotPassSendOtpScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassSendOtpScreen> createState() =>
      _ForgotPassSendOtpScreenState();
}

class _ForgotPassSendOtpScreenState extends State<ForgotPassSendOtpScreen> {
  TextEditingController mobileController = TextEditingController();

  String countryCode = "+91";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Forgot  Password",
            style: StyleUtility.headerTextStyle,
          ),
          centerTitle: true,
          elevation: 1,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          shadowColor: ColorUtility.colorE2E5EF),
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
                      child: Consumer<ForgotPassSendOtpVm>(
                          builder: (context, forgotPassSendOtpVm, child) {
                        return CustomButton(
                            buttonText: "Send OTP",
                            onTab: () {
                              if (mobileController.text.isEmpty) {
                                context.showSnackBar(
                                    message: "Please Enter Mobile Number");
                              } else {
                                CommonDialog.showLoadingDialog(context);
                                forgotPassSendOtpVm.forgotPassSendOtp(
                                  request: ForgotPassSendOtpRequest(
                                      name:
                                          Endpoints.auth.forgetPasswordSendOtp,
                                      param: Param(
                                          mobile: mobileController.text,
                                          countryCode: countryCode)),
                                  onSuccess: (value) {
                                    Navigator.pop(context);

                                    context.showSnackBar(message: "${value.message} ${value.data!.otp}");
                                    Navigator.pushNamed(context,
                                        RouteName.forgotPassVerifyOtpScreen,arguments: {
                                      "userId":value.data!.userId
                                        });
                                  },
                                  onFailure: (value) {
                                    Navigator.pop(context);
                                    context.showSnackBar(message: value);
                                  },
                                );
                              }
                            });
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
}
