import 'dart:convert';
import 'dart:io';
import 'package:payaki/network/model/response/payment/payment_done_response.dart';

import '../model/request/payment/payment_request.dart';
import '../model/request/payment/payment_token_request.dart';
import '../model/response/payment/payment_response.dart';
import '../model/response/payment/payment_token_response.dart';
import 'package:http/http.dart' as http;

class PaymentRepository {
  Future<PaymentTokenResponse> getPaymentToken(
      PaymentTokenRequest request) async {
    try {
      var response = await http.post(
        Uri.parse(
            'https://login.microsoftonline.com/appypaydev.onmicrosoft.com/oauth2/token'),
        body: request.toJson(),
        headers: {
          'Content-Type':
              'application/x-www-form-urlencoded', // Adjust content type if needed
        },
      );

      if (response.statusCode == 200) {
        return PaymentTokenResponse.fromJson(json.decode(response.body));
      } else {
        // If the response status code is not 200, handle the error
        throw Exception('Failed to get payment token: ${response.statusCode}');
      }
    } catch (error) {
      // Catch any exceptions thrown during the API call
      throw Exception('Failed to get payment token: $error');
    }
  }

  Future<PaymentResponse> paymentApi(
      {required PaymentRequest request, required token}) async {
    print(request.toJson());
    print(token);
    // Map<String,String> headers = {'Content-Type':'application/json','Authorization':'Bearer $token','Accept':'application/json'};
    try {
      var response = await http.post(
          Uri.parse('https://gwy-api-tst.appypay.co.ao/v2.0/charges'),
          body: jsonEncode(request),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token'
          });

      if (response.statusCode == 200) {
        return PaymentResponse.fromJson(json.decode(response.body));
      } else {
        // If the response status code is not 200, handle the error
        throw Exception(
            'Failed to get payment Response : ${response.statusCode}');
      }
    } catch (error) {
      // Catch any exceptions thrown during the API call
      throw Exception(' $error');
    }
  }

  Future<PaymentDoneResponse> getPaymentStatus({ required String token,required String id}) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://gwy-api-tst.appypay.co.ao/v2.0/charges/$id'),

          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token'
          }
      );

      if (response.statusCode == 200) {
        return PaymentDoneResponse.fromJson(json.decode(response.body));
      } else {
        // If the response status code is not 200, handle the error
        throw Exception('Failed to get payment status: ${response.statusCode}');
      }
    } catch (error) {
      // Catch any exceptions thrown during the API call
      throw Exception('Failed to get payment status: $error');
    }
  }
}
