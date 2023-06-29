import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/modules/transaction/viewModel/transaction_screen_vm.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  TransactionScreenVm transactionScreenVm = TransactionScreenVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtility.whiteColor,
        appBar: const CustomAppBar(
          title: "Chat",
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 25.h, bottom: 50.h),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        ImageUtility.userDummyIcon,
                        width: 55.w,
                        height: 55.w,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mira Carder",
                          style: StyleUtility.headingTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Lorem ipsum dolor sit ame...",
                          style: StyleUtility.axiforma500.copyWith(
                              color: ColorUtility.color152D4A,
                              fontSize: TextSizeUtility.textSize14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                  ],
                ),
              );
            }));
  }
}
