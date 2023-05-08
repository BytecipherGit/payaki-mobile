import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/postAdd/provider/add_post_vm.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class AddLocationScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String description;
  final String price;
  final int negotiate;
  final List<XFile> selectedImages; // List of selected image

  const AddLocationScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.description,
      required this.price,
      required this.negotiate,
      required this.selectedImages})
      : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  TextEditingController locationController = TextEditingController();

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
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 23.h),
                        Text(
                          "Location",
                          style: StyleUtility.headingTextStyle,
                        ),
                        SizedBox(height: 25.h),
                        SimpleTextField(
                          controller: locationController,
                          hintText: "Enter Location",
                          titleText: "Add Location",
                          image: ImageUtility.locationIcon,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<AddPostVm>(builder: (context, addPostVm, child) {
                  return CustomButton(
                      buttonText: "Next",
                      onTab: () {
                        if (locationController.text.isEmpty) {
                          context.showSnackBar(message: "Please Enter Location.");
                        }else{
                          CommonDialog.showLoadingDialog(context);
                          addPostVm.addPostApi(
                              images: widget.selectedImages,
                              productName: widget.title,
                              description: widget.description,
                              categoryId: widget.catId,
                              subCategoryId: widget.subCatId,
                              price: widget.price,
                              negotiable: widget.negotiate,
                              location: "Subh Sampada Colony Nipania",
                              city: "Indore",
                              country: "India",
                              latlong: "22.87557556,72.4664465",
                              state: "IN.35",
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



                        // Navigator.pushNamed(context, RouteName.userDetailScreen);
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
