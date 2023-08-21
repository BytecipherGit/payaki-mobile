import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isShowBackButton;
  final bool? isShowCartIcon;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.isShowBackButton = true,
      this.isShowCartIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorUtility.whiteColor,
        title: Text(
          title,
          style: StyleUtility.headerTextStyle,
        ),
        centerTitle: true,
        elevation: 1,
        leading: isShowBackButton == true
            ? const BackButton(
                color: Colors.black, // <-- SEE HERE
              )
            : null,
        actions: [
          isShowCartIcon == true
              ? Center(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 10.w),
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.myCartScreen);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(15.sp),
                                child: Image.asset(
                                  ImageUtility.addToCartIcon,
                                  width: 18.sp,
                                  color: ColorUtility.color43576F,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ],
        shadowColor: ColorUtility.colorE2E5EF);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
