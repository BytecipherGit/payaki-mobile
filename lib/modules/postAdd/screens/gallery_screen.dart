import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}
class _GalleryScreenState extends State<GalleryScreen> {
  List<XFile> selectedImages = []; // List of selected image
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage();
    if (pickedFile.isNotEmpty) {
      selectedImages.addAll(pickedFile);
      setState(() {});
    } else {}
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
              SizedBox(height: 23.h),
              Text(
                "Gallery",
                style: StyleUtility.headingTextStyle,
              ),
              SizedBox(height: 25.h),
              Text(
                "Attach File",
                style: StyleUtility.inputTextStyle,
              ),
              DottedBorder(
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  color: ColorUtility.colorDEDEDE,
                  radius: Radius.circular(10.r),
                  padding: EdgeInsets.only(top: 24.sp, bottom: 24.sp),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
                        getImages();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageUtility.uploadImage,
                            width: 50.w,
                            height: 50.w,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Upload Images",
                            style: StyleUtility.axiforma500.copyWith(
                                fontSize: TextSizeUtility.textSize14,
                                color: ColorUtility.color8F8F8F),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Mandatory Only JPG, PNG, JPEG File Accepted",
                style: StyleUtility.axiforma400.copyWith(
                    fontSize: TextSizeUtility.textSize12,
                    color: ColorUtility.color8F8F8F),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                  ),
                  itemCount: selectedImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: Image.file(
                            File(selectedImages[index].path),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedImages.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(3.sp),
                            child: Image.asset(
                              ImageUtility.removeImage,
                              width: 15.w,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  buttonText: "Next",
                  onTab: () {
                       Navigator.pushNamed(context, RouteName.addLocationScreen);
                  }),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
