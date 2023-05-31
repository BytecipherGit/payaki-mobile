import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/like_dislike_post_request.dart' as post_like_dislike_r;
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
    required String postId,
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
        tagArray = tags.split(',');

        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isLoading = false;
      notifyListeners();

     // onFailure?.call("Server Error");
      onFailure?.call(error.toString());
    });
  }


  postLikeDislike({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required String postId,
  }) {
    postRepository
        .postLikeDislike(post_like_dislike_r.LikeDislikePostRequest(
        name: Endpoints.post.likeDislikePost, param: post_like_dislike_r.Param(
        userId: Preference().getUserId(),
      productId: postId
    )))
        .then((value) {
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      logE("error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

}
