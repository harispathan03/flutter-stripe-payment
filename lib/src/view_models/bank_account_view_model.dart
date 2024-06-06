import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:stipe_demo/src/core/utils/validation.dart';
import 'package:stipe_demo/src/di/get_it.dart';
import 'package:stipe_demo/src/view_models/loading_view_model.dart';

class BankAccountViewModel extends ChangeNotifier {
  ValidationDetails accountNumberValidationState =
      ValidationDetails(status: false);
  ValidationDetails routingNumberValidationState =
      ValidationDetails(status: false);
  ValidationDetails microDepositValidationState =
      ValidationDetails(status: false);
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

  void checkAccountNumber(String accountNumber) {
    accountNumberValidationState =
        Validation.validateAccountNumber(accountNumber);
    notifyListeners();
  }

  void checkRoutingNumber(String routingNumber) {
    routingNumberValidationState =
        Validation.validateRoutingNumber(routingNumber);
    notifyListeners();
  }

  void checkMicroDeposit(String microDeposit) {
    microDepositValidationState = Validation.validateMicroDeposit(microDeposit);
    notifyListeners();
  }

  Future<Map<String, dynamic>> _createUsBankPaymentIntent(
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
        'amount': amount.toString(),
        'currency': currency,
        'description': "Test payment",
        'shipping[name]': name,
        'payment_method_types[]': "us_bank_account",
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

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to create Payment Intent: ${response.body}');
    }
  }

  Future<void> bankPayment(BuildContext context, String amount,
      String accountNumber, String routingNumber, String microDeposit) async {
    locator<LoadingViewModel>().startLoading();
    final data = await _createUsBankPaymentIntent(amount, currency, "Bank User",
        "1459  Circle Drive", "77063", "Houston", "Texas", "US");
    try {
      const billingDetails = BillingDetails(
        name: 'Flutter Stipe',
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );

      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: data['client_secret'],
        data: PaymentMethodParams.usBankAccount(
          paymentMethodData: PaymentMethodDataUsBank(
            accountNumber: accountNumber,
            routingNumber: routingNumber,
            billingDetails: billingDetails,
          ),
        ),
      );
      await Stripe.instance.verifyPaymentIntentWithMicrodeposits(
          isPaymentIntent: true,
          clientSecret: data['client_secret'],
          params: VerifyMicroDepositsParams(descriptorCode: microDeposit));
      // SM11AA - for success
      // SM33CC -Simulates exceeding the number of allowed verification attempts.
      // SM44DD - Simulates a microdeposit timeout
      locator<LoadingViewModel>().stopLoading();
      Navigator.of(context).pop();
      if (microDeposit == "SM11AA") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Payment Success",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Microdeposit timeout.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      locator<LoadingViewModel>().stopLoading();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Payment Failed: ${e.toString()}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
