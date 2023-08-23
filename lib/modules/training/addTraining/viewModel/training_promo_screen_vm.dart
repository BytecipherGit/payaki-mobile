import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/response/post/add_post_response.dart';
import 'package:payaki/network/repository/post_repository.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TrainingPromoScreenVm extends ChangeNotifier {
  XFile? selectedImages;
  XFile? selectedVideo;
  final picker = ImagePicker();
  String thumbnailPath = '';

  final PostRepository postRepository = PostRepository();

  Future getImages() async {
    selectedImages = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future getVideo() async {
    selectedVideo = await picker.pickVideo(source: ImageSource.gallery);
    notifyListeners();

    if (selectedVideo != null) {
      String? thumbnail = await VideoThumbnail.thumbnailFile(
        video: selectedVideo?.path ?? "",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
      );
      thumbnailPath = thumbnail!;
      notifyListeners();
    }
  }

  removeImage() {
    selectedImages = null;
    notifyListeners();
  }

  removeVideo() {
    selectedVideo = null;
    thumbnailPath = '';
    notifyListeners();
  }

  addPostApi({
    ValueChanged<AddPostResponse>? onSuccess,
    ValueChanged<String>? onFailure,
    required XFile images,
    required XFile video,
    required String productName,
    required String description,
    required int categoryId,
    required int subCategoryId,
    required String price,
    required String location,
    required String city,
    required String country,
    required String latlong,
    required String state,
    required String phone,
    required String availableDays,
    required String? amount,
  }) async {
    logD("User Id is ${Preference().getUserId()}");

    List<MultipartFile> multiPartImageList = [];

    MultipartFile file = await MultipartFile.fromFile(
      images.path,
      filename: images.name,
    );

    MultipartFile videoFile = await MultipartFile.fromFile(
      video.path,
      filename: video.name,
    );
    multiPartImageList.add(file);

    FormData formData = FormData.fromMap({
      'name': Endpoints.post.addPost,
      'user_id': Preference().getUserId(),
      'product_name': productName,
      'description': description,
      'category': categoryId,
      'sub_category': subCategoryId,
      'price': price,
      'location': location,
      'city': city,
      'country': country,
      'latlong': latlong,
      'state': state,
      'phone': phone,
      'available_days': availableDays,
      'amount': amount,
      'product_images[]': multiPartImageList,
      'promo_video': videoFile,
      'max_size': "500"
    });
    postRepository.addPost(formData).then((value) {
      notifyListeners();


      if (value.code == 200) {
        onSuccess?.call(value);
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
