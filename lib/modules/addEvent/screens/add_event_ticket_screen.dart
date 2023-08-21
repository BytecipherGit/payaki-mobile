import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/inputFormatter/decimal_input_formatter.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/addEvent/model/ticket_model.dart';
import 'package:payaki/modules/addEvent/viewModel/add_event_ticket_screen_vm.dart';
import 'package:payaki/network/model/response/post/add_post_response.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/common_method.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/delete_alert_dialog.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:provider/provider.dart';

class AddEventTicketScreen extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  final String description;
  final String eventDate;
  final String eventTime;

  final XFile promoImage;
  final XFile promoVideo;

  const AddEventTicketScreen(
      {Key? key,
      required this.catId,
      required this.subCatId,
      required this.title,
      required this.description,
      required this.promoImage,
      required this.promoVideo,
      required this.eventDate,
      required this.eventTime})
      : super(key: key);

  @override
  State<AddEventTicketScreen> createState() => _AddEventTicketScreenState();
}

class _AddEventTicketScreenState extends State<AddEventTicketScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<String> sellingModeList = ["online", "offline"];
  String? sellingModeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.colorF6F6F6,
      appBar: const CustomAppBar(
        title: "Event - Add Ticket",
      ),
      body: GestureDetector(
        onTap: () {
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
                                            FilteringTextInputFormatter
                                                .digitsOnly
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
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Selling Mode*",
                                    style: StyleUtility.inputTextStyle,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 15.sp,
                                            bottom: 15.sp,
                                            left: 20.w,
                                            right: 5.w),
                                        filled: true,
                                        fillColor: ColorUtility.colorF8FAFB,
                                        hintStyle: StyleUtility.hintTextStyle,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: const BorderSide(
                                            color: ColorUtility.colorE2E5EF,
                                          ),
                                        ),
                                        focusColor: ColorUtility.whiteColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                      hint: Text(
                                        "Select Selling Mode",
                                        style: StyleUtility.hintTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      items: sellingModeList
                                          .map((e) => DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e,
                                                  style: StyleUtility
                                                      .inputTextStyle)))
                                          .toList(),
                                      value: sellingModeValue,
                                      onChanged: (String? value) {
                                        sellingModeValue = value!;
                                        logD(sellingModeValue);
                                      },
                                      icon: Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: Image.asset(
                                          ImageUtility.dropDownIcon,
                                          width: 14.w,
                                        ),
                                      ),
                                      iconSize: 20.sp,
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                    ),
                                  ),
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
                                } else if (sellingModeValue?.isEmpty ?? true) {
                                  context.flushBarTopErrorMessage(
                                      message: "Please Select Selling Mode.");
                                } else {
                                  addEventTicketScreenVm.addTicket(Tickets(
                                      ticketTitle: titleController.text,
                                      ticketQuantity: quantityController.text,
                                      ticketPrice: priceController.text,
                                      sellingMode: sellingModeValue));

                                  titleController.clear();
                                  quantityController.clear();
                                  priceController.clear();
                                  context.flushBarTopSuccessMessage(
                                      message: "Ticked Added.");
                                }
                              }),
                          SizedBox(height: 25.h),
                          // if(addEventTicketScreenVm.ticketModel?.tickets != null && addEventTicketScreenVm.ticketModel!.tickets!.isNotEmpty)
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount:
                                  addEventTicketScreenVm.ticketList.length ?? 0,
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
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                  topRight:
                                                      Radius.circular(10.r))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tickets[index].ticketTitle ??
                                                    "",
                                                style:
                                                    StyleUtility.titleTextStyle,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Text(
                                                "${Constant.currencySymbol} ${CommonMethod.numberFormat(tickets[index].ticketPrice ?? "")}",
                                                style: StyleUtility
                                                    .headingTextStyle
                                                    .copyWith(
                                                        fontSize:
                                                            TextSizeUtility
                                                                .textSize22),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    tickets[index]
                                                            .sellingMode
                                                            ?.toUpperCase() ??
                                                        "",
                                                    style: StyleUtility
                                                        .axiforma500
                                                        .copyWith(
                                                            fontSize:
                                                                TextSizeUtility
                                                                    .textSize16,
                                                            color: ColorUtility
                                                                .color152D4A),
                                                  )),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Quantity",
                                                        style: StyleUtility
                                                            .axiforma300
                                                            .copyWith(
                                                                fontSize:
                                                                    TextSizeUtility
                                                                        .textSize12,
                                                                color: ColorUtility
                                                                    .color43576F),
                                                      ),
                                                      Text(
                                                        tickets[index]
                                                                .ticketQuantity ??
                                                            "",
                                                        style: StyleUtility
                                                            .titleTextStyle
                                                            .copyWith(
                                                                fontSize:
                                                                    TextSizeUtility
                                                                        .textSize16,
                                                                color: ColorUtility
                                                                    .color152D4A),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
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
                                              showDeleteTicketDialog(
                                                  context: context,
                                                  onDeleteTap: () {
                                                    addEventTicketScreenVm
                                                        .removeTicket(index);
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
                        if (addEventTicketScreenVm.ticketList == null ||
                            addEventTicketScreenVm.ticketList!.isEmpty) {
                          context.flushBarTopErrorMessage(
                              message: 'Please Create Ticket.');
                        } else {
                          CommonDialog.showLoadingDialog(context);
                          addEventTicketScreenVm.addPostApi(
                              images: widget.promoImage,
                              video: widget.promoVideo,
                              productName: widget.title,
                              description: widget.description,
                              eventDate: widget.eventDate,
                              eventTime: widget.eventTime,
                              categoryId: widget.catId,
                              subCategoryId: widget.subCatId,
                              onSuccess: (AddPostResponse response) {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RouteName.bottomNavigationBarScreen,
                                    (route) => false);

                                context.flushBarTopSuccessMessage(
                                    message: response.message ?? "");
                              },
                              onFailure: (value) {
                                Navigator.pop(context);
                                context.flushBarTopErrorMessage(message: value);
                              });
                        }
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

  Future<dynamic> showDeleteTicketDialog({
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
