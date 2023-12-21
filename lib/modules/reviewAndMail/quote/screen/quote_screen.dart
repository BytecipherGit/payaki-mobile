import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/modules/reviewAndMail/quote/viewModel/quote_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/reviewAndMail/quote_request.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

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
      appBar: CustomAppBar(
        title: widget.productName,
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
                        S.of(context).placeYourQuote,
                        style: StyleUtility.headingTextStyle,
                      ),
                      SizedBox(height: 25.h),
                      SimpleTextField(
                        controller: amountController,
                        hintText: S.of(context).enterYourAmount,
                        titleText: S.of(context).amount,
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          DecimalInputFormatter(),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SimpleTextField(
                        controller: messageController,
                        hintText: S.of(context).yourMessage,
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
              Consumer<QuoteScreenVm>(builder: (context, quoteScreenVm, child) {
                return CustomButton(
                    buttonText: S.of(context).send,
                    onTab: () {
                      if (amountController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message:  S.of(context).pleaseEnterAmount);
                      } else if (messageController.text.isEmpty) {
                        context.flushBarTopErrorMessage(
                            message: S.of(context).pleaseEnterMessage);
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
