import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/myCart/viewModel/my_car_screen_vm.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
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
  MyCartScreenVm myCartScreenVm = MyCartScreenVm();

  int length = 0;

  @override
  void initState() {
    super.initState();

    logD("User Id is ${Preference().getUserId()}");
    myCartScreenVm = Provider.of<MyCartScreenVm>(context, listen: false);
    myCartScreenVm.cartList(
        onSuccess: (String value) {},
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "My Cart",
      ),
      body: SafeArea(
        child:
            Consumer<MyCartScreenVm>(builder: (context, myCartScreenVm, child) {
          var myCart = myCartScreenVm.cartListResponse?.data;
          return myCartScreenVm.isLoading == true
              ? const CircularProgressWidget()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: (myCart?.products?.length ?? 0) > 0
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
                                        padding: EdgeInsets.only(
                                            bottom: 20.h, top: 10.h),
                                        itemCount: myCart?.products?.length,
                                        primary: false,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    child: NetworkImageWidget(
                                                      url: myCart
                                                          ?.products?[index]
                                                          .productImage,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          myCart
                                                                  ?.products?[
                                                                      index]
                                                                  .productName ??
                                                              "",
                                                          style: StyleUtility
                                                              .titleTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize16,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          height: 4.w,
                                                        ),
                                                        Text(
                                                          "₹ ${myCart?.products?[index].productPrice ?? ""}",
                                                          style: StyleUtility
                                                              .headingTextStyle
                                                              .copyWith(
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize20,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      CommonDialog
                                                          .showLoadingDialog(
                                                              context);
                                                      myCartScreenVm
                                                          .removeFromCart(
                                                              onSuccess:
                                                                  (message) {
                                                                Navigator.pop(
                                                                    context);
                                                                context.flushBarTopSuccessMessage(
                                                                    message:
                                                                        message);

                                                                myCartScreenVm
                                                                    .cartList(
                                                                        onSuccess:
                                                                            (String
                                                                                value) {},
                                                                        onFailure:
                                                                            (value) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          context.flushBarTopErrorMessage(
                                                                              message: value.toString());
                                                                        });
                                                              },
                                                              onFailure:
                                                                  (message) {
                                                                Navigator.pop(
                                                                    context);
                                                                context.flushBarTopErrorMessage(
                                                                    message:
                                                                        message);
                                                              },
                                                              index: index,
                                                              postId: myCart
                                                                  ?.products?[
                                                                      index]
                                                                  .productId);
                                                    },
                                                    child: Container(
                                                      height: 45.w,
                                                      width: 45.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: ColorUtility
                                                              .colorDBC8DD),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.w),
                                                        child: Image.asset(
                                                          ImageUtility
                                                              .deleteIcon,
                                                          // width: 5.w,
                                                        ),
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
                                            "₹ ${myCart?.total ?? ""}",
                                            style: StyleUtility.headingTextStyle
                                                .copyWith(
                                                    fontSize: TextSizeUtility
                                                        .textSize16),
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
                                buttonText:
                                    "Check out (${"₹ ${myCart?.total ?? ""}"})",
                                onTab: () {}),
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
                );
        }),
      ),
    );
  }
}
