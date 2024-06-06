// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart'
//     as permissionHandler;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:preloved_project/src/base/utils/shared_preference_mananger.dart';

// enum LocationState {
//   locationInitial,
//   locationPermissionNotGranted,
//   locationPermissionGranted,
//   locationOff,
//   locationOn,
//   locationFetched,
//   locationFetchFailed
// }

// class LocationHelper {
//   Future<LocationState> getLocation() async {
//     getInstance<LoadingProvider>().startLoading();
//     if (!(await getLocationStatus())) {
//       return LocationState.locationPermissionNotGranted;
//     }
//     bool locationEanbled = await Location.instance.requestService();
//     if (!locationEanbled) {
//       return LocationState.locationOff;
//     }
//     Location location = Location();
//     await Future.delayed(Duration(seconds: 2));
//     LocationData _pos = await location.getLocation();
//     debugPrint("current latitude: ${_pos.latitude}");
//     debugPrint("current longitude: ${_pos.longitude}");

//     await SharedPreferenceManager.setDouble(
//         SharedPreferenceManager.latitude, _pos.latitude ?? 0.0);
//     await SharedPreferenceManager.setDouble(
//         SharedPreferenceManager.longitude, _pos.longitude ?? 0.0);
//     if (_pos.latitude == null || _pos.longitude == null) {
//       return LocationState.locationFetchFailed;
//     }
//     return LocationState.locationFetched;

//     // location.onLocationChanged.listen((LocationData currentLocation) {
//     //   // Use current location

//     //   debugPrint("latitude1: ${_pos.latitude}");
//     //   debugPrint("longitude1: ${_pos.longitude}");
//     // });
//   }

//   //get Location permission status
//   Future<bool> getLocationStatus() async {
//     if (getInstance<GlobalKey<NavigatorState>>().currentState == null) {
//       return false;
//     }
//     bool isLocationPermissionGranted =
//         await PermissionChecker.requestPermission(Permission.location,
//             getInstance<GlobalKey<NavigatorState>>().currentState!.context,
//             message: locationPermissionMessage.tr(
//                 getInstance<GlobalKey<NavigatorState>>()
//                     .currentState!
//                     .context));
//     return isLocationPermissionGranted;
//   }

//   Future<bool> getLocationPermissionStatus() async {
//     final _result = await Permission.location.request();
//     if (_result == permissionHandler.PermissionStatus.granted ||
//         _result == permissionHandler.PermissionStatus.limited) {
//       return true;
//     }
//     return false;
//   }
// }
