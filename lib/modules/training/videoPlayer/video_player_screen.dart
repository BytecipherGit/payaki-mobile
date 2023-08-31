import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:payaki/utilities/color_utility.dart";
import "package:payaki/widgets/custom_appbar.dart";

import "package:video_controls/video_controls.dart";

// const String url =
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoController.network(widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Video",

      ),

      body: Center(
          child: Container(
        margin: EdgeInsets.only(bottom: 65.h),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: VideoPlayer(controller)),
      )));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
