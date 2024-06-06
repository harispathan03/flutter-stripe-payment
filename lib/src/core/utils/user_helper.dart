// import 'dart:convert';

// import '../../data/network/models/response_models/user/user.dart';
// import '../../di/get_it.dart';
// import 'shared_preference_manager.dart';

// class UserHelper {
//   User? _user;

//   User? get user => _user ?? getUser();

//   User? getUser() {
//     var userJson =
//         SharedPreferenceManager.getString(SharedPreferenceManager.prefUser);
//     if (userJson.isNotEmpty && userJson != "null") {
//       _user = User.fromJson(json.decode(userJson));
//     } else {
//       _user = null;
//     }

//     return _user;
//   }

//   Future<void> saveUser({User? user}) async {
//     // User? userInfo = user?.copyWith(
//     //     firebaseId:
//     //         getInstance<FirebaseAuthController>().getCurrentUserFirebaseId());
//     String userPrefData = json.encode(userInfo?.toJson());
//     await SharedPreferenceManager.setString(
//         SharedPreferenceManager.prefUser, userPrefData);
//     _user = userInfo;
//   }
// }
