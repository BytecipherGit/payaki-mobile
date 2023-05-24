import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/network_image_widget.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  int _current = 0;

  var list = [
    "https://picsum.photos/250?image=9",
    "https://picsum.photos/250?image=10",
    "https://picsum.photos/250?image=12",
    "https://picsum.photos/250?image=15"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    width: double.infinity,
                    height: 330.h //       height: 350.h,
                    ,
                    child: Stack(
                      children: [
                        NetworkImageWidget(
                            width: double.infinity,
                            height: 330.h,
                            errorIconSize: 70.sp,
                            url: list[_current])
                      ],
                    ),
                  ),
                  options: CarouselOptions(
                      height: 350.h,
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      //  aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 300.h),
                  alignment: Alignment.center,
                  child: DotsIndicator(
                    dotsCount: list.length,
                    position: _current,
                    decorator: DotsDecorator(
                      spacing: EdgeInsets.only(left: 2.5, right: 2.5),
                      color: ColorUtility.color7A7A7A,
                      activeColor: ColorUtility.color06C972,
                      size: const Size(7.0, 7.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      activeSize: const Size(40.0, 7.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "₹ 6,50,000",
                          style: StyleUtility.headingTextStyle
                              .copyWith(fontSize: TextSizeUtility.textSize26),
                        )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 3.w),
                          decoration: BoxDecoration(
                              color: ColorUtility.color06C972,
                              borderRadius: BorderRadius.circular(3.r)),
                          child: Center(
                            child: Text("Negotiate".toUpperCase(),
                                style: StyleUtility.typeStyle),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Samsung camera for sale",
                      style: StyleUtility.postDescTextStyle.copyWith(
                          fontSize: TextSizeUtility.textSize18,
                          color: ColorUtility.color43576F),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Location",
                      style: StyleUtility.headingTextStyle,
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageUtility.locationIcon,
                          width: 12.5.w,
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Expanded(
                          child: Text(
                              "Bangalore airport area, Jodhpur, Rajasthan",
                              style: StyleUtility.postDescTextStyle),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Description",
                      style: StyleUtility.headingTextStyle,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex eaolo.",
                        style: StyleUtility.postDescTextStyle),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Tags",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
                      decoration: BoxDecoration(
                          color: ColorUtility.colorC3F4DA,
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Text("Samsung",
                          style: StyleUtility.axiforma400.copyWith(
                              fontSize: TextSizeUtility.textSize14,
                              color: ColorUtility.color06C972)),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Posted By",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                ImageUtility.userDummyIcon,
                                width: 60.w,
                                height: 60.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text(
                                  "User@gmail.com",
                                  style: StyleUtility.headingTextStyle.copyWith(
                                      color: ColorUtility.color43576F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: ColorUtility.color43576F,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 44.h),
                      height: TextSizeUtility.buttonHeight,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorUtility.color4285F4,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageUtility.saveAddIcon,
                                width: 12.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text("Save this Ad",
                                  maxLines: 1,
                                  style: StyleUtility.buttonTextStyle),
                            ],
                          )),
                    ),
                    Text(
                      "Ad ID",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("5997", style: StyleUtility.postDescTextStyle),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Add your review",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                ImageUtility.addReviewIcon,
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 18.w,
                              ),
                              Text(
                                "Add Review",
                                style: StyleUtility.headingTextStyle
                                    .copyWith(color: ColorUtility.color43576F),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: ColorUtility.color43576F,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    Text(
                      "Reviews",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtility.colorEEEEEE),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 13.w,
                                  right: 13.w,
                                  top: 10.w,
                                  bottom: 12.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              ImageUtility.userDummyIcon,
                                              width: 30.w,
                                              height: 30.w,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "User@gmail.com",
                                              style: StyleUtility
                                                  .headingTextStyle
                                                  .copyWith(
                                                      fontSize: TextSizeUtility
                                                          .textSize16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.",
                                    style: StyleUtility.postDescTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton.outline(
                                buttonText: "Quote", onTab: () {})),
                        SizedBox(
                          width: 11.w,
                        ),
                        Expanded(
                            child: CustomButton(
                                buttonText: "Chat", onTab: () {

                              Moment yesterday = Moment.now() - Duration(days: 766, hours: 2); // -26 hours

                              context.showSnackBar(message:yesterday.fromNow());
                            }))
                      ],
                    ),



                    SizedBox(
                      height: 35.h,
                    ),
                    
                    Text("Similar Ads ",style: StyleUtility.headingTextStyle,),


                    GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 15.w,
                          childAspectRatio: 0.90),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.r),
                                        topLeft: Radius.circular(10.r)),
                                    // Image border
                                    child: Image.asset(
                                      ImageUtility.productImage,
                                      height: 110.sp,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10.w,
                                              right: 10.w,
                                              top: 4.w,
                                              bottom: 4.w),
                                          decoration: BoxDecoration(
                                              color: ColorUtility.colorA3803F
                                                  .withOpacity(0.7),
                                              borderRadius:
                                              BorderRadius.circular(3.r)),
                                          child: Text(
                                            "Urgent".toUpperCase(),
                                            style:
                                            StyleUtility.titleTextStyle.copyWith(
                                              color: ColorUtility.whiteColor,
                                              fontSize: TextSizeUtility.textSize12,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Image.asset(
                                        ImageUtility.addFavIcon,
                                        width: 22.w,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorUtility.whiteColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.r),
                                      bottomLeft: Radius.circular(10.r)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 7.w, top: 7.w),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "₹ 6,50,000",
                                        style: StyleUtility.headingTextStyle,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "samsung camera",
                                        style: StyleUtility.titleTextStyle.copyWith(
                                            color: ColorUtility.color8B97A4),
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 13.sp,
                                            color: ColorUtility.colorC0C0C0,
                                          ),
                                          Text(
                                            "bangalore airport area, be",
                                            style: StyleUtility.titleTextStyle
                                                .copyWith(
                                                fontSize:
                                                TextSizeUtility.textSize10,
                                                color: ColorUtility.colorC0C0C0),
                                            maxLines: 1,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
