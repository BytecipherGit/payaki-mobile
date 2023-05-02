import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';

class ForgotPassSendOtpScreen extends StatefulWidget {
  const ForgotPassSendOtpScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassSendOtpScreen> createState() =>
      _ForgotPassSendOtpScreenState();
}

class _ForgotPassSendOtpScreenState extends State<ForgotPassSendOtpScreen> {
  TextEditingController mobileController = TextEditingController();

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
                  print(phone.number);
                  print(phone.countryCode);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                          buttonText: "Send OTP",
                          onTab: () {
                            Navigator.pushNamed(
                                context, RouteName.forgotPassVerifyOtpScreen);
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
