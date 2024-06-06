import 'package:flutter/material.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';

import '../core/theme/application_text_theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function function;
  final bool isActive;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.function,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isActive) {
          FocusManager.instance.primaryFocus?.unfocus();
          function();
        }
      },
      child: Container(
        height: 40.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: isActive ? Colors.teal : Colors.teal.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            buttonText,
            style: ApplicationTextTheme.getTheme()
                .labelMedium!
                .copyWith(fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
