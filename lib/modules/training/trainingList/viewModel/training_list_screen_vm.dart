import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/training/training_list_request.dart';
import 'package:payaki/network/model/response/training/training_list_response.dart';
import 'package:payaki/network/repository/training_repository.dart';

class TrainingListScreenVm extends ChangeNotifier {
  final TrainingRepository trainingRepository = TrainingRepository();

  TrainingListResponse? trainingList;

  bool trainingListLoading = true;

  getTraining({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required bool isAllPost
  }) {
    trainingRepository
        .trainingList(TrainingListRequest(
            name: Endpoints.trainingEndPoints.getTrainingPost,
        param: Param(
          userId: isAllPost == true ? "" :Preference().getUserId()
        )
    ))
        .then((value) {
      trainingListLoading = false;
      trainingList = value;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      trainingListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
}
