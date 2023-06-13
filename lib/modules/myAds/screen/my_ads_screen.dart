import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/grid_item_widget.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorUtility.whiteColor,
        appBar: AppBar(
            backgroundColor: ColorUtility.whiteColor,
            title: Text(
              "My Ads",
              style: StyleUtility.headerTextStyle,
            ),
            centerTitle: true,
            elevation: 1,
            shadowColor: ColorUtility.colorE2E5EF),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              TabBar(
                labelPadding: const EdgeInsets.all(0),
                unselectedLabelColor: ColorUtility.color8B97A4,
                labelColor: ColorUtility.color152D4A,
                labelStyle: StyleUtility.inputTextStyle,
                unselectedLabelStyle: StyleUtility.hintTextStyle,
                indicatorColor: ColorUtility.color152D4A,
                tabs: [
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'My Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Favourite Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Pending Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  Tab(
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorUtility.colorE2E5EF))),
                        child: const Center(
                            child: Text(
                          'Expired Ads',
                          textAlign: TextAlign.center,
                        ))),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: ColorUtility.colorF6F6F6,
                  child: TabBarView(
                    children: [
                      MyAddList(),
                      Container(
                        child: Text("2"),
                      ),
                      Container(child: Text("3")),
                      Container(
                        child: Text("4"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAddList extends StatelessWidget {
  const MyAddList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: (4 ?? 0) > 0
          ? GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
              // itemCount: 4,
              itemCount: 14,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 15.w,
                  // childAspectRatio: 0.90
                  childAspectRatio: 0.82),
              itemBuilder: (context, index) {
                String? image;
                // if ((post?[index].image?.length ?? 0) > 0) {
                //   image = post?[index].image?[0];
                // }
                String? type;
                // if (post?[index].featured == "1") {
                //   type = "Featured";
                // } else if (post?[index].urgent == "1") {
                //   type = "Urgent";
                // } else if (post?[index].highlight == "1") {
                //   type = "Highlight";
                // }
                return GridItemWidget(
                  price: "1200",
                  type: type,
                  title: "samsung camera f...",
                  address: "dsd",
                  imageUrl: "",
                  expiredDate: DateTime.now().toString(),
                  isVerified: "1",
                  onTap: () {},
                );
              },
            )
          : SizedBox(
              height: 100.sp,
              child: Center(
                child: Text(
                  "No Post Found",
                  style: StyleUtility.inputTextStyle,
                ),
              )),
    );
  }
}
