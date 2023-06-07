import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/profile/widget/setting_tile_widget.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Profile",
            style: StyleUtility.headerTextStyle,
          ),
          centerTitle: true,
          // leading: const BackButton(
          //   color: Colors.black, // <-- SEE HERE
          // ),
          elevation: 0,
          shadowColor: ColorUtility.colorE2E5EF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.w, bottom: 18.w),
                  decoration: BoxDecoration(
                    color: ColorUtility.colorEAF2EB,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        ImageUtility.verifyEmailIcon,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: 'Welcome',
                                style: StyleUtility.axiforma400.copyWith(
                                    color: ColorUtility.color001802,
                                    fontSize: TextSizeUtility.textSize14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Name, ',
                                    style: StyleUtility.axiforma600.copyWith(
                                        color: ColorUtility.color001802,
                                        fontSize: TextSizeUtility.textSize14),
                                  ),
                                  TextSpan(
                                    text: "Go to your email",
                                    style: StyleUtility.axiforma400.copyWith(
                                        color: ColorUtility.color001802,
                                        fontSize: TextSizeUtility.textSize14),
                                  ),
                                  TextSpan(
                                    text: " test@mail123.com ",
                                    style: StyleUtility.axiforma600.copyWith(
                                        color: ColorUtility.color001802,
                                        fontSize: TextSizeUtility.textSize14),
                                  ),
                                  TextSpan(
                                    text: "verify your email address.",
                                    style: StyleUtility.axiforma400.copyWith(
                                        color: ColorUtility.color001802,
                                        fontSize: TextSizeUtility.textSize14),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Resend Email",
                              style: StyleUtility.urlTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 25.w, right: 25.w, top: 20.w, bottom: 14.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        ImageUtility.userDummyIcon,
                        width: 90.w,
                        height: 90.w,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "user@mail",
                        style: StyleUtility.headingTextStyle
                            .copyWith(fontSize: TextSizeUtility.textSize22),
                      ),
                      Text("Full Name",
                          textAlign: TextAlign.center,
                          style: StyleUtility.titleTextStyle),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 9.w, horizontal: 16.w),
                                  child: Image.asset(
                                    ImageUtility.faceBookIcon,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 9.w, horizontal: 16.w),
                                  child: Image.asset(
                                    ImageUtility.pinterestIcon,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 9.w, horizontal: 16.w),
                                  child: Image.asset(
                                    ImageUtility.twitterIcon,
                                    width: 20.w,
                                    height: 17.w,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 9.w, horizontal: 16.w),
                                  child: Image.asset(
                                    ImageUtility.instagramIcon,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 9.w, horizontal: 16.w),
                                  child: Image.asset(
                                    ImageUtility.youTubeIcon,
                                    width: 20.w,
                                    height: 14.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.sp,
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ColorUtility.colorF8FAFB,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            side: const BorderSide(
                                color: ColorUtility.colorE2E5EF, width: 2),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteName.editProfileScreen);
                          },
                          child: Text(
                            "Edit Profile",
                            maxLines: 1,
                            style: StyleUtility.buttonTextStyle.copyWith(
                              color: ColorUtility.color152D4A,
                              fontSize: TextSizeUtility.textSize14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 17.w, right: 10.w, top: 15.w, bottom: 33.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Account Settings",
                          style: StyleUtility.headingTextStyle),
                      SizedBox(
                        height: 15.h,
                      ),
                      SettingTileWidget(
                        title: "Change Password",
                        image: ImageUtility.passwordIcon,
                        imageWidth: 14.w,
                        onTap: () {},
                      ),
                      SettingTileWidget(
                        title: "Change Phone Number",
                        image: ImageUtility.phoneIcon,
                        imageWidth: 12.w,
                        onTap: () {},
                      ),
                      SettingTileWidget(
                        title: "Log Out",
                        image: ImageUtility.logOutIcon,
                        imageWidth: 12.w,
                        onTap: () async {
                          await googleSignIn.signOut();
                          Preference().clearSharedPreference();
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteName.logInScreen, (route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
