import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/grid_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorUtility.whiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r))),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.searchScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Image.asset(
                              ImageUtility.searchIcon,
                              width: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Image.asset(
                            ImageUtility.notificationIcon,
                            width: 16.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Text(
                      "Browse Categories",
                      style: StyleUtility.headingTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 150.sp,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 20.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: 21,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 34.w),
                            child: SizedBox(
                              width: 70.sp,
                              height: 70.sp,
                              child: Column(
                                children: [
                                  Container(
                                      width: 70.sp,
                                      height: 70.sp,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtility.colorF5F6FA),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.all(20.sp),
                                        child:
                                            Image.asset(ImageUtility.carImage),
                                      ))),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Text(
                                    "Cars & Bike",
                                    style: StyleUtility.titleTextStyle.copyWith(
                                        fontSize: TextSizeUtility.textSize12),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 37.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Premium Ad",
                  style: StyleUtility.headingTextStyle,
                ),
                Text(
                  "See All",
                  style: StyleUtility.titleTextStyle.copyWith(
                      fontSize: TextSizeUtility.textSize12,
                      color: ColorUtility.color152D4A),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: GridView.builder(
                padding: EdgeInsets.only(top: 20.h,bottom: 50.h),
                itemCount: 21,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 15.w,
                    childAspectRatio: 0.90),
                itemBuilder: (context, index) {
                  return const GridItemWidget(
                    price: "6,50,000",
                    type: "Urgent",
                    title: "samsung camera",
                    address: "bangalore airport area, be",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
