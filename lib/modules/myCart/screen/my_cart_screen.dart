import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // ChooseCategoryScreenVm chooseCategoryScreenVm = ChooseCategoryScreenVm();

  int length = 0;

  @override
  void initState() {
    super.initState();

    logD("User Id is ${Preference().getUserId()}");
    // chooseCategoryScreenVm =
    //     Provider.of<ChooseCategoryScreenVm>(context, listen: false);
    // chooseCategoryScreenVm.categoryListApi(
    //     onSuccess: (value) {}, onFailure: (value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "My Cart",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 23.h,
                    ),
                    Text(
                      "My Cart",
                      style: StyleUtility.headingTextStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                padding:
                                    EdgeInsets.only(bottom: 20.h, top: 10.h),
                                itemCount: 22,
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: NetworkImageWidget(
                                              url:
                                                  "http://themindcrm.com/payaki-web/storage/products/622776725.jpeg",
                                              height: 80.w,
                                              width: 80.w,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Samsung camera for sale",
                                                  style: StyleUtility
                                                      .titleTextStyle
                                                      .copyWith(
                                                    fontSize: TextSizeUtility
                                                        .textSize16,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                //   SizedBox(height: 10.w,),
                                                Text(
                                                  "₹ 20,000",
                                                  style: StyleUtility
                                                      .headingTextStyle
                                                      .copyWith(
                                                    fontSize: TextSizeUtility
                                                        .textSize20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            height: 45.w,
                                            width: 45.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color:
                                                    ColorUtility.colorDBC8DD),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.w),
                                              child: Image.asset(
                                                ImageUtility.deleteIcon,
                                                // width: 5.w,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(
                              "Order Info",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Total",
                                  style: StyleUtility.totalTextStyle,
                                ),
                                Expanded(
                                  child: Text(
                                    "₹ 70,000",
                                    style: StyleUtility.headingTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize16),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                        buttonText: "Check out (₹ 70,000)", onTab: () {}),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 65.w),
                      child: Image.asset(ImageUtility.emptyCartImage),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "No Item Available.",
                      style: StyleUtility.noDataTextStyle,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
