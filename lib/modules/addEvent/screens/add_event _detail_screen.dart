import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/DateTimeTextField.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';

class AddEventDetailScreen extends StatefulWidget {
  final int catId;
  final int subCatId;

  const AddEventDetailScreen(
      {Key? key, required this.catId, required this.subCatId})
      : super(key: key);

  @override
  State<AddEventDetailScreen> createState() => _AddEventDetailScreenState();
}

class _AddEventDetailScreenState extends State<AddEventDetailScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Event",
      ),
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
                        "Details",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
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
                      DateTimeTextField(
                        hintText: "Select Date",
                        titleText: "Date*",
                        icon: Icons.calendar_month,
                        controller: dateController,
                        onTap: () async {
                          final DateTime? selected =
                              await buildShowDatePicker(context);
                          if (selected != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(selected);
                            dateController.text = formattedDate;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      DateTimeTextField(
                        hintText: "Select Time",
                        titleText: "Time*",
                        icon: Icons.watch_later_outlined,
                        controller: timeController,
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      // change the border color
                                      primary: ColorUtility.color844193,
                                      // change the text color
                                      onSurface: ColorUtility.color5B5B5B,
                                    ),
                                  ),
                                  child: child!,
                                );
                              });

                          if (selectedTime != null) {
                            timeController.text = selectedTime.format(context);
                          }
                        },
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
                    if (titleController.text.isEmpty) {
                      context.flushBarTopErrorMessage(
                          message: 'Please Enter Title.');
                    } else if (descriptionController.text.isEmpty) {
                      context.flushBarTopErrorMessage(
                          message: 'Please Enter Description.');
                    }else if (dateController.text.isEmpty) {
                      context.flushBarTopErrorMessage(
                          message: 'Please Select Date.');
                    }else if (timeController.text.isEmpty) {
                      context.flushBarTopErrorMessage(
                          message: 'Please Select Time.');
                    } else {
                      Navigator.pushNamed(
                          context, RouteName.addEventPromoScreen,
                          arguments: {
                            "catId": widget.catId,
                            "subCatId": widget.subCatId,
                            "title": titleController.text,
                            "description": descriptionController.text,
                            "eventDate": dateController.text,
                            "eventTime": timeController.text,
                          });
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

  Future<DateTime?> buildShowDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light().copyWith(
                primary: ColorUtility.color844193,
                // Set the primary color
                onPrimary: Colors.white, // Set the text color
              ),
              dialogBackgroundColor: Colors.white, // Set the background color
            ),
            child: child!,
          );
        });
  }
}
