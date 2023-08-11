import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';



class TrainingGalleryScreen extends StatefulWidget {
  const TrainingGalleryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingGalleryScreen> createState() => _TrainingGalleryScreenState();
}

class _TrainingGalleryScreenState extends State<TrainingGalleryScreen> {
  List<XFile>? selectedVideos = []; // List of selected image
  final picker = ImagePicker();

  List<String>? thumbnailPath = [];



  Future getVideos() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedVideos?.add(pickedFile);
      String? thumbnail = await VideoThumbnail.thumbnailFile(
        video: pickedFile.path ?? "",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
      );
      setState(() {
        thumbnailPath?.add(thumbnail!);
      });

      setState(() {});
    } else {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Training",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 23.h),
              Text(
                "Gallery",
                style: StyleUtility.headingTextStyle,
              ),
              SizedBox(height: 25.h),
              UploadImageWidget(
                onTap: () {
                  getVideos();
                },
                title: "Attach File",
                type: Constant.videoFile,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                  ),
                  itemCount: selectedVideos?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: Image.file(
                            File(thumbnailPath?[index] ?? ""),
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            selectedVideos?.removeAt(index);
                            thumbnailPath?.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(3.sp),
                            child: Image.asset(
                              ImageUtility.removeImage,
                              width: 15.w,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  buttonText: "Next",
                  onTab: () {
                    if (selectedVideos != null) {
                      context.flushBarTopErrorMessage(
                          message: "Please Upload Images.");
                    } else {}
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
