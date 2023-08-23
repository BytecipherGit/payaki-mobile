import 'package:payaki/network/client/dio_http_service.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/basic_request.dart';
import 'package:payaki/network/model/response/event/event_list_response.dart';

class EventRepository {
  DioHttpService dioHttpService = DioHttpService();

  Future<EventListResponse> eventList(BasicRequest request) {
    return dioHttpService
        .post(Endpoints.baseUrl, data: request.toJson())
        .then((value) => EventListResponse.fromJson(value));
  }
}
