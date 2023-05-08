import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class ChooseCategoryScreen extends StatefulWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCategoryScreen> createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  ChooseCategoryScreenVm chooseCategoryScreenVm = ChooseCategoryScreenVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    logD("User Id is ${Preference().getUserId()}");
    chooseCategoryScreenVm =
        Provider.of<ChooseCategoryScreenVm>(context, listen: false);
    chooseCategoryScreenVm.categoryListApi(
        onSuccess: (value) {}, onFailure: (value) {});
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23.h,
              ),
              Text(
                "Choose Category",
                style: StyleUtility.headingTextStyle,
              ),
              Expanded(child: Consumer<ChooseCategoryScreenVm>(
                  builder: (context, chooseCategoryScreenVm, child) {
                return chooseCategoryScreenVm.isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: chooseCategoryScreenVm.categoryList?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.subCategoryScreen,
                                  arguments: {
                                    "catId": int.parse(chooseCategoryScreenVm
                                        .categoryList![index].catId!),
                                    "catName": chooseCategoryScreenVm
                                        .categoryList?[index].catName
                                  }
                                  );
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 0),
                              horizontalTitleGap: 0,
                              title: Text(
                                // "Cars $index",
                                chooseCategoryScreenVm
                                        .categoryList![index].catName ??
                                    "",
                                style: StyleUtility.titleTextStyle,
                              ),
                              // leading: Image.asset(
                              //   ImageUtility.carImage,
                              //   width: 25.w,
                              // ),
                              leading: NetworkImageWidget(
                                  width: 25.w,
                                  height: 25.w,
                                  url: chooseCategoryScreenVm
                                          .categoryList![index].picture ??
                                      ""),
                              trailing: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 18.sp,
                                color: ColorUtility.color43576F,
                              ),
                            ),
                          );
                        });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
