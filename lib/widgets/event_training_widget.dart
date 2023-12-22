import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';

import '../generated/l10n.dart';

class EventTrainingWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? expiredDate;
  final bool? isShowDeleteIcon;
  final String? price;

  final VoidCallback? onTap;
  final VoidCallback? onDeleteIconTap;

  const EventTrainingWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.expiredDate,
    required this.onTap,
    this.onDeleteIconTap,
    this.isShowDeleteIcon = false, this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.brown.withOpacity(0.5),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r)),
                child: NetworkImageWidget(
                  height: 110.sp,
                  url: imageUrl,
                  width: double.infinity,
                  errorIconSize: 40.sp,
                ),
              ),

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
                padding: EdgeInsets.only(left: 7.w, top: 7.w, right: 4.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(price != null)
                    Text(
                      "${Constant.currencySymbol} ${CommonMethod.numberFormat(price!)}",
                      style: StyleUtility.headingTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      title,
                      style: StyleUtility.titleTextStyle
                          .copyWith(color: ColorUtility.color8B97A4),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        children: [
                          expiredDate != null
                              ? Expanded(
                            child: Text(
                              "${ S.of(context).exp} ${Moment(DateTime.parse(expiredDate!)).fromNow()}",
                              style: StyleUtility.titleTextStyle
                                  .copyWith(
                                  color: ColorUtility.color323436),
                              maxLines: 1,
                            ),
                          )
                              : const SizedBox(),
                          // isFavouriteList == true
                          //     ? InkWell(
                          //         onTap: onFavouriteIconTap,
                          //         child: Image.asset(
                          //           ImageUtility.favIcon,
                          //           height: 18.sp,
                          //         ),
                          //       )
                          //     : const SizedBox(),
                          isShowDeleteIcon == true
                              ? InkWell(
                            onTap: onDeleteIconTap,
                            child: Image.asset(
                              ImageUtility.deleteIcon,
                              color: ColorUtility.colorEB4335,
                              height: 22.sp,
                            ),
                          )
                              : const SizedBox(),
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
