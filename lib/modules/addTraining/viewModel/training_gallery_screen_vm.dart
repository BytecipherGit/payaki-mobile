import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/add_training_video_request.dart';
import 'package:payaki/network/repository/post_repository.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TrainingGalleryScreenVm extends ChangeNotifier {
  PostRepository postRepository = PostRepository();
  XFile? selectedVideos; // List of selected image
  final picker = ImagePicker();

  String? thumbnailPath;

  Future getVideos() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedVideos = pickedFile;
      String? thumbnail = await VideoThumbnail.thumbnailFile(
        video: pickedFile.path ?? "",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
      );
      thumbnailPath = thumbnail!;

      notifyListeners();
    } else {}
  }

  removeVideo() {
    selectedVideos = null;
    thumbnailPath = '';
    notifyListeners();
  }

  uploadVideo({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required AddTrainingVideoRequest request,
  }) async {
    postRepository.addTrainingVideo(request, selectedVideos).then((value) {
      notifyListeners();

      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}
