import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

import '../../../generated/l10n.dart';

class SetPriceScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;

  const SetPriceScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.tag,
      required this.description})
      : super(key: key);

  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  TextEditingController priceController = TextEditingController();
  bool negotiatePrice = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      FocusManager.instance.primaryFocus!.unfocus();
    },
      child: Scaffold(
        backgroundColor: ColorUtility.whiteColor,
        appBar:  CustomAppBar(
          title:S.of(context).postAd,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 23.h),
                        Text(
                          S.of(context).setAPrice,
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(height: 25.h),
                        SimpleTextField(
                          controller: priceController,
                          hintText: S.of(context).enterPrice,
                          titleText:S.of(context).price,
                          textInputType: TextInputType.number,
                          inputFormatter: [
                            DecimalInputFormatter(),
                          ],
                          onTapOutside: (String value) {
                            CommonMethod.numberFormatForTextEditing(
                                priceController);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.sp,
                              height: 20.sp,
                              child: Checkbox(
                                checkColor: ColorUtility.color9C5FA3,
                                activeColor: ColorUtility.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      width: 2.0,
                                      color: ColorUtility.color9C5FA3),
                                ),
                                value: negotiatePrice,
                                onChanged: (bool? value) {
                                  setState(() {
                                    negotiatePrice = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              S.of(context).negotiatePrice,
                              style: StyleUtility.axiforma500.copyWith(
                                  fontSize: TextSizeUtility.textSize14,
                                  color: ColorUtility.color5B5B5B),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                    buttonText:S.of(context).next,
                    onTab: () {
                      if (priceController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message:S.of(context).pleaseEnterPrice );
                      } else {
                        Navigator.pushNamed(context, RouteName.galleryScreen,
                            arguments: {
                              "catId": widget.catId,
                              "subCatId": widget.subCatId,
                              "title": widget.title,
                              "tag": widget.tag,
                              "description": widget.description,
                              //  "price": priceController.text,
                              "price": priceController.text.replaceAll(',', ''),
                              "negotiate": negotiatePrice == true ? 1 : 0,
                            });
                      }
                    }),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
