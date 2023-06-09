import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  TextEditingController brandController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
                        "Ads Details",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: brandController,
                        hintText: "Brand",
                        titleText: "Brand *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: titleController,
                        hintText: "Title for your advertise",
                        titleText: "Title *",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: descriptionController,
                        hintText: "Tell us more about your advertise",
                        titleText: "Description *",
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  buttonText: "Next",
                  onTab: () {
                    Navigator.pushNamed(context, RouteName.setPriceScreen);
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
