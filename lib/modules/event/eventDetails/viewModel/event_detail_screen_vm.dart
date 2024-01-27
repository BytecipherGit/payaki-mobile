import 'package:flutter/material.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/event/event_checkout_request.dart';
import 'package:payaki/network/repository/event_repository.dart';

import '../../../../network/model/request/payment/payment_status_request.dart';
import '../../../../network/model/response/cart/checkout_cart_response.dart';
import '../../../../network/repository/cart_repository.dart';

class EventDetailScreenVm extends ChangeNotifier{

  final EventRepository eventRepository = EventRepository();

  eventCheckout(
      {ValueChanged<CartCheckoutResponse>? onSuccess,
        ValueChanged<String>? onFailure,
        required EventCheckoutRequest request
      }) {
    eventRepository
        .eventCheckout(request)
        .then((value) {
          if (value.code == 200) {
        onSuccess?.call(value);
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
  final CartRepository cartRepository = CartRepository();
  checkPaymentStatus({
    ValueChanged<CartCheckoutResponse>? onSuccess,
    ValueChanged<String>? onFailure,
    required PaymentStatusApiRequest request,
  }) {
    cartRepository
        .paymentStatusCart(request)
        .then((value) {
      if (value.code == 200) {
        onSuccess?.call(value);
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