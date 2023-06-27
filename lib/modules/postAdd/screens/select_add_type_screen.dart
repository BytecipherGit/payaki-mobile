import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/provider/add_post_vm.dart';
import 'package:payaki/modules/postAdd/widget/premium_widget.dart';
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
  final String phone;
  final int availableDays;

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
      required this.state,
      required this.phone,
      required this.availableDays})
      : super(key: key);

  @override
  State<SelectAddTypeScreen> createState() => _SelectAddTypeScreenState();
}

class _SelectAddTypeScreenState extends State<SelectAddTypeScreen> {
  String? selectAddTypeValue; //no radio button will be selected on initial

  String? selectPremiumValue;

  String freeAd = "Free Ad";
  String premium = "Premium";

  bool featuredValue = false;
  bool urgentValue = false;
  bool highlightValue = false;

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
          child: Consumer<AddPostVm>(builder: (context, addPostVm, child) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 23.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Make your Ad Premium",
                          style: StyleUtility.headingTextStyle,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Material(
                          color: ColorUtility.colorF8FAFB,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            onTap: () {
                              selectAddTypeValue = freeAd;
                              selectPremiumValue = null;
                              addPostVm.updateUi();
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  // color: ColorUtility.colorF8FAFB,
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: ColorUtility.colorE2E5EF)),
                              child: Row(
                                children: [
                                  Radio(
                                    splashRadius: 0,
                                    activeColor: ColorUtility.color9C5FA3,
                                    value: freeAd,
                                    groupValue: selectAddTypeValue,
                                    onChanged: (value) {
                                      selectAddTypeValue = value;
                                      selectPremiumValue = null;
                                      addPostVm.updateUi();
                                    },
                                  ),
                                  Text(
                                    freeAd,
                                    style: StyleUtility.radioTitleTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Material(
                          color: ColorUtility.whiteColor,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            onTap: () {
                              selectAddTypeValue = premium;
                              addPostVm.updateUi();
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: ColorUtility.colorA3803F)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        splashRadius: 0,
                                        activeColor: ColorUtility.color9C5FA3,
                                        value: premium,
                                        groupValue: selectAddTypeValue,
                                        onChanged: (value) {
                                          selectAddTypeValue = value;
                                          addPostVm.updateUi();
                                        },
                                      ),
                                      Text(
                                        premium,
                                        style: StyleUtility.radioTitleTextStyle
                                            .copyWith(
                                                color:
                                                    ColorUtility.colorD19830),
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
                                      color: ColorUtility.color9C5FA3,
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      selectAddTypeValue == premium
                          ? SizedBox(
                              height: 310.h,
                              child: ListView(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PremiumWidget(
                                    title: "Featured",
                                    description:
                                        "Featured ads attract higher-quality viewer and are displayed prominently in the Featured ads section home page.",
                                    price: "200",
                                    month: "3 Months",
                                    checkBoxValue: featuredValue,
                                    onSelect: (vale) {
                                      featuredValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  PremiumWidget(
                                    title: "Urgent",
                                    description:
                                        "Make your ad stand out and let viewer know that your advertise is time sensitive.",
                                    price: "500",
                                    month: "6 Months",
                                    checkBoxValue: urgentValue,
                                    onSelect: (vale) {
                                      urgentValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  PremiumWidget(
                                    title: "Highlight",
                                    description:
                                        "Make your ad highlighted with border in listing search result page. Easy to focus.",
                                    price: "900",
                                    month: "1 Year",
                                    checkBoxValue: highlightValue,
                                    onSelect: (vale) {
                                      highlightValue = vale;
                                      addPostVm.updateUi();
                                    },
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                      buttonText: "Post Add",
                      onTab: () {
                        if (selectAddTypeValue == null) {
                          context.showSnackBar(
                              message: "Please Select Add Type.");
                        } else {
                          var featured = featuredValue == true ? "1" : "0";
                          var urgent = urgentValue == true ? "1" : "0";
                          var highlight = highlightValue == true ? "1" : "0";

                          logD("featured $featured");
                          logD("urgent $urgent");
                          logD("highlight $highlight");

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
                              phone: widget.phone,
                              availableDays: widget.availableDays.toString(),
                              featured: featured,
                              urgent: urgent,
                              highlight: highlight,
                              onSuccess: (value) {
                                Navigator.pop(context);
                                context.showToast(message: value);
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RouteName.bottomNavigationBarScreen,
                                    (route) => false);
                              },
                              onFailure: (value) {
                                Navigator.pop(context);
                                context.showSnackBar(message: value);
                              });
                        }
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
