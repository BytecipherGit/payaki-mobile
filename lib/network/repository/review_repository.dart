import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/review/add_review_request.dart';
import 'package:payaki/network/model/response/basic_response.dart';

class ReviewRatingRepository {

  DioHttpService dioHttpService = DioHttpService();

  // Future<BasicResponse> addReview(AddReviewRequest data) {
  //   return DioHttpService.apiServicesInstance
  //       .post(Endpoints.baseUrl, data:  data.toJson())
  //       .then((value) => BasicResponse.fromJson(value));
  // }

  Future<BasicResponse> addReview(AddReviewRequest data) {
    return dioHttpService
        .post(Endpoints.baseUrl, data:  data.toJson())
        .then((value) => BasicResponse.fromJson(value));
  }

}
