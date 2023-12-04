import 'package:flutter/cupertino.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/cart/checkout_request.dart';
import 'package:payaki/network/repository/cart_repository.dart';

class TrainingDetailScreenVm extends ChangeNotifier {
  final CartRepository cartRepository = CartRepository();

  purchaseTraining({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required CheckoutRequest request,
  }) {
    cartRepository.checkoutCart(request).then((value) {
      if (value.code == 200) {
        onSuccess?.call(value.merchantTransactionId ?? "");
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
