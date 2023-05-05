import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/auth/signUp/provider/signup_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/loginSignup/signup_request.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

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

  String countryCode = '+91';

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
                      // SimpleTextField(
                      //   controller: phoneNumberController,
                      //   hintText: "Enter your Phone Number",
                      //   titleText: "Phone Number",
                      //   image: ImageUtility.fullNameIcon,
                      //   textInputType: TextInputType.number,
                      // ),

                      MobileNumberTextField(
                          controller: phoneNumberController,
                          onChanged: (phone){
                            countryCode = phone.countryCode;
                      }),
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
                      Consumer<SignUpVm>(
                          builder: (context, model, child) {
                        return CustomButton(
                            buttonText: "Register",
                            onTab: () {

                              if(fullNameController.text.isEmpty){
                                context.showSnackBar(message: "Please Enter Your Full Name.");
                              }
                              else if(userNameController.text.isEmpty){
                                context.showSnackBar(message: "Please Enter Your Username.");
                              }
                              else if(emailController.text.isEmpty){
                                context.showSnackBar(message: "Please Enter Your Email.");
                              }
                              else if(phoneNumberController.text.isEmpty){
                                context.showSnackBar(message: "Please Enter Your Phone Number.");
                              }
                              else if(passwordController.text.isEmpty){
                                context.showSnackBar(message: "Please Enter Your Password.");
                              }else {
                                CommonDialog.showLoadingDialog(context);
                                model.signUp(
                                  request: SignUpRequest(
                                      name: Endpoints.auth.signup,
                                        fullName: fullNameController.text,
                                        userName: userNameController.text,
                                        email: emailController.text,
                                        phone: phoneNumberController.text,
                                        countryCode: countryCode,
                                        pass: passwordController.text,
                                      ),
                                  onSuccess: (value) {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context,
                                        RouteName
                                            .bottomNavigationBarScreen);
                                  },
                                  onFailure: (value) {
                                    Navigator.pop(context);
                                    context.showSnackBar(message: value);
                                  },
                                );
                              }


                            });
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
