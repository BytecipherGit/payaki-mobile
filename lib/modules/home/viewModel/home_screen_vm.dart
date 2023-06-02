import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/category/category_list_response.dart' as category;
import 'package:payaki/network/model/response/post/premium_and_latest_post_response.dart';
import 'package:payaki/network/repository/category_repository.dart';
import 'package:payaki/network/repository/post_repository.dart';

class HomeScreenVm extends ChangeNotifier {
  final CategoryRepository categoryRepository = CategoryRepository();
  final PostRepository postRepository = PostRepository();

  List<category.Data>? categoryList;
  PremiumAndLatestPostResponse? premiumAndLatestPost;
  bool isCategoryLoading = true;
  bool isPremiumAndLatestPostLoading = true;

  fetchCategoryList({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    categoryRepository
        .categoryList(BasicRequest(
        name: Endpoints.category.getCategories, param: Param()))
        .then((value) {
      categoryList = value.data;
      isCategoryLoading = false;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isCategoryLoading = false;
      notifyListeners();
      onFailure?.call("Server Error");
    });
  }


  fetchPremiumAndLatestPost({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    postRepository
        .premiumAndLatestPost(BasicRequest(
        name: Endpoints.post.premiumAndLatestPost, param: Param()))
        .then((value) {
      premiumAndLatestPost = value;
      isPremiumAndLatestPostLoading = false;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("error $error");
      isPremiumAndLatestPostLoading = false;
      notifyListeners();
      onFailure?.call("Server Error");
    });
  }







}
