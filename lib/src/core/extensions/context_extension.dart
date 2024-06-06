import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double getWidth([double percentage = 1.0]) {
    return MediaQuery.of(this).size.width * percentage;
  }

  double getHeight([double percentage = 1.0]) {
    return MediaQuery.of(this).size.height * percentage;
  }

// //Tooltip Overlay View
// showOverlay(BuildContext context, List<String> toolTipList) async {
//   OverlayState? overlayState = Overlay.of(context);
//   OverlayEntry overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//           top: 100,
//           child: Container(
//             color: Colors.red,
//             padding: const EdgeInsets.only(
//               left: 16,
//               right: 32,
//             ),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
//               child: Container(
//                   padding: const EdgeInsets.only(top: 15, left: 10),
//                   width: context.getWidth() - 48,
//                   height: 130,
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(6.0),
//                       ),
//                       color: Colors.white.withOpacity(0.95)),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/tips_circle.svg",
//                             color: black,
//                             width: 10,
//                             height: 10,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           SizedBox(
//                             width: context.getWidth() - 78,
//                             child: RobotoRegularText(
//                               text: toolTipList[0],
//                               size: 14.sp,
//                               color: black,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/tips_circle.svg",
//                             color: black,
//                             width: 10,
//                             height: 10,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           SizedBox(
//                             width: context.getWidth() - 78,
//                             child: RobotoRegularText(
//                               text: toolTipList[1],
//                               size: 14.sp,
//                               color: black,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   )),
//             ),
//           )));
//   overlayState?.insert(overlayEntry);
//   await Future.delayed(const Duration(seconds: 5));
//   overlayEntry.remove();
//   // isToolTipSelected = false;
// }
}
