import 'package:flutter/cupertino.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/event/event_list_request.dart';
import 'package:payaki/network/model/response/event/event_list_response.dart';
import 'package:payaki/network/repository/event_repository.dart';

class EventListScreenVm extends ChangeNotifier {
  final EventRepository eventRepository = EventRepository();

  EventListResponse? eventList;

  bool eventListLoading = true;

  getEvent(
      {ValueChanged<String>? onSuccess,
      ValueChanged<String>? onFailure,
      required bool isAllPost}) {
    eventRepository
        .eventList(EventListRequest(
            name: Endpoints.eventEndPoints.eventList,
            param: Param(
                userId: isAllPost == true ? "" : Preference().getUserId())))
        .then((value) {
      eventListLoading = false;
      eventList = value;
      notifyListeners();
      if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      eventListLoading = false;
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }
}
