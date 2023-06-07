import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/network_image_widget.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  TextEditingController facebookController = TextEditingController();
  TextEditingController pinterestController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();

  XFile? image;

  String? networkImage;

  // var networkImage;

  Future selectFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {});
    print('image select from gallery:- $image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Edit Profile",
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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Stack(
                        children: [
                          ClipOval(
                            child: image != null
                                ? Image.file(
                                    File(image!.path),
                                    width: 90.w,
                                    height: 90.w,
                                    fit: BoxFit.cover,
                                  )
                                : networkImage != null && networkImage != ""
                                    ? Container(
                                        width: 100.w,
                                        height: 100.w,
                                        child: NetworkImageWidget(
                                            width: 25.w,
                                            height: 25.w,
                                            url: networkImage ?? ""),
                                      )
                                    : Image.asset(
                                        ImageUtility.userDummyIcon,
                                        width: 90.w,
                                        height: 90.w,
                                      ),
                          ),
                          Container(
                            width: 90.w,
                            height: 90.w,
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                selectFromGallery();
                              },
                              child: Container(
                                child: Image.asset(
                                  ImageUtility.editIcon,
                                  width: 26.w,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 35.h),
                      SimpleTextField(
                        controller: nameController,
                        hintText: "Enter Your Name",
                        titleText: "Name *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: addressController,
                        hintText: "Enter Your Address",
                        titleText: "Address",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: aboutMeController,
                        hintText: "About Me",
                        titleText: "About Me",
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: facebookController,
                        hintText: "Enter Facebook Profile Link",
                        titleText: "Facebook",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: pinterestController,
                        hintText: "Enter Pinterest Profile Link",
                        titleText: "Pinterest",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: twitterController,
                        hintText: "Enter Twitter Profile Link",
                        titleText: "Twitter",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: instagramController,
                        hintText: "Enter Instagram Profile Link",
                        titleText: "Instagram",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: youtubeController,
                        hintText: "Enter Youtube Profile Link",
                        titleText: "Youtube",
                      ),
                      SizedBox(
                        height: 54.h,
                      ),
                      CustomButton(
                          buttonText: "Update",
                          onTab: () {
                            if (nameController.text.isEmpty) {
                              context.showSnackBar(
                                  message: 'Please Enter Title.');
                            } else {}
                          }),
                      SizedBox(
                        height: 47.h,
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
