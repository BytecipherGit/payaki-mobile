import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/home/viewModel/home_screen_vm.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart'
    as category;
import 'package:payaki/network/model/response/post/premium_and_latest_post_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenVm homeScreenVm = HomeScreenVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeScreenVm = Provider.of<HomeScreenVm>(context, listen: false);
    homeScreenVm.fetchCategoryList(
        onSuccess: (value) {}, onFailure: (value) {});

    homeScreenVm.fetchPremiumAndLatestPost(
        onSuccess: (value) {}, onFailure: (value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      body: Consumer<HomeScreenVm>(builder: (context, homeScreenVm, child) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorUtility.whiteColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.r),
                      bottomRight: Radius.circular(30.r))),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.searchScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: Image.asset(
                                ImageUtility.searchIcon,
                                width: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Image.asset(
                              ImageUtility.notificationIcon,
                              width: 16.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    categoryListView(homeScreenVm.categoryList,
                        homeScreenVm.isCategoryLoading),
                  ],
                ),
              ),
            ),
            Expanded(
              child: homeScreenVm.isPremiumAndLatestPostLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 37.h,
                          ),
                          HomePostWidget(
                              title: "Premium Ad",
                              post: homeScreenVm
                                  .premiumAndLatestPost?.data?.premium),
                          SizedBox(
                            height: 20.h,
                          ),
                          HomePostWidget(
                              title: "Latest Ad",
                              post: homeScreenVm
                                  .premiumAndLatestPost?.data?.latest),
                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ),
            )
          ],
        );
      }),
    );
  }

  Widget categoryListView(
      List<category.Data>? categoryList, bool isCategoryLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Text(
            "Browse Categories",
            style: StyleUtility.headingTextStyle,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 150.sp,
          child: isCategoryLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(left: 20.w),
                  scrollDirection: Axis.horizontal,
                  // itemCount: 21,
                  itemCount: categoryList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 34.w),
                      child: SizedBox(
                        width: 70.sp,
                        height: 70.sp,
                        child: Column(
                          children: [
                            Container(
                                width: 70.sp,
                                height: 70.sp,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtility.colorF5F6FA),
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(20.sp),
                                  child: NetworkImageWidget(
                                      width: 25.w,
                                      height: 25.w,
                                      url: categoryList?[index].picture ?? ""),
                                ))),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              // "Cars & Bike",
                              categoryList?[index].catName ?? "",
                              style: StyleUtility.titleTextStyle.copyWith(
                                  fontSize: TextSizeUtility.textSize12),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}

class HomePostWidget extends StatelessWidget {
  final List<Premium>? post;
  final String title;

  const HomePostWidget({
    super.key,
    this.post,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "Latest Ad",
                title,
                style: StyleUtility.headingTextStyle,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See All",
                  style: StyleUtility.titleTextStyle.copyWith(
                      fontSize: TextSizeUtility.textSize12,
                      color: ColorUtility.color152D4A),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            // itemCount: 4,
            itemCount: post?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 15.w,
                // childAspectRatio: 0.90
                childAspectRatio: 0.82),
            itemBuilder: (context, index) {
              String? image;
              if ((post?[index].image?.length ?? 0) > 0) {
                image = post?[index].image?[0];
              }
              String? type;
              if (post?[index].featured == "1") {
                type = "Featured";
              } else if (post?[index].urgent == "1") {
                type = "Urgent";
              } else if (post?[index].highlight == "1") {
                type = "Highlight";
              }
              return GridItemWidget(
                price: post?[index].price ?? "",
                type: type,
                title: post?[index].productName ?? "",
                address: post?[index].fullAddress ?? "",
                imageUrl: image ?? "",
                expiredDate: post?[index].expiredDate,
                isVerified: post?[index].isVerified,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.postDetailsScreen,
                      arguments: {"postId": post?[index].id});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
