import 'package:flutter/material.dart';
import 'package:payaki/local_store/shared_preference.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/payment/payment_request.dart';

import '../model/request/payment/payment_token_request.dart';
import '../repository/payment_repository.dart';

class Payment extends ChangeNotifier {
  PaymentRepository paymentRepository = PaymentRepository();
  bool isLoading = true;
  String countryCode = "";
  String clientId = "5afeadcb-dd1c-4ad1-b5e7-84c9599b6b86";
  String secretKey = "LWW8Q~EL3cQ_cfBPmE37DeGVSSOaMj~zFYTxsdBX";
  String resource = "2aed7612-de64-46b5-9e59-1f48f8902d14";
  String grantType = "client_credentials";

  String currency = "AOA";
  String description = "POSTMAN_Test";
  String paymentMethod = "GPO_d16765a2-d951-4f08-9db8-2f9a6b5a8b45";
  String name = Preference().getName();
  String telephone = Preference().getPhone();
  String email = Preference().getUserEmail();
  pay({
    ValueChanged<String>? onSuccess,
    ValueChanged<String>? onFailure,
    required String? amount,
    required String? phoneNumber,
    required BuildContext context, required String id,
  }) {
    try {
      paymentRepository
          .getPaymentToken(PaymentTokenRequest(
              clientId: clientId,
              clientSecret: secretKey,
              grantType: grantType,
              resource: resource),context:context
      )
          .then((paymentTokenResponse) async {
        print(paymentTokenResponse.accessToken);

        await paymentRepository
            .paymentApi(
          request: PaymentRequest(
              amount: amount,
              currency: currency,
              description: description,
              merchantTransactionId: id,
              notify: Notify(email: email, name: name, telephone: telephone),
              paymentInfo: PaymentInfo(phoneNumber: "$countryCode$phoneNumber"),
              paymentMethod: paymentMethod),
          token: paymentTokenResponse.accessToken, context: context,
        ).then((value) async{
          print(value.id);
          if (value.responseStatus!.successful == false){
            Future.delayed(const Duration(seconds: 10),() {
                paymentRepository
                  .getPaymentStatus(
                  token: paymentTokenResponse.accessToken!, id:value.id.toString())
                  .then((paymentStatus) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                if (paymentStatus.payment!.transactionEvents![0].responseStatus!.successful==true) {
                  print(paymentStatus);
                  onSuccess?.call(paymentStatus.payment!.transactionEvents![0].responseStatus!.message!);
                }else{
                  onFailure?.call(paymentStatus.payment!.transactionEvents![0].responseStatus!.message!);
                }
              });
            });

            // onSuccess?.call(value.id.toString());

          } else {
            Navigator.pop(context);
            onFailure?.call(value.responseStatus!.message.toString());
          }
        });
      }).onError((error, stackTrace) {
        logE("error $error");
        notifyListeners();
        isLoading = false;
        onFailure?.call(error.toString());
      });
    } on Exception catch (e) {
      logE("Exception $e");
    }
  }
}
// "AVpFDyu8miaS4QtS2pzBa0l-KGmCOy9cGCIZavQOs5ev7YSeSMd-WExl_jTNUtGhRqGdSuEh73dJ90Yi";
// "EMpw5WwZ__n2YemFw2fo82VriBb753vwR7FgXUhoNp7u34w6oMLGZlJOklXdwjNoxeT8AxlZph2irRG8";
// pay({
//   required BuildContext context,
//   required String amount,
//   required ValueChanged<Map> onSuccess,
//   required ValueChanged<String> onFailure,
// }) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (BuildContext context) => UsePaypal(
//           sandboxMode: true,
//           clientId: clientId,
//           secretKey: secretKey,
//           returnURL: "https://samplesite.com/return",
//           cancelURL: "https://samplesite.com/cancel",
//           transactions: [
//             {
//               "amount": {
//                 "total": amount,
//                 "currency": "USD",
//                 "details": {
//                   "subtotal": amount,
//                   "shipping": '0',
//                   "shipping_discount": 0
//                 }
//               },
//               "description": "The payment transaction description.",
//
//               // "item_list": {
//               //   "items": [
//               //     {
//               //       "name": "A demo product",
//               //       "quantity": 1,
//               //       "price": '9',
//               //       "currency": "USD"
//               //     }
//               //   ],
//
//               //   shipping address is not required though
//
//               // "shipping_address": const {
//               //   "recipient_name": "Jane Foster",
//               //   "line1": "Travis County",
//               //   "line2": "",
//               //   "city": "Austin",
//               //   "country_code": "US",
//               //   "postal_code": "73301",
//               //   "phone": "+00000000",
//               //   "state": "Texas"
//               // },
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             // logD("onSuccess: $params");
//             onSuccess.call(params);
//           },
//           onError: (error) {
//             //
//             onFailure.call("$error");
//           },
//           onCancel: (params) {
//             logD('cancelled: $params');
//           }),
//     ),
//   );
