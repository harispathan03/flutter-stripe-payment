import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:stipe_demo/src/core/constants/input_constants.dart';
import 'package:stipe_demo/src/core/constants/string_constants.dart';
import 'package:stipe_demo/src/core/extensions/scaffold_extension.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';
import 'package:stipe_demo/src/core/widgets/app_text/medium_text.dart';
import 'package:stipe_demo/src/di/get_it.dart';
import 'package:stipe_demo/src/view_models/card_payment_view_model.dart';
import 'package:stipe_demo/src/view_models/loading_view_model.dart';
import 'package:stipe_demo/src/widget/custom_button.dart';

import '../../core/utils/validation.dart';
import '../../widget/custom_textfield.dart';

class CardPaymentPage extends StatefulWidget {
  const CardPaymentPage({super.key});

  @override
  State<CardPaymentPage> createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  late CardPaymentViewModel viewModel;
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    viewModel = context.read<CardPaymentViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAmountTextField(),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediumText(
                  text: "Select Currency: ", size: 16.sp, color: Colors.black),
              SizedBox(width: 10.w),
              DropdownButton(
                value: context.watch<CardPaymentViewModel>().currency,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
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
          Consumer<CardPaymentViewModel>(
            builder: (context, model, child) => CustomButton(
                buttonText: "Pay",
                isActive: (model.amountValidationState.status),
                function: () async {
                  locator<LoadingViewModel>().startLoading();
                  await viewModel.initPaymentSheet(amountController.text);
                  try {
                    locator<LoadingViewModel>().stopLoading();
                    await Stripe.instance.presentPaymentSheet();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Payment Success",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Payment failed: $e",
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ));
                  }
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
    return Selector<CardPaymentViewModel, ValidationDetails>(
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
            textInputAction: TextInputAction.done);
      },
    );
  }
}
