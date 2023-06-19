import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/modules/reviewAndMail/quote/viewModel/quote_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/quote_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class QuoteScreen extends StatefulWidget {
  final String postId;
  final String postUserId;
  final String productName;

  const QuoteScreen(
      {Key? key,
      required this.postId,
      required this.postUserId,
      required this.productName})
      : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            widget.productName,
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
                        "Place your Quote",
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: amountController,
                        hintText: "Enter your Amount",
                        titleText: "Amount*",
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: messageController,
                        hintText: "Your message",
                        titleText: "Message *",
                        maxLine: 5,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<QuoteScreenVm>(builder: (context, quoteScreenVm, child) {
                return CustomButton(
                    buttonText: "Send",
                    onTab: () {
                      if (amountController.text.isEmpty) {
                        context.showSnackBar(message: 'Please Enter Amount.');
                      } else if (messageController.text.isEmpty) {
                        context.showSnackBar(message: 'Please Enter Message.');
                      } else {
                        CommonDialog.showLoadingDialog(context);
                        quoteScreenVm.sendQuote(
                          request: QuoteRequest(
                              name: Endpoints.reviewEndPoints.placeQuote,
                              param: Param(
                                postId: widget.postId,
                                  postUserId: widget.postUserId,
                                  amount: amountController.text,
                                  message: messageController.text,
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
    );
  }
}
