import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/modules/reviewAndMail/report/viewModel/report_add_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/report_ad_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/validators.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/dropdown_widget.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class ReportAddScreen extends StatefulWidget {
  final String postUrl;

  const ReportAddScreen({Key? key, required this.postUrl}) : super(key: key);

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
    super.initState();

    violationUrlController.text = widget.postUrl;
    if (Preference().getUserLogin()) {
      nameController.text = Preference().getName();
      userNameController.text = Preference().getUserName();
      emailController.text = Preference().getUserEmail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar:  CustomAppBar(
        title: S.of(context).report,
      ),
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
                  hintText: S.of(context).enterYourName,
                  titleText: S.of(context).yourName,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: emailController,
                  hintText:S.of(context).EnterEmail,
                  titleText:S.of(context).Email,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: userNameController,
                  hintText: S.of(context).enterUserName,
                  titleText:S.of(context).userName,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: userNameOfOtherPersonController,
                  hintText:S.of(context).enterUserName,
                  titleText: S.of(context).useNameOfOtherPerson,
                ),
                SizedBox(
                  height: 15.h,
                ),
                DropDownWidget(
                  titleText: S.of(context).violationType,
                  hintText: S.of(context).selectViolationType,
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
                  hintText: S.of(context).enterURL,
                  titleText:S.of(context).uRLOfViolation
                ),
                SizedBox(
                  height: 15.h,
                ),
                SimpleTextField(
                  controller: detailController,
                  hintText: S.of(context).enterViolationDetails,
                  titleText:S.of(context).violationDetails,
                  maxLine: 5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<ReportAddScreenVm>(
                    builder: (context, reportAddScreenVm, child) {
                  return CustomButton(
                      buttonText: S.of(context).reportViolation,
                      onTab: () {
                        if (nameController.text.isEmpty) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseEnterYourName);
                        } else if (Validators.checkValidateEmail(
                                emailController.text) ==
                            false) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseEnterEmail);
                        } else if (selectedViolationType == null) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseSelectViolationType);
                        } else if (violationUrlController.text.isNotEmpty &&
                            Validators.checkValidateUrl(
                                    violationUrlController.text) ==
                                false) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseEnterValidLink);
                        } else if (detailController.text.isEmpty) {
                          context.flushBarTopErrorMessage(
                              message: S.of(context).pleaseEnterViolationDetails);
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
                              context.flushBarTopSuccessMessage(message: message);
                            },
                            onFailure: (message) {
                              Navigator.pop(context);
                              context.flushBarTopErrorMessage(message: message);
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
