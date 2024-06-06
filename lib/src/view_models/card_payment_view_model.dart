import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:stipe_demo/src/core/utils/validation.dart';

class CardPaymentViewModel extends ChangeNotifier {
  ValidationDetails amountValidationState = ValidationDetails(status: false);
  String currency = "USD";

  void setCurrency(String currency) {
    this.currency = currency;
    notifyListeners();
  }

  void checkAmount(String amount) {
    amountValidationState = Validation.validateAmount(amount);
    notifyListeners();
  }

  Future<void> initPaymentSheet(String amount) async {
    try {
      // 1. create payment intent on the server
      final data = await _createCardPaymentIntent(amount, currency, "Demo User",
          "Victoria", "3599", "Melbourne", "Sydney", "US");

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],
          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> _createCardPaymentIntent(
      String amount,
      String currency,
      String name,
      String address,
      String postalCode,
      String city,
      String state,
      String country) async {
    String apiKey = dotenv.env['STRIPE_SECRET']!;

    // Make a request to the Stripe API to create a Payment Intent
    final response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      body: {
        'amount': amount,
        'currency': currency,
        'automatic_payment_methods[enabled]': 'true',
        'description': "Test payment",
        'shipping[name]': name,
        'shipping[address][line1]': address,
        'shipping[address][postal_code]': postalCode,
        'shipping[address][city]': city,
        'shipping[address][state]': state,
        'shipping[address][country]': country,
      },
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    // Handle the response from the Stripe API
    if (response.statusCode == 200 || response.statusCode == 201) {
      // If successful, parse the response body and return the payment intent data
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // If there's an error, throw an exception or return an error message
      throw Exception('Failed to create Payment Intent: ${response.body}');
    }
  }
}
