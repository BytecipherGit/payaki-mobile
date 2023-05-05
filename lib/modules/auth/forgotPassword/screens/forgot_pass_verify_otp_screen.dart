import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/forgotPassword/provider/forgot_pass_verify_otp_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_new_password_screen.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/forgotPassword/forgot_pass_verify_otp_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/otp_text_field.dart';
import 'package:provider/provider.dart';

class ForgotPassVerifyOtpScreen extends StatefulWidget {
  final String userId;

  const ForgotPassVerifyOtpScreen({Key? key, required this.userId})
      : super(key: key);

  @override
  State<ForgotPassVerifyOtpScreen> createState() =>
      _ForgotPassVerifyOtpScreenState();
}

class _ForgotPassVerifyOtpScreenState extends State<ForgotPassVerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();

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
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          elevation: 1,
          shadowColor: ColorUtility.colorE2E5EF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Consumer<ForgotPassVerifyOtpVm>(
              builder: (context, forgotPassVerifyOtpVm, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Enter OTP",
                            style: StyleUtility.headingTextStyle,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text:
                                  'Please enter OTP which has been sent to your Phone Number',
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.resendOtpTextStyle,
                                  text: ' "+914696359753"',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          OtpTextField(controller: otpController),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '01:50',
                                style: StyleUtility.resendOtpTextStyle.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                ' Sec Left',
                                style: StyleUtility.detailTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'Didn’t received OTP ? ',
                              style: StyleUtility.detailTextStyle
                                  .copyWith(color: ColorUtility.colorAEB1B9),
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.resendOtpTextStyle
                                      .copyWith(),
                                  text: 'Resend OTP',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        buttonText: "Verify OTP",
                        onTab: () {
                          if (otpController.text.isEmpty ||
                              otpController.text.length < 6) {
                            context.showSnackBar(
                                message: "Please Enter 6 Digit Otp");
                          } else {
                            CommonDialog.showLoadingDialog(context);
                            forgotPassVerifyOtpVm.verifyOtp(
                                request: ForgotPassVerifyOtpRequest(
                                    name:
                                        Endpoints.auth.forgetPasswordVerifyOtp,
                                    param: Param(
                                      userId: widget.userId,
                                      otp: otpController.text,
                                    )),
                                onSuccess: (value) {
                                  Navigator.pop(context);

                                  context.showSnackBar(message: value);
                                  Navigator.pushReplacementNamed(context,
                                      RouteName.forgotNewPasswordScreen,
                                      arguments: {"userId": widget.userId});
                                },
                                onFailure: (value) {
                                  Navigator.pop(context);
                                  context.showSnackBar(message: value);
                                });
                          }
                        })),
                SizedBox(
                  height: 35.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
