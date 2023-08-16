import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/modules/addEvent/model/ticket_model.dart';
import 'package:payaki/modules/addEvent/viewModel/add_event_ticket_screen_vm.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/delete_alert_dialog.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class AddEventTicketScreen extends StatefulWidget {
  const AddEventTicketScreen({Key? key}) : super(key: key);

  @override
  State<AddEventTicketScreen> createState() => _AddEventTicketScreenState();
}

class _AddEventTicketScreenState extends State<AddEventTicketScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: const CustomAppBar(
        title: "Event - Add Ticket",
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<AddEventTicketScreenVm>(
                builder: (context, addEventTicketScreenVm, child) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 23.h),
                          DottedBorder(
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            color: ColorUtility.colorDEDEDE,
                            radius: Radius.circular(10.r),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorUtility.whiteColor),
                              padding: EdgeInsets.only(
                                  top: 19.sp,
                                  bottom: 23.sp,
                                  left: 15.w,
                                  right: 15.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SimpleTextField(
                                    controller: titleController,
                                    hintText: "Title",
                                    titleText: "Title *",
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SimpleTextField(
                                          controller: quantityController,
                                          hintText: "Quantity",
                                          titleText: "Quantity *",
                                          textInputType: TextInputType.number,
                                          inputFormatter: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: SimpleTextField(
                                          controller: priceController,
                                          hintText: "Price",
                                          titleText: "Price *",
                                          textInputType: TextInputType.number,

                                          inputFormatter: [
                                            DecimalInputFormatter(),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          CustomButton.outline(
                              buttonText: "Add",
                              onTab: () {
                                if (titleController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: "Please Enter Ticket Title.");
                                } else if (quantityController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: "Please Enter Ticket Quantity.");
                                } else if (priceController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: "Please Enter Ticket Price.");
                                } else {
                                  addEventTicketScreenVm.addTicket(TicketModel(
                                      titleController.text,
                                      quantityController.text,
                                      priceController.text));

                                  titleController.clear();
                                  quantityController.clear();
                                  priceController.clear();
                                  context.flushBarTopSuccessMessage(
                                      message: "Ticked Added.");
                                }
                              }),
                          SizedBox(height: 25.h),
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: addEventTicketScreenVm.ticketList.length,
                              itemBuilder: (context, index) {

                                var tickets = addEventTicketScreenVm.ticketList;
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 13.sp,
                                              left: 12.w,
                                              right: 12.w,
                                              bottom: 10.sp),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.r),
                                                  topRight:
                                                      Radius.circular(10.r))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tickets[index].title ?? "",
                                                style:
                                                    StyleUtility.titleTextStyle,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Text(
                                                "₹ ${tickets[index].price ?? ""}",
                                                style: StyleUtility
                                                    .headingTextStyle
                                                    .copyWith(
                                                        fontSize: TextSizeUtility
                                                            .textSize22),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Text(
                                                "Quantity",
                                                style: StyleUtility.axiforma300
                                                    .copyWith(
                                                        fontSize: TextSizeUtility
                                                            .textSize12,
                                                        color: ColorUtility
                                                            .color43576F),
                                              ),
                                              Text(
                                                tickets[index].quantity ?? "",

                                                style: StyleUtility.titleTextStyle
                                                    .copyWith(
                                                        fontSize: TextSizeUtility
                                                            .textSize16,
                                                        color: ColorUtility
                                                            .color152D4A),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: ColorUtility.colorE2E5EF,
                                          height: 1,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 13.sp,
                                              left: 12.w,
                                              right: 12.w,
                                              bottom: 10.sp),
                                          decoration: BoxDecoration(
                                              color: ColorUtility.colorF8FAFB,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10.r),
                                                  bottomRight:
                                                      Radius.circular(10.r))),
                                          child: CustomButton.removeTicket(
                                            buttonText: "Remove Ticket",
                                            onTab: () {
                                              showDeletePostDialog(
                                                context: context,
                                                  onDeleteTap: (){
                                                addEventTicketScreenVm.removeTicket(index);
                                                context.flushBarTopSuccessMessage(
                                                    message:
                                                    "Ticked Removed Successfully.");
                                              });

                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                      buttonText: "Done",
                      onTab: () {
                        if (titleController.text.isEmpty) {
                          context.flushBarTopErrorMessage(
                              message: 'Please Enter Title.');
                        } else if (quantityController.text.isEmpty) {
                          context.flushBarTopErrorMessage(
                              message: 'Please Enter Description.');
                        } else {}
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDeletePostDialog({
    required BuildContext context,
    required VoidCallback onDeleteTap,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return DeleteAlertDialog(
            onDeleteTap: onDeleteTap,
            yesText: "Confirm",
            desc: "Are you sure you want to delete \nthis Ticket ?",

          );
        });
  }

}
