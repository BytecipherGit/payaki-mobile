import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class ChooseCategoryScreen extends StatefulWidget {
  const ChooseCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCategoryScreen> createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorUtility.whiteColor,
          title: Text(
            "Post Ad",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23.h,
              ),
              Text(
                "Choose Category",
                style: StyleUtility.headingTextStyle,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 21,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){

                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 0),
                            horizontalTitleGap: 0,

                            title:Text("Cars $index",style: StyleUtility.titleTextStyle,),
                            leading: Image.asset(ImageUtility.carImage,width: 25.w,),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 18.sp,
                            color: ColorUtility.color43576F,),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
