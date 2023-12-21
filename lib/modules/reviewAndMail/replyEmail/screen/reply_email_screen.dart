import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/reviewAndMail/replyEmail/viewModel/reply_email_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/reply_email_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/validators.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class ReplyEmailScreen extends StatefulWidget {
  final String postId;
  final String productName;
  final String receiverName;
  final String receiverEmail;

  const ReplyEmailScreen(
      {Key? key,
      required this.postId,
      required this.productName,
      required this.receiverName,
      required this.receiverEmail})
      : super(key: key);

  @override
  State<ReplyEmailScreen> createState() => _ReplyEmailScreenState();
}

class _ReplyEmailScreenState extends State<ReplyEmailScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  String? countryCode;

  @override
  void initState() {
    super.initState();
    logD("Email ${widget.receiverEmail}");
    logD("ReceiverName ${widget.receiverName}");
    logD("ProductName ${widget.productName}");
    logD("PostId ${widget.postId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: CustomAppBar(
        title: "${S.of(context).sendMailTo}${widget.receiverName}",
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
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: fullNameController,
                        hintText: S.of(context).enterFullName,
                        titleText:S.of(context).fullName,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: emailController,
                        hintText: S.of(context).EnterEmail,
                        titleText: S.of(context).Email,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MobileNumberTextField(
                          controller: phoneNumberController,
                          onChanged: (phone) {
                            countryCode = phone.countryCode;
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: messageController,
                        hintText: S.of(context).writeYourMessage,
                        titleText: S.of(context).message,
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<ReplyEmailScreenVm>(
                  builder: (context, replyEmailScreenVm, child) {
                return CustomButton(
                    buttonText: S.of(context).sendMail,
                    onTab: () {
                      if (fullNameController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message: S.of(context).pleaseEnterYourFullName);
                      } else if (Validators.checkValidateEmail(
                              emailController.text) ==
                          false) {
                        context.flushBarTopErrorMessage(
                            message:S.of(context).pleaseEnterValidEmail);
                      } else if (phoneNumberController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message: S.of(context).PleaseEnterYourMobileNumber);
                      } else if (messageController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message: S.of(context).pleaseEnterMessage);
                      } else {
                        CommonDialog.showLoadingDialog(context);
                        replyEmailScreenVm.replyEmail(
                          request: ReplyEmailRequest(
                              name: Endpoints.reviewEndPoints.replyByEmail,
                              param: Param(
                                name: fullNameController.text,
                                email: emailController.text,
                                phone: phoneNumberController.text,
                                message: messageController.text,
                                productId: widget.postId,
                                productName: widget.productName,
                                toEmail: widget.receiverEmail,
                                receiverName: widget.receiverName,
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
    );
  }
}
