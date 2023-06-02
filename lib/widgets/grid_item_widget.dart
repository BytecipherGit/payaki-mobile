import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';

class GridItemWidget extends StatelessWidget {
  final String price;
  final String? type;
  final String title;
  final String address;
  final String imageUrl;
  final String? expiredDate;
  final String? isVerified;
  final VoidCallback? onTap;

  const GridItemWidget({
    super.key,
    required this.price,
    required this.type,
    required this.title,
    required this.address,
    required this.imageUrl,
    required this.expiredDate,
    required this.isVerified,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r)),
                child:
                    NetworkImageWidget(
                  height: 110.sp,
                  url: imageUrl,
                  width: double.infinity,
                  errorIconSize: 40.sp,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    type != null ?
                      Container(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 4.w, bottom: 4.w),
                          decoration: BoxDecoration(
                              color: ColorUtility.colorA3803F.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(3.r)),
                          child: Text((type ?? "").toUpperCase(),
                              style: StyleUtility.typeStyle)):const SizedBox(),
                    isVerified == "1" ?
                    Image.asset(ImageUtility.verifiedPostIcon,width: 26.w,):const SizedBox(),

                  ],
                ),
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
                      "₹ $price",
                      style: StyleUtility.headingTextStyle,
                      maxLines: 1,
                    ),
                    Text(
                      title,
                      style: StyleUtility.titleTextStyle
                          .copyWith(color: ColorUtility.color8B97A4),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 13.sp,
                          color: ColorUtility.colorC0C0C0,
                        ),
                        Expanded(
                          child: Text(
                            address,
                            style: StyleUtility.titleTextStyle.copyWith(
                                fontSize: TextSizeUtility.textSize10,
                                color: ColorUtility.colorC0C0C0),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding:  EdgeInsets.only(right: 10.w),
                      child: Row(
                        children: [
                          expiredDate != null ?
                          Expanded(
                            child: Text(
                             // "Exp. in 21 Hours",
                              "Exp.${Moment(DateTime.parse(expiredDate!)).fromNow()}",
                              style: StyleUtility.titleTextStyle.copyWith(
                                  color: ColorUtility.color323436),
                              maxLines: 1,
                            ),
                          ):const SizedBox(),

                          // isVerified == "1" ?
                          // Text(
                          //   "Verified".toUpperCase(),
                          //   style: StyleUtility.headingTextStyle.copyWith(
                          //       fontSize: TextSizeUtility.textSize10,
                          //       color: ColorUtility.color06C972),
                          //   maxLines: 1,
                          // ):const SizedBox(),
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
