import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Review",
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
                        "Add your Review",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 15.h),
                      Text("How would you rate this product?",
                          style: StyleUtility.reviewTitleTextStyle),
                      SizedBox(height: 15.h),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => const Icon(Icons.star,
                            color: ColorUtility.colorFFA500),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: descriptionController,
                        hintText: "Your Reviews",
                        titleText: "Reviews *",
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
                  buttonText: "Submit Review",
                  onTab: () {
                    if (descriptionController.text.isEmpty) {
                      context.showSnackBar(
                          message: 'Please Enter Your Reviews.');
                    } else {
                      // Navigator.pushNamed(context, RouteName.setPriceScreen,
                      //     arguments: {
                      //       "catId": widget.catId,
                      //       "subCatId": widget.subCatId,
                      //       "title": titleController.text,
                      //       "tag": tagController.text,
                      //       "description": descriptionController.text,
                      //     });
                    }
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
