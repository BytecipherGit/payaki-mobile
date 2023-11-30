import 'dart:convert';
import '../model/request/payment/payment_request.dart';
import '../model/request/payment/payment_token_request.dart';
import '../model/response/payment/payment_token_response.dart';
import 'package:http/http.dart' as http;
class PaymentRepository {
  Future<PaymentTokenResponse> getPaymentToken(PaymentTokenRequest request) async {
    try {
      var response = await http.post(
        Uri.parse('https://login.microsoftonline.com/appypaydev.onmicrosoft.com/oauth2/token'),
        body: request.toJson(),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Adjust content type if needed
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

  Future<String> paymentApi(PaymentRequest request,token) async {
    try {
      var response = await http.post(
        Uri.parse('https://gwy-api-tst.appypay.co.ao/v2.0/charges'),
        body: request.toJson(),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Adjust content type if needed
          'Authorization': 'Bearer $token', // Adjust content type if needed
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        // If the response status code is not 200, handle the error
        throw Exception('Failed to get payment token: ${response.statusCode}');
      }
    } catch (error) {
      // Catch any exceptions thrown during the API call
      throw Exception(' $error');
    }
  }
}
