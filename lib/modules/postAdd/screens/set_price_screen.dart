import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class SetPriceScreen extends StatefulWidget {

  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;

  const SetPriceScreen({Key? key, required this.catId, required this.subCatId, required this.title,required this.tag, required this.description}) : super(key: key);

  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  TextEditingController priceController = TextEditingController();
  bool negotiatePrice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Post Ad",
            style: StyleUtility.headerTextStyle,
          ),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          elevation: 1,
          shadowColor: ColorUtility.colorE2E5EF),
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
                        "Set a Price",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: priceController,
                        hintText: "Enter Price",
                        titleText: "Price *",
                        textInputType: TextInputType.number,
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
                              checkColor: ColorUtility.color06C972,
                              activeColor: ColorUtility.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 2.0,
                                    color: ColorUtility.color06C972),
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
                            "Negotiate Price",
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
                  buttonText: "Next",
                  onTab: () {
                    if (priceController.text.isEmpty) {
                      context.showSnackBar(message: 'Please Enter Price.');
                    } else {
                      Navigator.pushNamed(context, RouteName.galleryScreen,
                          arguments: {
                            "catId": widget.catId,
                            "subCatId": widget.subCatId,
                            "title": widget.title,
                            "tag": widget.tag,
                            "description": widget.description,
                            "price": priceController.text,
                            "negotiate": negotiatePrice == true ? 1:0,
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
    );
  }
}
