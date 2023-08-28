import 'package:flutter/material.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/event/event_checkout_request.dart';
import 'package:payaki/network/repository/event_repository.dart';

class EventDetailScreenVm extends ChangeNotifier{

  final EventRepository eventRepository = EventRepository();

  eventCheckout(
      {ValueChanged<String>? onSuccess,
        ValueChanged<String>? onFailure,
        required EventCheckoutRequest request
      }) {
    eventRepository
        .eventCheckout(request)
        .then((value) {
          if (value.code == 200) {
        onSuccess?.call(value.message ?? "");
      } else {
        onFailure?.call(value.message ?? "");
      }
    }).onError((error, stackTrace) {
      logE("Error $error");
      notifyListeners();
      onFailure?.call(error.toString());
    });
  }

  updateUi(){
    notifyListeners();
  }


}