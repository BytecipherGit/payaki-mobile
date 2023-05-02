import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorUtility.colorEFF6EE,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                height: height * 0.35,
                padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 30.h),
                child: Center(
                  child: Image.asset(
                    ImageUtility.signUpBoardImage,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: height * 0.65,
                ),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
                decoration: BoxDecoration(
                    color: ColorUtility.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
                child: SafeArea(
                  top: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Let’s create your account !",
                          style: StyleUtility.headingTextStyle,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Don’t have an account? ',
                            style: StyleUtility.detailTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                style: StyleUtility.urlTextStyle,
                                text: 'Sign In',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, RouteName.logInScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SimpleTextField(
                        controller: fullNameController,
                        hintText: "Enter your Full Name",
                        titleText: "Full Name",
                        image: ImageUtility.fullNameIcon,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: userNameController,
                        hintText: "Enter Username",
                        titleText: "Username",
                        image: ImageUtility.userNameIcon,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: emailController,
                        hintText: "Enter Email",
                        titleText: "Email",
                        image: ImageUtility.emailIcon,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: phoneNumberController,
                        hintText: "Enter your Phone Number",
                        titleText: "Phone Number",
                        image: ImageUtility.fullNameIcon,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: passwordController,
                        hintText: "Enter Password",
                        titleText: "Password",
                        image: ImageUtility.passwordIcon,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'By clicking on “Register Now” button you are\nagree to our ',
                            style: StyleUtility.detailTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                style: StyleUtility.urlTextStyle,
                                text: 'Terms & Condition',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 37.h,
                      ),
                      CustomButton(buttonText: "Register", onTab: () {}),
                      SizedBox(
                        height: 28.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45.w),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: ColorUtility.colorBCBCBC,
                              height: 1,
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                "Or continue with",
                                style: StyleUtility.axiforma400.copyWith(
                                    fontSize: TextSizeUtility.textSize12,
                                    color: ColorUtility.colorBCBCBC),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              color: ColorUtility.colorBCBCBC,
                              height: 1,
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 55.w,
                                width: 55.w,
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: ColorUtility.colorEFEFEF),
                                child: Image.asset(ImageUtility.googleIcon),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 55.w,
                            width: 55.w,
                            padding: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtility.colorEFEFEF),
                            child: Image.asset(ImageUtility.faceBookIcon),
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
            ],
          ),
        ),
      ),
    );
  }
}
