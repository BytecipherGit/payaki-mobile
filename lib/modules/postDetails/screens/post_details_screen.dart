import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/postDetails/provider/post_detail_screen_vm.dart';
import 'package:payaki/modules/reviewAndMail/replyEmail/screen/reply_email_screen.dart';
import 'package:payaki/network/model/response/post/post_detail_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsScreen extends StatefulWidget {
  final String postId;

  const PostDetailsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  int _current = 0;
  var imageHeight = 330.h;

  PostDetailScreenVm postDetailScreenVm = PostDetailScreenVm();

  @override
  void initState() {
    super.initState();
    postDetailScreenVm =
        Provider.of<PostDetailScreenVm>(context, listen: false);
    postDetailScreenVm.getPostDetail(
        onSuccess: (value) {},
        onFailure: (value) {
          Navigator.pop(context);
          context.showSnackBar(message: value);
        },
        postId: widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostDetailScreenVm>(
          builder: (context, postDetailScreenVm, child) {
        return postDetailScreenVm.isLoading == false
            ? SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        (postDetailScreenVm.postDetailResponse?.data?.image
                                        ?.length ??
                                    0) >
                                0
                            ? postDetailScreenVm.postDetailResponse!.data!
                                        .image!.length ==
                                    1
                                ? NetworkImageWidget(
                                    width: double.infinity,
                                    height: imageHeight,
                                    errorIconSize: 70.sp,
                                    url: postDetailScreenVm.postDetailResponse
                                        ?.data?.image?[_current])
                                : Stack(
                                    children: [
                                      CarouselSlider.builder(
                                        itemCount: postDetailScreenVm
                                                .postDetailResponse
                                                ?.data
                                                ?.image
                                                ?.length ??
                                            0,
                                        itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) =>
                                            Stack(
                                          children: [
                                            NetworkImageWidget(
                                                width: double.infinity,
                                                height: imageHeight,
                                                errorIconSize: 70.sp,
                                                url: postDetailScreenVm
                                                    .postDetailResponse
                                                    ?.data
                                                    ?.image?[_current])
                                          ],
                                        ),
                                        options: CarouselOptions(
                                            height: imageHeight,
                                            viewportFraction: 1,
                                            autoPlay: true,
                                            enlargeCenterPage: false,
                                            //  aspectRatio: 16 / 9,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                _current = index;
                                              });
                                            }),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 300.h),
                                        alignment: Alignment.center,
                                        child: DotsIndicator(
                                          dotsCount: postDetailScreenVm
                                                  .postDetailResponse
                                                  ?.data
                                                  ?.image
                                                  ?.length ??
                                              0,
                                          position: _current,
                                          decorator: DotsDecorator(
                                            spacing: EdgeInsets.only(
                                                left: 2.5, right: 2.5),
                                            color: ColorUtility.color7A7A7A,
                                            activeColor:
                                                ColorUtility.color06C972,
                                            size: const Size(7.0, 7.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            activeSize: const Size(40.0, 7.0),
                                            activeShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                            : SizedBox(
                                height: imageHeight,
                                child: Container(
                                  color: ColorUtility.colorEFEFEF,
                                  child: Center(
                                    child: Icon(
                                      Icons.image_not_supported_rounded,
                                      color: ColorUtility.color43576F,
                                      size: 70.sp,
                                    ),
                                  ),
                                ),
                              ),
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          actions: [
                            Padding(
                              padding: EdgeInsets.only(right: 22.w),
                              child: InkWell(
                                onTap: () {
                                  Share.share(postDetailScreenVm
                                          .postDetailResponse
                                          ?.data
                                          ?.productName ??
                                      "");
                                },
                                child: Image.asset(
                                  ImageUtility.shareIcon,
                                  width: 17.w,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SafeArea(
                        top: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "₹ ${postDetailScreenVm.postDetailResponse?.data?.price ?? ""}",
                                  style: StyleUtility.headingTextStyle.copyWith(
                                      fontSize: TextSizeUtility.textSize26),
                                )),
                                postDetailScreenVm.postDetailResponse?.data
                                            ?.negotiable ==
                                        "1"
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 3.w),
                                        decoration: BoxDecoration(
                                            color: ColorUtility.color06C972,
                                            borderRadius:
                                                BorderRadius.circular(3.r)),
                                        child: Center(
                                          child: Text("Negotiate".toUpperCase(),
                                              style: StyleUtility.typeStyle),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    // "Samsung camera for sale",
                                    postDetailScreenVm.postDetailResponse?.data
                                            ?.productName ??
                                        "",
                                    style: StyleUtility.postDescTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize18,
                                            color: ColorUtility.color43576F),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                if (postDetailScreenVm
                                        .postDetailResponse?.data?.createdAt !=
                                    null)
                                  Text(
                                    Moment(DateTime.parse(postDetailScreenVm
                                            .postDetailResponse!
                                            .data!
                                            .createdAt!))
                                        .fromNow(),

                                    // Moment(DateTime.parse("2023-06-01 20:47:40"))
                                    //     .fromNow(form: UnitStringForm.full).replaceAll('in','')+" left",
                                    style: StyleUtility.postDescTextStyle
                                        .copyWith(
                                            fontSize:
                                                TextSizeUtility.textSize12),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Location",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ImageUtility.locationIcon,
                                  width: 12.5.w,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Expanded(
                                  child: Text(
                                      //  "Bangalore airport area, Jodhpur, Rajasthan",
                                      postDetailScreenVm.postDetailResponse
                                              ?.data?.fullAddress ??
                                          "",
                                      style: StyleUtility.postDescTextStyle),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Phone Number",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ImageUtility.phoneIcon,
                                  width: 12.5.w,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Expanded(
                                  child: Text(
                                      postDetailScreenVm.postDetailResponse
                                              ?.data?.phone ??
                                          "",
                                      style: StyleUtility.postDescTextStyle),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Description",
                              style: StyleUtility.headingTextStyle,
                            ),
                            Text(
                                //  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex eaolo.",
                                postDetailScreenVm.postDetailResponse?.data
                                        ?.description ??
                                    "",
                                style: StyleUtility.postDescTextStyle),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Tags",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Wrap(
                              children: List<Widget>.generate(
                                postDetailScreenVm.tagArray?.length ?? 0,
                                (index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 3.w),
                                    margin: EdgeInsets.only(
                                        right: 10.w, bottom: 10.w),
                                    decoration: BoxDecoration(
                                        color: ColorUtility.colorC3F4DA,
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    child: Text(
                                        postDetailScreenVm.tagArray?[index] ??
                                            "",
                                        style: StyleUtility.axiforma400
                                            .copyWith(
                                                fontSize:
                                                    TextSizeUtility.textSize14,
                                                color:
                                                    ColorUtility.color06C972)),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Posted By",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageUtility.userDummyIcon,
                                        width: 60.w,
                                        height: 60.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              //  "User@gmail.com",
                                              postDetailScreenVm
                                                      .postDetailResponse
                                                      ?.data
                                                      ?.postUserDetails
                                                      ?.email ??
                                                  "",
                                              style: StyleUtility
                                                  .headingTextStyle
                                                  .copyWith(
                                                      color: ColorUtility
                                                          .color43576F),
                                            ),
                                            Text("+91 1234567890",
                                                style: StyleUtility
                                                    .reviewTitleTextStyle),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                  color: ColorUtility.color43576F,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Ad ID",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                                postDetailScreenVm
                                        .postDetailResponse?.data?.id ??
                                    "",
                                style: StyleUtility.postDescTextStyle),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              "Expire Ad",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (postDetailScreenVm
                                    .postDetailResponse?.data?.expiredDate !=
                                null)
                              Text(
                                  Moment(DateTime.parse(postDetailScreenVm
                                          .postDetailResponse!
                                          .data!
                                          .expiredDate!))
                                      .fromNow(),
                                  style: StyleUtility.postDescTextStyle),
                            SizedBox(
                              height: 25.h,
                            ),
                            if (Preference().getUserLogin())
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: SizedBox(
                                        height: TextSizeUtility.buttonHeight,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  RouteName.replyEmailScreen,
                                                  arguments: {
                                                    "postId": widget.postId,
                                                    "productName":
                                                        postDetailScreenVm
                                                                .postDetailResponse
                                                                ?.data
                                                                ?.productName ??
                                                            "",
                                                    "receiverName":
                                                        postDetailScreenVm
                                                                .postDetailResponse
                                                                ?.data
                                                                ?.postUserDetails
                                                                ?.name ??
                                                            "",
                                                    "receiverEmail":
                                                        postDetailScreenVm
                                                                .postDetailResponse
                                                                ?.data
                                                                ?.postUserDetails
                                                                ?.email ??
                                                            "",
                                                  });

                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder:
                                              //             (context) =>
                                              //                 ReplyEmailScreen(
                                              //                   postId: widget
                                              //                       .postId,
                                              //                   productName: postDetailScreenVm
                                              //                           .postDetailResponse
                                              //                           ?.data
                                              //                           ?.productName ??
                                              //                       "",
                                              //                   receiverName: postDetailScreenVm
                                              //                           .postDetailResponse
                                              //                           ?.data
                                              //                           ?.postUserDetails
                                              //                           ?.name ??
                                              //                       "",
                                              //                   receiverEmail: postDetailScreenVm
                                              //                           .postDetailResponse
                                              //                           ?.data
                                              //                           ?.postUserDetails
                                              //                           ?.email ??
                                              //                       "",
                                              //                 )));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorUtility.color4285F4,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  ImageUtility.emailIcon,
                                                  width: 14.w,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text("Reply on Email",
                                                    maxLines: 1,
                                                    style: StyleUtility
                                                        .buttonTextStyle),
                                              ],
                                            )),
                                      )),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        height: TextSizeUtility.buttonHeight,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              CommonDialog.showLoadingDialog(
                                                  context);
                                              postDetailScreenVm
                                                  .postLikeDislike(
                                                      onSuccess: (message) {
                                                        Navigator.pop(context);
                                                        context.showSnackBar(
                                                            message: message);
                                                      },
                                                      onFailure: (message) {
                                                        Navigator.pop(context);
                                                        context.showSnackBar(
                                                            message: message);
                                                      },
                                                      postId: widget.postId);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorUtility.color4285F4,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  ImageUtility.saveAddIcon,
                                                  width: 12.w,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text("Save this Ad",
                                                    maxLines: 1,
                                                    style: StyleUtility
                                                        .buttonTextStyle),
                                              ],
                                            )),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 26.h,
                                  ),
                                  Text(
                                    "Add your review",
                                    style: StyleUtility.headingTextStyle,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteName.addReviewScreen,
                                          arguments: {
                                            "postId": widget.postId,
                                          });
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                ImageUtility.addReviewIcon,
                                                width: 25.w,
                                              ),
                                              SizedBox(
                                                width: 18.w,
                                              ),
                                              Text(
                                                "Add Review",
                                                style: StyleUtility
                                                    .headingTextStyle
                                                    .copyWith(
                                                        color: ColorUtility
                                                            .color43576F),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16.sp,
                                          color: ColorUtility.color43576F,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 42.h,
                                  ),
                                ],
                              ),
                            Text(
                              "User reviews",
                              style: StyleUtility.headingTextStyle,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            (postDetailScreenVm.postDetailResponse?.data
                                            ?.reviewRating?.length ??
                                        0) >
                                    0
                                ? UserReviews(
                                    reviewRating: postDetailScreenVm
                                        .postDetailResponse?.data?.reviewRating)
                                : Text(
                                    "No User reviews",
                                    style: StyleUtility.headingTextStyle,
                                  ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomButton.outline(
                                        buttonText: "Quote", onTab: () {})),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Expanded(
                                    child: CustomButton(
                                        buttonText: "Chat",
                                        onTab: () {
                                          if (Preference().getUserLogin()) {
                                            context.showSnackBar(
                                                message: "Comming Soon.");
                                          } else {
                                            showLoginDialog(context);
                                          }
                                        }))
                              ],
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Text(
                              "Similar Ads ",
                              style: StyleUtility.headingTextStyle,
                            ),
                            GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                              itemCount: postDetailScreenVm.postDetailResponse
                                      ?.data?.similarPost?.length ??
                                  0,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 15.w,
                                      // childAspectRatio: 0.90
                                      childAspectRatio: 0.82),
                              itemBuilder: (context, index) {
                                var similarAdd = postDetailScreenVm
                                    .postDetailResponse?.data?.similarPost;

                                String? image;

                                if ((similarAdd?[index].image?.length ?? 0) >
                                    0) {
                                  image = similarAdd?[index].image?[0];
                                }

                                String? type;
                                if (similarAdd?[index].featured == "1") {
                                  type = "Featured";
                                } else if (similarAdd?[index].urgent == "1") {
                                  type = "Urgent";
                                } else if (similarAdd?[index].highlight ==
                                    "1") {
                                  type = "Highlight";
                                }
                                return GridItemWidget(
                                  imageUrl: image ?? "",
                                  price: similarAdd?[index].price ?? "",
                                  type: type,
                                  title: similarAdd?[index].productName ?? "",
                                  address: similarAdd?[index].fullAddress ?? "",
                                  expiredDate: similarAdd?[index].expiredDate,
                                  isVerified: similarAdd?[index].isVerified,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.postDetailsScreen,
                                        arguments: {
                                          "postId": similarAdd?[index].id
                                        });
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  Future<dynamic> showLoginDialog(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.only(left: 20.w, right: 20.w),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 17.w, right: 17.w, top: 42.w, bottom: 27.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          ImageUtility.loginDialogImage,
                          width: 160.w,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          "Log In to chat or send quote",
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Please log In first for chat",
                          style: StyleUtility.titleTextStyle,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomButton(
                            buttonText: "Log In",
                            onTab: () {
                              Navigator.pop(context);
                              goToLogIn();
                            }),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Later",
                                style: StyleUtility.laterTextStyle,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  goToLogIn() {
    Navigator.pushNamed(context, RouteName.logInScreen);
  }
}

class UserReviews extends StatelessWidget {
  final List<ReviewRating>? reviewRating;

  const UserReviews({
    super.key,
    this.reviewRating,
  });

  @override
  Widget build(BuildContext context) {
    return (reviewRating?.length ?? 0) > 0
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: reviewRating?.length ?? 0,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              var userReview = reviewRating;
              return Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorUtility.colorEEEEEE),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 13.w, right: 13.w, top: 10.w, bottom: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageUtility.userDummyIcon,
                                  width: 40.w,
                                  height: 40.w,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userReview?[index].reviewerName ?? "",
                                        style: StyleUtility.headingTextStyle
                                            .copyWith(
                                                fontSize:
                                                    TextSizeUtility.textSize16),
                                        maxLines: 1,
                                      ),
                                      if (userReview?[index].reviewDate != null)
                                        Text(
                                          Moment(DateTime.parse(
                                                  userReview![index]
                                                      .reviewDate!))
                                              .fromNow(),
                                          style: StyleUtility.axiforma600
                                              .copyWith(
                                                  fontSize: TextSizeUtility
                                                      .textSize10,
                                                  color:
                                                      ColorUtility.color8B97A4),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: double.parse(
                                userReview?[index].rating ?? "0.0"),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => const Icon(Icons.star,
                                color: ColorUtility.colorFFA500),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        userReview?[index].review ?? "",
                        style: StyleUtility.postDescTextStyle,
                      ),
                    ],
                  ),
                ),
              );
            })
        : Text(
            "No User reviews",
            style: StyleUtility.headingTextStyle,
          );
  }
}
