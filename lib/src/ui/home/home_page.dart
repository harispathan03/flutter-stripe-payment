import 'package:flutter/material.dart';
import 'package:stipe_demo/src/core/constants/route_names.dart';
import 'package:stipe_demo/src/core/constants/string_constants.dart';
import 'package:stipe_demo/src/core/extensions/scaffold_extension.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';
import 'package:stipe_demo/src/widget/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                buttonText: payWithCard,
                isActive: true,
                function: () {
                  Navigator.of(context).pushNamed(RouteNames.cardPayment);
                }),
            SizedBox(height: 10.h),
            CustomButton(
                buttonText: payWithBankAccount,
                isActive: true,
                function: () {
                  Navigator.of(context).pushNamed(RouteNames.bankAccount);
                })
          ],
        ),
      ),
    ).scaffoldWithAppBar(context: context, title: "Stripe payment");
  }
}
