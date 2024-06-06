import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  }

  // showAlertDialog(
  //     context: locator<GlobalKey<NavigatorState>>().currentContext!,
  //     title: appName,
  //     type: ActionType.oneButton,
  //     message: tr(locator<GlobalKey<NavigatorState>>().currentContext!)
  //         .noInternetConnectionPleaseCheckConnection,
  //     onButtonOneClick: () {
  //       Navigator.pop(locator<GlobalKey<NavigatorState>>().currentContext!);
  //     });

  // showDialog(
  //     context: getInstance<GlobalKey<NavigatorState>>().currentContext!,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text(
  //           "Bloc Demo",
  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  //         ),
  //         content: const Text(
  //           "No internet connection. Please check your internet connection",
  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  //         ),
  //         actions: [
  //           TextButton(
  //               child: const Text(
  //                 "Ok",
  //                 style: TextStyle(
  //                     color: Colors.black, fontWeight: FontWeight.w400),
  //               ),
  //               onPressed: () {
  //                 Navigator.of(getInstance<GlobalKey<NavigatorState>>()
  //                         .currentContext!)
  //                     .pop();
  //               }),
  //         ],
  //       );
  //     });

  return false;
}
