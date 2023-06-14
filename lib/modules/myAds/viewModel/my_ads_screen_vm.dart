import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/post/post_list_request.dart';
import 'package:payaki/network/model/response/post/post_list_response.dart';
import 'package:payaki/network/repository/post_repository.dart';

class MyAdsScreenVm extends ChangeNotifier {
  final PostRepository postRepository = PostRepository();

  List<Data>? myAdsList;
  List<Data>? favouriteAdsList;

  bool myAdsListLoading = true;
  bool favouriteAdsListLoading = true;

  getMyAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
            name: Endpoints.post.getUserPost,
            param: Param(
              listingType: Endpoints.post.allParam,
            )))
        .then((value) {
      myAdsListLoading = false;
      myAdsList = value.data;
      notifyListeners();
      logD("Length ${myAdsList?.length}");
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      myAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }


  getFavouriteAds({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .getPostList(PostListRequest(
        name: Endpoints.post.getUserPost,
        param: Param(
          listingType: Endpoints.post.favouriteParam,
        )))
        .then((value) {
      favouriteAdsListLoading = false;
      favouriteAdsList = value.data;
      notifyListeners();
      logD("Length ${myAdsList?.length}");
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      favouriteAdsListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }



}
