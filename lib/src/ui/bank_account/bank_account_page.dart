import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stipe_demo/src/core/extensions/scaffold_extension.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';
import 'package:stipe_demo/src/view_models/bank_account_view_model.dart';

import '../../core/constants/input_constants.dart';
import '../../core/constants/string_constants.dart';
import '../../core/utils/validation.dart';
import '../../core/widgets/app_text/medium_text.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';

class BankAccountPage extends StatefulWidget {
  const BankAccountPage({super.key});

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  late BankAccountViewModel viewModel;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();
  final TextEditingController microDepositController = TextEditingController();

  @override
  void initState() {
    viewModel = context.read<BankAccountViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          _buildAmountTextField(),
          SizedBox(height: 10.h),
          _buildAccountNumberTextField(),
          SizedBox(height: 10.h),
          _buildRoutingNumberTextField(),
          SizedBox(height: 10.h),
          _buildMicroDepositTextField(),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediumText(
                  text: "Select Currency: ", size: 16.sp, color: Colors.black),
              SizedBox(width: 10.w),
              DropdownButton(
                value: context.watch<BankAccountViewModel>().currency,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: ["USD"].map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  viewModel.setCurrency(newValue!);
                },
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Consumer<BankAccountViewModel>(
            builder: (context, model, child) => CustomButton(
                buttonText: "Pay",
                isActive: (model.accountNumberValidationState.status &&
                    model.routingNumberValidationState.status &&
                    model.microDepositValidationState.status),
                function: () async {
                  model.bankPayment(
                      context,
                      amountController.text,
                      accountNumberController.text,
                      routingNumberController.text,
                      microDepositController.text);
                }),
          )
        ],
      ),
    ).scaffoldWithAppBar(
        context: context,
        title: "Card Payment Page",
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)));
  }

  _buildAmountTextField() {
    return Selector<BankAccountViewModel, ValidationDetails>(
      selector: (_, provider) => provider.amountValidationState,
      builder: (context, amountValidationState, _) {
        return CustomTextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            hinttext: amount,
            maxLength: amountInputLength,
            errorText: amountValidationState.status
                ? null
                : amountValidationState.message,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              viewModel.checkAmount(amountController.text);
            },
            textInputAction: TextInputAction.next);
      },
    );
  }

  _buildAccountNumberTextField() {
    return Selector<BankAccountViewModel, ValidationDetails>(
      selector: (_, provider) => provider.accountNumberValidationState,
      builder: (context, accountNumberValidationState, _) {
        return CustomTextField(
            keyboardType: TextInputType.number,
            controller: accountNumberController,
            hinttext: accountNumber,
            maxLength: accountNumberInputLength,
            errorText: accountNumberValidationState.status
                ? null
                : accountNumberValidationState.message,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              viewModel.checkAccountNumber(accountNumberController.text);
            },
            textInputAction: TextInputAction.next);
      },
    );
  }

  _buildRoutingNumberTextField() {
    return Selector<BankAccountViewModel, ValidationDetails>(
      selector: (_, provider) => provider.routingNumberValidationState,
      builder: (context, routingNumberValidationState, _) {
        return CustomTextField(
            keyboardType: TextInputType.number,
            controller: routingNumberController,
            hinttext: routingNumber,
            maxLength: routingNumberInputLength,
            errorText: routingNumberValidationState.status
                ? null
                : routingNumberValidationState.message,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              viewModel.checkRoutingNumber(routingNumberController.text);
            },
            textInputAction: TextInputAction.next);
      },
    );
  }

  _buildMicroDepositTextField() {
    return Selector<BankAccountViewModel, ValidationDetails>(
      selector: (_, provider) => provider.microDepositValidationState,
      builder: (context, microDepositValidationState, _) {
        return CustomTextField(
            keyboardType: TextInputType.text,
            controller: microDepositController,
            hinttext: microDeposit,
            textCapitalization: TextCapitalization.characters,
            maxLength: microDepositInputLength,
            errorText: microDepositValidationState.status
                ? null
                : microDepositValidationState.message,
            onChanged: (value) {
              viewModel.checkMicroDeposit(microDepositController.text);
            },
            textInputAction: TextInputAction.done);
      },
    );
  }
}
