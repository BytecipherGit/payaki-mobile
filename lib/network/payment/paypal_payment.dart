import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/network/model/request/payment/payment_request.dart';

import '../model/request/payment/payment_token_request.dart';
import '../repository/payment_repository.dart';

class Payment extends ChangeNotifier{
  PaymentRepository paymentRepository=PaymentRepository();
  bool isLoading = true;
  String clientId =
      // "AVpFDyu8miaS4QtS2pzBa0l-KGmCOy9cGCIZavQOs5ev7YSeSMd-WExl_jTNUtGhRqGdSuEh73dJ90Yi";
      "5afeadcb-dd1c-4ad1-b5e7-84c9599b6b86";
  String secretKey =
      "LWW8Q~EL3cQ_cfBPmE37DeGVSSOaMj~zFYTxsdBX";
      // "EMpw5WwZ__n2YemFw2fo82VriBb753vwR7FgXUhoNp7u34w6oMLGZlJOklXdwjNoxeT8AxlZph2irRG8";
String resource="2aed7612-de64-46b5-9e59-1f48f8902d14";
String grantType="client_credentials";
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

String amount="43";
String currency="AOA";
String description="POSTMAN_Test";
String merchantTransactionId="TR00000180320";
String paymentMethod="GPO_d16765a2-d951-4f08-9db8-2f9a6b5a8b45";
String phoneNumber="935095730";
String name="Customer A";
String telephone="935095730";
String email="customera@mail.com";
    pay({
      ValueChanged<String>? onSuccess,
      ValueChanged<String>? onFailure,
    }) {
      isLoading = true;
      paymentRepository
          .getPaymentToken(PaymentTokenRequest(clientId: clientId,clientSecret:secretKey ,grantType:grantType ,resource:resource ))
          .then((value) async{
            print(value.accessToken);
            // onSuccess?.call(value.message ?? "");
        // cartListResponse = value;
        // isLoading = false;
        // if (value. == 200) {
           await paymentRepository.paymentApi(PaymentRequest(amount:amount ,currency: currency,description: description,merchantTransactionId:merchantTransactionId ,notify:Notify(email:email ,name: name,telephone:telephone ) ,paymentInfo:PaymentInfo(phoneNumber:phoneNumber ) ,paymentMethod:paymentMethod ), value.accessToken).then((value) {
              print(value);
            });
          onSuccess?.call(value.accessToken ?? "");
        // } else {
        //   onFailure?.call(value.message ?? "");
        // }
        // notifyListeners();
      }).onError((error, stackTrace) {
        logE("error $error");
        notifyListeners();
        isLoading = false;
        onFailure?.call(error.toString());
      });
    }
  }

