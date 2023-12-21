import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/custom_button.dart';

import '../generated/l10n.dart';

class DeleteAlertDialog extends StatelessWidget {
  final VoidCallback onDeleteTap;
  final String? yesText;
  final String? desc;

  const DeleteAlertDialog({
    super.key,
    required this.onDeleteTap,
    this.yesText,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        insetPadding: EdgeInsets.only(left: 20.w, right: 20.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 19.w, right: 19.w, top: 24.w, bottom: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  ImageUtility.deletePostImage,
                  width: 160.w,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  desc ??
                      S.of(context).areYouSureYouWantTODelete,
                  style: StyleUtility.headingTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton.text(
                          buttonText:S.of(context).cancel,
                          onTab: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomButton(
                          buttonText: yesText ?? S.of(context).deletePost,
                          onTab: () {
                            Navigator.pop(context);
                            onDeleteTap();
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
