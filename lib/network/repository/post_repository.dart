import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/request/post/add_training_video_request.dart';
import 'package:payaki/network/model/request/post/delete_post_request.dart';
import 'package:payaki/network/model/request/post/like_dislike_post_request.dart';
import 'package:payaki/network/model/request/post/post_detail_request.dart';
import 'package:payaki/network/model/request/post/post_list_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';
import 'package:payaki/network/model/response/post/add_post_response.dart';
import 'package:payaki/network/model/response/post/post_detail_response.dart';
import 'package:payaki/network/model/response/post/premium_and_latest_post_response.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';

class PostRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<AddPostResponse> addPost(dynamic data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data)
        .then((value) => AddPostResponse.fromJson(value));
  }

  Future<PostDetailResponse> postDetails(PostDetailRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => PostDetailResponse.fromJson(value));
  }

  Future<BasicResponse> postLikeDislike(LikeDislikePostRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<PremiumAndLatestPostResponse> premiumAndLatestPost(
      BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => PremiumAndLatestPostResponse.fromJson(value));
  }

  Future<PostListResponse> getPostList(PostListRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => PostListResponse.fromJson(value));
  }

  Future<BasicResponse> deletePost(DeletePostRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

  Future<BasicResponse> addTrainingVideo(
      AddTrainingVideoRequest request, XFile? video) async {

    MultipartFile? videoFile;

    if (video != null) {
      videoFile = await MultipartFile.fromFile(video.path, filename: video.name);
    }
    FormData formData =
    FormData.fromMap({"trainingVideo": videoFile, ...request.toJson()});
    return dioHttpService
        .post(Endpoints.baseUrl, data: formData)
        .then((value) => BasicResponse.fromJson(value));
  }
}
