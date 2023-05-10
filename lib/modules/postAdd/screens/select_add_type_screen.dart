import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/postAdd/provider/add_post_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:provider/provider.dart';

class SelectAddTypeScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String tag;
  final String description;
  final String price;
  final int negotiate;
  final List<XFile> selectedImages;

  final String location;
  final String city;
  final String country;
  final String latlong;
  final String state;

  const SelectAddTypeScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.tag,
      required this.description,
      required this.price,
      required this.negotiate,
      required this.selectedImages,
      required this.location,
      required this.city,
      required this.country,
      required this.latlong,
      required this.state})
      : super(key: key);

  @override
  State<SelectAddTypeScreen> createState() => _SelectAddTypeScreenState();
}

class _SelectAddTypeScreenState extends State<SelectAddTypeScreen> {
  String? selectAddTypeValue; //no radio button will be selected on initial

  String? selectPremiumValue;

  String freeAd = "Free Ad";
  String premium = "Premium";

  String featured = "Featured";
  String urgent = "Urgent";
  String highlight = "Highlight";

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
        child: ChangeNotifierProvider(
          create: (context) => AddPostVm(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 23.h),
                      Text(
                        "Make your Ad Premium",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtility.colorF8FAFB,
                                border: Border.all(
                                    color: ColorUtility.colorE2E5EF)),
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: ColorUtility.color06C972,
                                  value: freeAd,
                                  groupValue: selectAddTypeValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectAddTypeValue = value;
                                      selectPremiumValue = null;
                                    });
                                  },
                                ),
                                Text(
                                  freeAd,
                                  style: StyleUtility.radioTitleTextStyle,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtility.whiteColor,
                                border: Border.all(
                                    color: ColorUtility.colorA3803F)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: ColorUtility.color06C972,
                                      value: premium,
                                      groupValue: selectAddTypeValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectAddTypeValue = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      premium,
                                      style: StyleUtility.radioTitleTextStyle
                                          .copyWith(
                                              color: ColorUtility.colorD19830),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 19.w),
                                  padding: EdgeInsets.only(
                                      right: 5.w,
                                      left: 5,
                                      top: 2.w,
                                      bottom: 2.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.r),
                                    color: ColorUtility.color06C972,
                                  ),
                                  child: Text(
                                    "RECOMMENDED",
                                    style: StyleUtility.axiforma400.copyWith(
                                        color: ColorUtility.whiteColor,
                                        fontSize: TextSizeUtility.textSize10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),

                          selectAddTypeValue == premium ?
                          SizedBox(
                            height: 310.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                //your widget items here

                                PremiumWidget(
                                  title: featured,
                                  description:
                                      "Featured ads attract higher-quality viewer and are displayed prominently in the Featured ads section home page.",
                                  price: "200",
                                  month: "3 Months",
                                  selectValue: selectPremiumValue,
                                  onSelect: (vale) {
                                    selectPremiumValue = vale;

                                    setState(() {});
                                  },
                                ),

                                SizedBox(
                                  width: 10.w,
                                ),

                                PremiumWidget(
                                  title: urgent,
                                  description:
                                      "Make your ad stand out and let viewer know that your advertise is time sensitive.",
                                  price: "500",
                                  month: "6 Months",
                                  selectValue: selectPremiumValue,
                                  onSelect: (vale) {
                                    selectPremiumValue = vale;

                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                PremiumWidget(
                                  title: highlight,
                                  description:
                                      "Make your ad highlighted with border in listing search result page. Easy to focus.",
                                  price: "900",
                                  month: "1 Year",
                                  selectValue: selectPremiumValue,
                                  onSelect: (vale) {
                                    selectPremiumValue = vale;

                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                          ):const SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
                Consumer<AddPostVm>(builder: (context, addPostVm, child) {
                  return CustomButton(
                      buttonText: "Post Add",
                      onTab: () {
                        if (selectAddTypeValue == null) {
                          context.showSnackBar(message: "Please Select Add Type.");
                        } else if (selectAddTypeValue == premium &&
                            selectPremiumValue == null) {
                          context.showSnackBar(
                              message: "Please Select Premium Type.");
                        } else {
                          CommonDialog.showLoadingDialog(context);
                          addPostVm.addPostApi(
                              images: widget.selectedImages,
                              productName: widget.title,
                              tag: widget.tag,
                              description: widget.description,
                              categoryId: widget.catId,
                              subCategoryId: widget.subCatId,
                              price: widget.price,
                              negotiable: widget.negotiate,
                              location: widget.location,
                              city: widget.city,
                              country: widget.country,
                              latlong: widget.latlong,
                              state: widget.state,
                              featured: selectPremiumValue == featured ? "1":"0",
                              urgent:  selectPremiumValue == urgent ? "1":"0",
                              highlight:  selectPremiumValue == highlight ? "1":"0",
                              onSuccess: (value) {
                                Navigator.pop(context);
                                context.showToast(message: value);
                                Navigator.pushNamedAndRemoveUntil(context, RouteName.bottomNavigationBarScreen, (route) => false);

                              },
                              onFailure: (value) {
                                Navigator.pop(context);
                                context.showSnackBar(message: value);
                              });


                        }
                      });
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

class PremiumWidget extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String month;
  final String? selectValue;
  final ValueChanged onSelect;

  const PremiumWidget({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.month,
    required this.onSelect,
    required this.selectValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding:
          EdgeInsets.only(left: 12.w, right: 12.w, top: 22.h, bottom: 36.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorUtility.colorD9E7F8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Radio(
              activeColor: ColorUtility.color06C972,
              value: title,
              groupValue: selectValue,
              onChanged: (value) {
                onSelect.call(value);
                // setState(() {
                //   title = value;
                // });
              },
            ),
          ),
          Text(
            title,
            style: StyleUtility.headerTextStyle
                .copyWith(fontSize: TextSizeUtility.textSize18),
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            description,
            style: StyleUtility.axiforma400.copyWith(
                fontSize: TextSizeUtility.textSize14,
                color: ColorUtility.color43576F),
          ),
          SizedBox(
            height: 29.h,
          ),
          Text(
            "\$$price",
            style: StyleUtility.headerTextStyle.copyWith(
                fontSize: TextSizeUtility.textSize24,
                color: ColorUtility.color1F1F1F),
          ),
          Text(
            "$month",
            style: StyleUtility.axiforma400.copyWith(
                fontSize: TextSizeUtility.textSize10,
                color: ColorUtility.color1F1F1F),
          ),
        ],
      ),
    );
  }
}