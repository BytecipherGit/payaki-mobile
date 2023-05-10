import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/auth/logIn/provider/login_provider.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorUtility.colorEFF6EE,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.56,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ImageUtility.welcomeBoardImage,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: height * 0.44,
            ),
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            decoration: BoxDecoration(
                color: ColorUtility.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome!",
                    style: StyleUtility.headingTextStyle,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam.",
                  style: StyleUtility.welcomeDetailTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(buttonText: "Log In", onTab: () {

                  Navigator.pushReplacementNamed(context, RouteName.logInScreen);
                }),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Skip Log In",
                  style: StyleUtility.urlTextStyle.copyWith(
                    color: ColorUtility.color152D4A
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
