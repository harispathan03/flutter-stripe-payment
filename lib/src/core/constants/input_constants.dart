import 'package:flutter/services.dart';

// constants for handling input fields
const amountInputLength = 5;
const currencyInputLength = 3;
const accountNumberInputLength = 12;
const routingNumberInputLength = 9;
const microDepositInputLength = 6;

// List of items in dropdown menu
var items = ['USD', 'INR', 'AUD'];

final FilteringTextInputFormatter mobileFilteringTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[0-9 ]*'));

final FilteringTextInputFormatter nameFilteringTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z ]*'));

final FilteringTextInputFormatter usernameFilteringTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z0-9]*'));

final FilteringTextInputFormatter alphaNumericWithSpaceTextInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z0-9 ]*'));
