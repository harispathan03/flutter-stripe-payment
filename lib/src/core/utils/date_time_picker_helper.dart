import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class DateTimePickerHelper {
  DateTimePickerHelper._();

  pickDate(
      {required BuildContext context,
      DateTime? selectedDate,
      DateTime? minimumDatePickerDate,
      DateTime? maximumDatePickerDate,
      required Function(DateTime date) onDateSelected}) async {
    minimumDatePickerDate ??= DateTime(
        DateTime.now().year - 13, DateTime.now().month, DateTime.now().day);
    maximumDatePickerDate ??= DateTime(
        DateTime.now().year - 60, DateTime.now().month, DateTime.now().day);

    selectedDate ??= DateTime.now();
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(
            context: context,
            selectedDate: selectedDate,
            minimumDatePickerDate: minimumDatePickerDate,
            maximumDatePickerDate: maximumDatePickerDate,
            onDateSelected: onDateSelected);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(
            context: context,
            selectedDate: selectedDate,
            minimumDatePickerDate: minimumDatePickerDate,
            maximumDatePickerDate: maximumDatePickerDate,
            onDateSelected: onDateSelected);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(
      {required BuildContext context,
      required DateTime selectedDate,
      required DateTime minimumDatePickerDate,
      required DateTime maximumDatePickerDate,
      required Function(DateTime date) onDateSelected}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // errorFormatText: invalidDob.tr(context),
      // errorInvalidText: invalidDob.tr(context),
      // initialDate: selectedDate ?? maximumDatePickerDate,
      initialDate: selectedDate,
      firstDate: minimumDatePickerDate,
      lastDate: maximumDatePickerDate,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: primaryColor)),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      // setState(() {
      //   selectedDate = picked;
      // });
      _formatSelectedDate(picked: picked, onDateSelected: onDateSelected);
    }
  }

  /// This builds cupertino date picker in iOS
  buildCupertinoDatePicker(
      {required BuildContext context,
      required DateTime selectedDate,
      required DateTime minimumDatePickerDate,
      required DateTime maximumDatePickerDate,
      required Function(DateTime date) onDateSelected}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  // setState(() {
                  //   selectedDate = picked;
                  // });
                  _formatSelectedDate(
                      picked: picked, onDateSelected: onDateSelected);
                }
              },
              // initialDateTime: selectedDate ?? maximumDatePickerDate,
              initialDateTime: selectedDate,
              minimumDate: minimumDatePickerDate,
              maximumDate: maximumDatePickerDate,
            ),
          );
        });
  }

  _formatSelectedDate(
      {required DateTime picked, required Function onDateSelected}) {
    onDateSelected(picked);
  }
}
