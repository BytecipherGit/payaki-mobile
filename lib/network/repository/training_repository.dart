import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/training/training_list_request.dart';
import 'package:payaki/network/model/response/training/training_list_response.dart';

class TrainingRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<TrainingListResponse> trainingList(TrainingListRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => TrainingListResponse.fromJson(value));
  }
}
