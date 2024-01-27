import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/repository/cart_repository.dart';

import '../../../../network/model/request/payment/payment_status_request.dart';
import '../../../../network/model/response/cart/checkout_cart_response.dart';

class TrainingDetailScreenVm extends ChangeNotifier {
  final CartRepository cartRepository = CartRepository();
  updateUi(){
    notifyListeners();
  }
  purchaseTraining({
    ValueChanged<CartCheckoutResponse>? onSuccess,
    ValueChanged<String>? onFailure,
    required CheckoutRequest request,
  }) {
    cartRepository.checkoutCart(request).then((value) {
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
