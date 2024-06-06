// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';

import '../core/theme/application_text_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hinttext;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? isObscureText;
  final String? errorText;
  final String? prefixText;
  final TextCapitalization? textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide? borderSide;
  final double? borderRadius;
  final double? fontSize;
  final Color? fillColor;
  final bool? autofocus;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.hinttext,
    this.hintStyle,
    this.style,
    this.inputBorder,
    this.focusedBorder,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.isObscureText,
    this.errorText,
    this.textCapitalization,
    this.prefixIcon,
    this.prefixText,
    this.contentPadding,
    this.borderSide,
    this.borderRadius,
    this.fontSize,
    this.fillColor,
    this.autofocus,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        validator: validator,
        obscureText: isObscureText ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        autofocus: autofocus ?? false,
        style: style != null
            ? style!.copyWith()
            : ApplicationTextTheme.getTheme()
                .labelMedium!
                .copyWith(fontSize: fontSize ?? 18.sp, color: Colors.black),
        minLines: minLines,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction,
        focusNode: focusNode,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: fillColor != null ? true : false,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          suffixIconConstraints: BoxConstraints(maxWidth: 30.w),
          // contentPadding: contentPadding,
          contentPadding: EdgeInsets.only(left: 10.w, top: 18.h),
          errorStyle: ApplicationTextTheme.getTheme()
              .bodySmall!
              .copyWith(height: 0.1, color: Colors.red, fontSize: 10.sp),
          errorMaxLines: 2,
          counterText: "",
          hintText: hinttext,
          errorText: errorText,
          hintStyle: hintStyle ??
              ApplicationTextTheme.getTheme().bodyMedium!.copyWith(
                    fontSize: fontSize ?? 18.sp,
                    color: Colors.black.withOpacity(0.40),
                  ),
          border: inputBorder ?? buildOutlineInputBorder(borderSide),
          enabledBorder: inputBorder ?? buildOutlineInputBorder(borderSide),
          errorBorder: inputBorder ?? buildOutlineInputBorder(borderSide),
          disabledBorder: buildOutlineInputBorder(borderSide),
          focusedBorder:
              focusedBorder ?? buildFocusOutlineInputBorder(borderSide),
          focusedErrorBorder:
              focusedBorder ?? buildFocusOutlineInputBorder(borderSide),
        )
        // focusedBorder: focusedBorder ??
        //     OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(8),
        //         borderSide: BorderSide(width: 1, color: blackColor)),
        // border: inputBorder ??
        //     OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(8),
        //         borderSide: const BorderSide(width: 30))),
        );
  }

  OutlineInputBorder buildOutlineInputBorder(BorderSide? borderSide) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }

  OutlineInputBorder buildFocusOutlineInputBorder(BorderSide? borderSide) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}
