import 'package:flutter/cupertino.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/post_detail_request.dart';
import 'package:payaki/network/model/response/post/post_detail_response.dart';
import 'package:payaki/network/repository/post_repository.dart';

class PostDetailScreenVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  PostDetailResponse? postDetailResponse;
  bool isLoading = true;
  List<String>? tagArray;
  getPostDetail({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required int postId,
  }) {
    postRepository
        .postDetails(PostDetailRequest(
        name: Endpoints.post.getPostDetails, param: Param(postId: postId)))
        .then((value) {
      postDetailResponse = value;
      isLoading = false;
      notifyListeners();

      if (value.code == 200) {
        String tags = postDetailResponse?.data?.tag ?? "";
        tagArray = tags.split(', ');

        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isLoading = false;
      notifyListeners();

      onFailure?.call("Server Error");
    });
  }
}
