import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/grid_item_widget.dart';
import 'package:payaki/network/model/response/search/search_result_response.dart';


class SearchResultScreen extends StatefulWidget {

 final  List<Data> searchPostList;
  const SearchResultScreen({Key? key, required this.searchPostList}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Search Result",
            style: StyleUtility.headerTextStyle,
          ),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          elevation: 1,
          shadowColor: ColorUtility.colorE2E5EF),
      body: Column(
        children: [
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: 45.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(color: ColorUtility.colorE2E5EF)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageUtility.shortByIcon,
                            height: 10.sp,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Sort by",
                            style: StyleUtility.titleTextStyle
                                .copyWith(color: ColorUtility.color1E1E1E),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: 45.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          border: Border.all(color: ColorUtility.colorE2E5EF)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageUtility.filterIcon,
                            height: 10.sp,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Filter",
                            style: StyleUtility.titleTextStyle
                                .copyWith(color: ColorUtility.color1E1E1E),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: Container(
              color: ColorUtility.colorF6F6F6,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 20.h, bottom: 50.h),
                  //  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                //  itemCount: 21,
                  itemCount: widget.searchPostList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 15.w,
                      childAspectRatio: 0.90),
                  itemBuilder: (context, index) {
                    return  GridItemWidget(
                      price: widget.searchPostList[index].price ?? "",
                      type: "Urgent",
                      title: widget.searchPostList[index].productName ?? "",
                      address: widget.searchPostList[index].location ?? "",
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
