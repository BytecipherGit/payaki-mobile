import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';

class GridItemWidget extends StatelessWidget {
  final String price;
  final String type;
  final String title;
  final String address;
  final String imageUrl;

  const GridItemWidget({
    super.key,
    required this.price,
    required this.type,
    required this.title,
    required this.address, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r)),
                // Image border
                child:

                // Image.asset(
                //   ImageUtility.productImage,
                //   height: 110.sp,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // )
              NetworkImageWidget(
                height: 110.sp,
                url: imageUrl,
                width: double.infinity,
                errorIconSize: 40.sp,
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 4.w, bottom: 4.w),
                      decoration: BoxDecoration(
                          color: ColorUtility.colorA3803F.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Text(
                        type.toUpperCase(),
                        style: StyleUtility.titleTextStyle.copyWith(
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
                      Text(
                        address,
                        style: StyleUtility.titleTextStyle.copyWith(
                            fontSize: TextSizeUtility.textSize10,
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
  }
}