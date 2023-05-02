import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/auth/signUp/screens/sign_up_screen.dart';
import 'package:payaki/modules/postAdd/screens/choose_category_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool checkBoxValue = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;

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
                    ImageUtility.loginBoardImage,
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
                          "Welcome Back !",
                          style: StyleUtility.headingTextStyle,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          "Please enter your account here",
                          style: StyleUtility.detailTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
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
                        controller: passwordController,
                        hintText: "Enter Password",
                        titleText: "Password",
                        image: ImageUtility.passwordIcon,
                        textInputType: TextInputType.visiblePassword,
                        passwordVisible: passwordVisible,
                        onPrefixIconTap: () {
                          passwordVisible = !passwordVisible;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20.sp,
                                height: 20.sp,
                                child: Checkbox(
                                  checkColor: ColorUtility.color06C972,
                                  activeColor: ColorUtility.whiteColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => const BorderSide(
                                        width: 2.0,
                                        color: ColorUtility.color06C972),
                                  ),
                                  value: checkBoxValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkBoxValue = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Remember me ",
                                style: StyleUtility.axiforma500.copyWith(
                                    fontSize: TextSizeUtility.textSize14,
                                    color: ColorUtility.color5B5B5B),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.forgotPassSendOtpScreen);
                            },
                            child: Text(
                              "Recovery password",
                              style: StyleUtility.axiforma500.copyWith(
                                  fontSize: TextSizeUtility.textSize14,
                                  color: ColorUtility.color152D4A),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      CustomButton(
                          buttonText: "Log In",
                          onTab: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChooseCategoryScreen()));
                          }),
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
                        height: 30.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Don’t have an account? \n',
                            style: StyleUtility.detailTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                style: StyleUtility.urlTextStyle,
                                text: 'Sign Up',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, RouteName.signUpScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
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
