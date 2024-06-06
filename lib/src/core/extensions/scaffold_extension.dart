import 'package:flutter/material.dart';
import 'package:stipe_demo/src/core/utils/size_helper/size_extension.dart';

import '../widgets/app_text/medium_text.dart';

extension ScaffoldExtension on Widget {
  Widget scaffoldWithAppBar(
      {required BuildContext context,
      String? title,
      int? fontSize,
      Image? icons,
      Widget? bottomNav,
      List<Widget>? actions,
      Widget? leading,
      Widget? floatingActionButton}) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: bottomNav,
        body: SafeArea(child: this),
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          title: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: title != null ? 0.w : 0),
              child: Row(
                children: [
                  leading ?? Container(),
                  title != null
                      ? Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: leading != null ? 8.w : 4.w),
                            // padding:  EdgeInsets.only(left: 8.w),
                            child: MediumText(
                              text: title,
                              size: (fontSize != null) ? fontSize.sp : 18.sp,
                              color: Theme.of(context).colorScheme.onSurface,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        )
                      : Container(),
                  icons ?? Container(),
                ],
              )),
          automaticallyImplyLeading: false,
          actions: actions ?? [],

          // backgroundColor: primaryColor,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  // Scaffold scaffoldWithAppBar(
  //     {required BuildContext context, String? title, List<Widget>? actions}) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: title != null ? Text(title) : null,
  //       actions: actions ?? [],
  //     ),
  //     body: SafeArea(child: this),
  //   );
  // }

  Widget scaffoldWithoutAppBar({required BuildContext context}) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(child: this),
      ),
    );
  }

  Widget scaffoldWithoutAppBarSafeArea(
      {required BuildContext context,
      bool top = true,
      bool bottom = true,
      bool left = true,
      bool right = true}) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
            top: top, bottom: bottom, left: left, right: right, child: this),
      ),
    );
  }
}
