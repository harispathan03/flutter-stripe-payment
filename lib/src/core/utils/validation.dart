import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stipe_demo/src/core/constants/string_constants.dart';

class Validation {
  static BuildContext? context;

  Validation._() {
    // context = locator<GlobalKey<NavigatorState>>().currentState!.context;
  }

  static ValidationDetails validateAmount(String amount) {
    if (amount.isEmpty) {
      return ValidationDetails(status: false, message: pleaseEnterAmount);
    }
    return ValidationDetails(status: true);
  }

  static ValidationDetails validateAccountNumber(String accountNumber) {
    if (accountNumber.isEmpty || accountNumber.length < 12) {
      return ValidationDetails(
          status: false, message: pleaseEnterValidAccountNumber);
    }
    return ValidationDetails(status: true);
  }

  static ValidationDetails validateRoutingNumber(String routing) {
    if (routing.isEmpty || routing.length < 9) {
      return ValidationDetails(
          status: false, message: pleaseEnterValidRoutingNumber);
    }
    return ValidationDetails(status: true);
  }

  static ValidationDetails validateMicroDeposit(String microDeposit) {
    if (microDeposit.isEmpty || microDeposit.length < 6) {
      return ValidationDetails(
          status: false, message: pleaseEnterValidMicroDeposit);
    }
    return ValidationDetails(status: true);
  }

  static getMessage(String message) {}
}

class ValidationDetails {
  final bool status;
  final String? message;

  ValidationDetails({required this.status, this.message});
}
