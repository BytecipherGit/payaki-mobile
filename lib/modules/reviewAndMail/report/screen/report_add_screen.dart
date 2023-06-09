import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/reviewAndMail/report/viewModel/report_add_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/report_ad_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/validators.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/dropdown_widget.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class ReportAddScreen extends StatefulWidget {
//  final String postId;

  const ReportAddScreen({Key? key}) : super(key: key);

  @override
  State<ReportAddScreen> createState() => _ReportAddScreenState();
}

class _ReportAddScreenState extends State<ReportAddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userNameOfOtherPersonController =
      TextEditingController();
  TextEditingController violationUrlController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  String? selectedViolationType;

  List<String> violationTypeList = [
    "Posting contact information",
    "Advertising another website",
    "Fake add posted",
    "Non-featured ad posted requiring abnormal bidding",
    "Other"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // logD("PostId ${widget.postId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Report",
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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                SimpleTextField(
                  controller: nameController,
                  hintText: "Enter Your Name",
                  titleText: "Your Name",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: emailController,
                  hintText: "Enter Email Address",
                  titleText: "Email Address *",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: userNameController,
                  hintText: "Enter Username",
                  titleText: "Username",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: userNameOfOtherPersonController,
                  hintText: "Enter Username",
                  titleText: "Username of other Person",
                ),
                SizedBox(
                  height: 15.h,
                ),
                DropDownWidget(
                  titleText: "Violation Type",
                  hintText: "Select Violation Type",
                  itemList: violationTypeList,
                  selectedValue: selectedViolationType,
                  onValueChange: (value) {
                    selectedViolationType = value;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: violationUrlController,
                  hintText: "Enter URL",
                  titleText: "URL of  Violation",
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: detailController,
                  hintText: "Enter Violation Details",
                  titleText: "Violation Details *",
                  maxLine: 5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<ReportAddScreenVm>(
                    builder: (context, reportAddScreenVm, child) {
                  return CustomButton(
                      buttonText: "Report Violation",
                      onTab: () {
                        if (Validators.checkValidateEmail(
                                emailController.text) ==
                            false) {
                          context.showSnackBar(
                              message: 'Please Enter Valid Email Address.');
                        } else if (violationUrlController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    violationUrlController.text) ==
                                false) {
                          context.showSnackBar(
                              message: "Please Enter Valid Link.");
                        } else if (detailController.text.isEmpty) {
                          context.showSnackBar(
                              message: 'Please Enter Violation Details');
                        } else {
                          CommonDialog.showLoadingDialog(context);
                          reportAddScreenVm.reportViolation(
                            request: ReportAdRequest(
                                name: Endpoints.reviewEndPoints.reportViolation,
                                param: Param(
                                  name: nameController.text,
                                  email: emailController.text,
                                  username: userNameController.text,
                                  otherPersonName:
                                      userNameOfOtherPersonController.text,
                                  violationType: selectedViolationType,
                                  violationUrl: violationUrlController.text,
                                  violationDetails: detailController.text,
                                )),
                            onSuccess: (message) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              context.showSnackBar(message: message);
                            },
                            onFailure: (message) {
                              Navigator.pop(context);
                              context.showSnackBar(message: message);
                            },
                          );
                        }
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
