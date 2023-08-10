import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';

class UploadImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? type;

  const UploadImageWidget(
      {Key? key, required this.onTap, required this.title, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleUtility.inputTextStyle,
        ),
        DottedBorder(
            strokeWidth: 2,
            borderType: BorderType.RRect,
            color: ColorUtility.colorDEDEDE,
            radius: Radius.circular(10.r),
            padding: EdgeInsets.only(top: 24.sp, bottom: 24.sp),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      type != null && type == Constant.videoFile ?
                      ImageUtility.uploadVideo:
                      ImageUtility.uploadImage,
                      width: 50.w,
                      height: 50.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      type != null && type == Constant.videoFile
                          ? "Upload Video"
                          : "Upload Images",
                      style: StyleUtility.axiforma500.copyWith(
                          fontSize: TextSizeUtility.textSize14,
                          color: ColorUtility.color8F8F8F),
                    ),
                  ],
                ),
              ),
            )),
        SizedBox(
          height: 2.h,
        ),
        Text(
          type != null && type == Constant.videoFile
              ? "Mandatory Only MP4, AVI File Accepted"
              : "Mandatory Only JPG, PNG, JPEG File Accepted",
          style: StyleUtility.axiforma400.copyWith(
              fontSize: TextSizeUtility.textSize12,
              color: ColorUtility.color8F8F8F),
        ),
      ],
    );
  }
}
