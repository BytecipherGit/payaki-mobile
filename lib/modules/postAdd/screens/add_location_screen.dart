import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

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
              CustomButton(buttonText: "Next", onTab: () {

                Navigator.pushNamed(context, RouteName.userDetailScreen);

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
