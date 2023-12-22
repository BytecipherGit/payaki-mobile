import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

import '../generated/l10n.dart';

class DateTimeTextField extends StatelessWidget {
  const DateTimeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.titleText,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String titleText;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          Text(
            titleText ?? "",
            style: StyleUtility.inputTextStyle,
          ),
        Container(
          // height: 55.sp,
          child: TextFormField(
            onTap: () async {
              onTap();
            },
            controller: controller,
            textAlign: TextAlign.start,
            readOnly: true,
            style: StyleUtility.inputTextStyle,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 20.w, top: 16, bottom: 16, right: 5.w),
              filled: true,
              fillColor: ColorUtility.colorF8FAFB,
              hintStyle: StyleUtility.hintTextStyle,
              hintText:  S.of(context).selectDate,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: ColorUtility.colorE2E5EF,
                ),
              ),
              suffixIcon: Icon(
                icon,
                color: ColorUtility.color152D4A,
                size: 16.sp,
              ),
              focusColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
