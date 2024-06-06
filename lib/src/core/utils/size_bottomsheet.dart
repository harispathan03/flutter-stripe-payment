import 'package:flutter/material.dart';

Future<dynamic> showSizeBottomSheet(
    {required BuildContext context,
    required double height,
    bool? isDismiss,
    EdgeInsets? padding,
    required Widget child}) async {
  var result = await showModalBottomSheet<dynamic>(
      context: context,
      isDismissible: (isDismiss != null) ? isDismiss : true,
      isScrollControlled: true,
      elevation: 10,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(24),
      //   ),
      // ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        //Give padding to size box for move bottomsheet on keyboard.
        return Padding(
          padding: padding ??
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(height: height, width: double.infinity, child: child),
        );
      });

  return result;
}
