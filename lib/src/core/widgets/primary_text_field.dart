import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';

import '../constants/color_constants.dart';
import 'app_text/regular_text.dart';

// use this textfield in entire project to get same design of textfield
class PrimaryTextField extends StatefulWidget {
  final String hint;
  final String? labelText;
  final String? errorText;
  final FocusNode focusNode;
  final TextInputType inputType;
  final String? trailingIcon;
  final String? leadingIcon;
  final Color? fillColor;
  final int? maxLength;
  final bool enabled;
  final bool isObscureText;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validateFunction;
  final Function? endIconClick;
  final Function? startIconClick;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final int maxLines;
  final bool autoFocus;
  final bool autoCorrect;
  final String? prefixText;
  final bool hasFocus;
  final bool useFocus;
  final TextCapitalization? capitalization;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Function()? onTap;

  const PrimaryTextField(
      {super.key,
      required this.hint,
      this.labelText,
      this.errorText,
      required this.focusNode,
      required this.inputType,
      this.trailingIcon,
      this.leadingIcon,
      this.fillColor = white,
      this.isObscureText = false,
      required this.textInputAction,
      this.enabled = true,
      this.onSaved,
      this.maxLength,
      this.validateFunction,
      this.endIconClick,
      this.startIconClick,
      this.onFieldSubmitted,
      this.textInputFormatter,
      this.onChanged,
      required this.controller,
      this.maxLines = 1,
      this.autoFocus = false,
      this.prefixText,
      this.hasFocus = false,
      this.useFocus = false,
      this.readOnly = false,
      this.enableInteractiveSelection = false,
      this.onTap,
      this.capitalization,
      this.autoCorrect = false});

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      controller: widget.controller,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      onTap: widget.onTap,
      cursorColor: blueShadeClr,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: widget.textInputAction,
      // textAlignVertical: widget.isObscureText ? TextAlignVertical.center : null,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: widget.enabled ? black : black, fontSize: 16.sp),
      decoration: InputDecoration(
        labelText: widget.useFocus
            ? (widget.hasFocus ? null : widget.labelText)
            : widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 21.sp,
              color: lightGrey,
            ),
        floatingLabelStyle: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
            color: darkGrey),
        border: InputBorder.none,
        // border: buildOutlineInputBorder(),
        // enabledBorder: buildOutlineInputBorder(),
        // errorBorder: buildOutlineInputBorder(),
        // disabledBorder: buildOutlineInputBorder(),
        // focusedBorder: buildFocusOutlineInputBorder(),
        // focusedErrorBorder: buildFocusOutlineInputBorder(),
        filled: true,
        fillColor: widget.fillColor,
        hintText: widget.useFocus
            ? (widget.hasFocus ? null : widget.hint)
            : widget.hint,
        // hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontSize: 16.sp, color: widget.enabled ? lightGrey : lightGrey),

        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 50.w),
        isDense: true,
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorStyle: const TextStyle(color: Colors.red, height: 0.0),
        errorMaxLines: 3,
        helperText: '',
        counterText: '',
        helperStyle: const TextStyle(color: Colors.red, height: 0.0),
        errorText: widget.errorText,
        prefix: widget.useFocus
            ? (widget.hasFocus
                ? (widget.prefixText != null
                    ? RegularText(
                        text: widget.prefixText!,
                        size: 14.sp,
                        color: black,
                      )
                    : null)
                : (widget.controller.text.trim().isNotEmpty
                    ? RegularText(
                        text: widget.prefixText!,
                        size: 14.sp,
                        color: black,
                      )
                    : null))
            : null,
        prefixIcon: widget.isObscureText ? null : _prefixIconCheck(),
        prefixIconConstraints: BoxConstraints(
          minHeight: 20.sp,
          maxWidth: 50.sp,
          maxHeight: 20.sp,
          minWidth: 40.sp,
        ),
        suffixIcon: widget.isObscureText ? _passwordIcon() : _suffixIconCheck(),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 40.sp,
          maxHeight: 30.sp,
        ),
      ),
      maxLines: widget.maxLines,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validateFunction,
      onSaved: widget.onSaved,
      inputFormatters: widget.textInputFormatter,
      keyboardType: widget.inputType,
      obscureText: widget.isObscureText ? _obscureText : false,
      // obscureText: widget.isObscureText,
      onChanged: widget.onChanged,
      textCapitalization: widget.capitalization ?? TextCapitalization.none,
      autocorrect: widget.autoCorrect,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: (widget.errorText == null || widget.errorText!.isEmpty)
            ? lightGrey //blue border Color
            : red,
      ),
    );
  }

  OutlineInputBorder buildFocusOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: (widget.errorText == null || widget.errorText!.isEmpty)
            ? Colors.grey //blue border Color
            : red,
      ),
    );
  }

  _suffixIconCheck() => widget.trailingIcon != null
      ? GestureDetector(
          onTap: () {
            widget.endIconClick!();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              height: 20.h,
              width: 20.w,
              child: widget.trailingIcon!.endsWith(".svg")
                  ? SvgPicture.asset(
                      widget.trailingIcon!,
                      // color: widget.endIconClick == null ? black : null,
                      width: 20.w,
                      colorFilter: widget.endIconClick == null
                          ? const ColorFilter.mode(black, BlendMode.srcIn)
                          : null,
                      height: 20.h,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      widget.trailingIcon!,
                      color: widget.endIconClick == null ? black : null,
                      scale: 2.7,
                    ),
            ),
          ),
        )
      : null;

  _prefixIconCheck() => widget.leadingIcon != null
      ? GestureDetector(
          onTap: () {
            widget.startIconClick!();
          },
          child: Container(
            color: Colors.yellow,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            // padding: const EdgeInsets.only(left: 1.0, right: 1.0),
            child: Container(
              color: red,
              height: 40.h,
              width: 40.w,
              alignment: Alignment.centerLeft,
              child: widget.leadingIcon!.endsWith(".svg")
                  ? SvgPicture.asset(
                      widget.leadingIcon!,
                      // color:
                      //     widget.startIconClick == null ? Colors.orange : null,
                      colorFilter: widget.startIconClick == null
                          ? const ColorFilter.mode(Colors.red, BlendMode.srcIn)
                          : null,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                    )
                  : Image.asset(
                      widget.leadingIcon!,
                      color: widget.startIconClick == null ? black : null,
                      alignment: Alignment.center,
                      // scale: 2.7,
                    ),
            ),
          ),
        )
      : null;

// get password icon based on invisible and visible status
  _passwordIcon() => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            child: SvgPicture.asset(
              _obscureText
                  ? 'assets/icons/eye.svg'
                  : 'assets/icons/pass_hide.svg',
            ),
          ),
          // Icon(
          //   _obscureText ? Icons.visibility_off : Icons.visibility,
          //   color: black,
          //   size: 20.sp,
          // ),
        ),
      );
}
