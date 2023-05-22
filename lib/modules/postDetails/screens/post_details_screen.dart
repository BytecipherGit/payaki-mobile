import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
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
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) =>
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
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
                        color: ColorUtility.color43576F
                      ),
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
                        Image.asset(ImageUtility.locationIcon,
                        width: 12.5.w,),
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
                            color: ColorUtility.color06C972
                          )),
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
                          child: Text(
                            "User@gmail.com",
                            style: StyleUtility.headingTextStyle.copyWith(
                              color: ColorUtility.color43576F
                            ),
                          ),
                        ),
                        
                        Icon(Icons.arrow_forward_ios,size: 16.sp,color: ColorUtility.color43576F,)

                        
                      ],
                    ),


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
                              
                              Image.asset(ImageUtility.addReviewIcon,width: 25.w,),
                              SizedBox(
                                width: 18.w,
                              ),
                              Text(
                                "Add Review",
                                style: StyleUtility.headingTextStyle.copyWith(
                                    color: ColorUtility.color43576F
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios,size: 16.sp,color: ColorUtility.color43576F,)


                      ],
                    ),


                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Ad ID",
                      style: StyleUtility.headingTextStyle,
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "5997",
                      style: StyleUtility.postDescTextStyle
                    ),





                    SizedBox(
                      height: 20.h,
                    )


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
