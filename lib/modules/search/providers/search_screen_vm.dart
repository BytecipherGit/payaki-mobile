import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/repository/LocationRepository.dart';
import 'package:payaki/network/repository/category_repository.dart';
import '../../../network/model/response/category/category_list_response.dart' as category;
import '../../../network/model/response/location/city_list_response.dart' as city;

class SearchScreenVm extends ChangeNotifier {
  final LocationRepository locationRepository = LocationRepository();
  final CategoryRepository categoryRepository = CategoryRepository();

  List<category.Data>? categoryList;
  List<city.Data>? cityList;

  bool isLoading = true;


  categoryListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    categoryRepository
        .categoryList(BasicRequest(
        name: Endpoints.category.getCategories, param: Param()))
        .then((value) {
      categoryList = value.data;
      isLoading = false;
      notifyListeners();

      logD("category length ${categoryList?.length}");
      if (value.code == 200) {
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


  cityListApi({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    locationRepository
        .cityList(BasicRequest(
        name: Endpoints.location.getCities,
        param: Param()))
        .then((value) {
      cityList = value.data;
      isLoading = false;
      notifyListeners();

      logD("length ${cityList?.length}");
      if (value.code == 200) {
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
