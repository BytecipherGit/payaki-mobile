import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/myAds/viewModel/my_ads_screen_vm.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/circular_progress_widget.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:provider/provider.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  MyAdsScreenVm myAdsScreenVm = MyAdsScreenVm();

  @override
  void initState() {
    super.initState();
    myAdsScreenVm = Provider.of(context, listen: false);
    myAdsScreenVm.getMyAds();
    myAdsScreenVm.getFavouriteAds();
  }

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
                child: Consumer<MyAdsScreenVm>(
                    builder: (context, myAdsScreenVm, child) {
                  return Container(
                    color: ColorUtility.colorF6F6F6,
                    child: TabBarView(
                      children: [
                        myAdsScreenVm.myAdsListLoading == true
                            ? const CircularProgressWidget()
                            : AddListWidget(
                                myAdsList: myAdsScreenVm.myAdsList,
                              ),
                        AddListWidget(
                          myAdsList: myAdsScreenVm.favouriteAdsList,
                          isFavouriteList: true,
                        ),
                        Container(child: Text("3")),
                        Container(
                          child: Text("4"),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddListWidget extends StatelessWidget {
  final bool? isFavouriteList;
  final List<Data>? myAdsList;

  const AddListWidget({
    super.key,
    this.myAdsList,
    this.isFavouriteList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: (myAdsList?.length ?? 0) > 0
          ? GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 20.h, bottom: 60.h),
              itemCount: myAdsList?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 15.w,
                  childAspectRatio: 0.82),
              itemBuilder: (context, index) {
                String? image;
                if ((myAdsList?[index].image?.length ?? 0) > 0) {
                  image = myAdsList?[index].image?[0];
                }

                return GridItemWidget(
                  price: myAdsList?[index].price ?? "",
                  title: myAdsList?[index].productName ?? "",
                  address: myAdsList?[index].fullAddress ?? "",
                  imageUrl: image ?? "",
                  expiredDate: myAdsList?[index].expiredDate,
                  isVerified: myAdsList?[index].isVerified,
                  urgent: myAdsList?[index].urgent,
                  featured: myAdsList?[index].featured,
                  highlight: myAdsList?[index].highlight,
                  isFavouriteList: isFavouriteList,
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.postDetailsScreen,
                        arguments: {"postId": myAdsList?[index].id});
                  },
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
