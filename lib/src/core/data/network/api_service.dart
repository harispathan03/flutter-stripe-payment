import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_routes.dart';
import 'utils/connectivity.dart';
import 'utils/logging_interceptor.dart';

class ApiService {
  static final _createDio = createDio();
  static final _dio = addInterceptors(_createDio);

  static BaseOptions options = BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      responseType: ResponseType.json,
      contentType: 'application/json',
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      validateStatus: (status) {
        if (status == null) {
          return false;
        }
        return status >= 200 && status < 300;
      });

  static Dio createDio() {
    return Dio(options);
  }

  static Dio addInterceptors(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // String accessToken = SharedPreferenceManager.getString(
            //     SharedPreferenceManager.prefAccessToken);
            // accessToken =
            //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmM2ZWE1OGYxZmMyYjJjZjdmMGEwYjQ2NGNkNWJhYzJjNzk3NDhjNTdmM2MxZGMxM2MxZDdjOWNlMmQ2OGZjMTc0MGIxMTA2NDk0YTRmZTUiLCJpYXQiOjE3MTMyNjkzODYuMzg4MTE4MDI4NjQwNzQ3MDcwMzEyNSwibmJmIjoxNzEzMjY5Mzg2LjM4ODExOTkzNTk4OTM3OTg4MjgxMjUsImV4cCI6MTg3MTAzNTc4Ni4zODI4MDUxMDkwMjQwNDc4NTE1NjI1LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.fppHeeM78D_VOl4Knpokko4fElOOeCJORauaLB-iSoSMASwaP5ekYC-zrdPo1FRIASaJ4rLNGZe28yRFlJ__dqDcCYKyK4UemEI6HGA8ppztuUbqr0Tx3hRp4xdunYq6rCP7g5ivPVWegIxkitOwj4S-wU8X-XR5ThG1C2gBVl2_6aKOQ1lz3M4oK8vy6x4DhDtiz3mLgetPWTk_8nCgZGXYw5IPzfWSKV0938GNUc7f3JVmSiqfTMfSXg_xcGoMq7fIduI4x2zTAROMJexZh1ZQNyuSjNkRurdAQAXyiJE7xFGhM3xMhQbBOM9ONRfG7_AObhvbqSN6tI_YpAJUzgT_QMk9l3vOjqtfyfBRvVeiv-jBix_Z_5JGN32eK_DjTWiE3qIVKzUNvxCCcfoUkllUv8HlbvBPbwLRcM89DuMuKs-dB5QzMT_zbVtSbqt_U1JQQGvSm72lcjMPaeP1G3LBm99v5_TAAlN-Fl58CLdFxrzJr6pR_j03JcKXu2UOuPw6KQ-9OwoLnI2Mdpcx9_C98JqWbCqyOOxCsx6Bejs1FU8npB4VaI1g8CzVcnDebHKoCcrTF57iHy_jQUew6dWGbQHBkVx3eSZeHJpcVr8WDhVHuQlCSRJ-r6tISem4iZ-YnPY5P9YH2PqexCKGpAhqIiTLTOhDGdW0vsOFWyQ";
            options.headers.addAll({
              // 'Authorization': 'Bearer $accessToken',
            });
            return handler.next(options);
          },
          onResponse: (e, handler) {
            // if (e.data != null && e.data[status] != null) {
            //   if (e.data[status] == statusInactiveUser ||
            //       e.data[status] == statusDeletedUser ||
            //       e.data[status] == statusAccessTokenExpired) {
            //     String url = e.realUri.toString();
            //     var lastIndex = url.lastIndexOf("/");
            //     var path = url.substring(lastIndex);
            //     if (path.trim() != ApiRoutes.signIn.trim()) {
            //       clearDataAndLogoutUser();
            //       // _showErrorMessage(e.data[message]);
            //       return;
            //     } else {
            //       // _showErrorMessage(e.data[message]);
            //     }
            //   }
            // }
            return handler.next(e);
          },
          onError: (e, handler) {
            return handler.next(e);
          },
        ),
      );
  }

  Future<Response?> get(String endUrl,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    if (await checkInternet()) {
      return await (_dio.get(endUrl,
          queryParameters: params, options: options, cancelToken: cancelToken));
    }
    return null;
  }

  Future<Response?> post(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    if (await checkInternet()) {
      return await (_dio.post(endUrl,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken));
    }
    return null;
  }

  Future<Response?> delete(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      bool isCompanyCheck = false,
      CancelToken? cancelToken}) async {
    if (await checkInternet()) {
      return await (_dio.delete(endUrl,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken));
    }
    return null;
  }

  Future<Response?> multipartPost(String endUrl,
      {required FormData data,
      Options? options,
      CancelToken? cancelToken}) async {
    if (await checkInternet()) {
      return await (_dio.post(endUrl,
          data: data,
          options: options,
          cancelToken: cancelToken, onSendProgress: (int count, int total) {
        debugPrint("sent: $count - total: $total");
      }));
    }
    return null;
  }

  // this function is used to clear data of user from preference and local database and navigate to login screen
  static void clearDataAndLogoutUser() async {
    //getting device token from preference
    // String deviceToken = SharedPreferenceManager.getString(
    //     SharedPreferenceManager.prefDeviceToken);
    // // clear preference
    // await SharedPreferenceManager.clear();
    // // update global user detail
    // getInstance<UserHelper>().saveUser();

    // // stop listening to chat message counter
    // getInstance<ChatMessageCounterProvider>().stopMessageCountListener();
    // getInstance<ChatMessageCounterProvider>().totalUnreadMessageCount = 0;

    // //restoring device token
    // await SharedPreferenceManager.setString(
    //     SharedPreferenceManager.prefDeviceToken, deviceToken);

    // //clearing subscription related information from UserSubscriptionInfoProvider
    // getInstance<UserSubscriptionInfoProvider>().resetSubscriptionInformation();

    // getInstance<LoadingProvider>().stopLoading();
    // // getInstance<GlobalKey<NavigatorState>>()
    // //     .currentState
    // //     ?.pushNamedAndRemoveUntil(RouteNames.signIn, (route) => false);
    // showAlertDialog(
    //     context: getInstance<GlobalKey<NavigatorState>>().currentContext!,
    //     type: ActionType.OK,
    //     title: appName,
    //     message: message,
    //     onClick: () {
    //       Navigator.pop(
    //           getInstance<GlobalKey<NavigatorState>>().currentContext!);
    //       getInstance<GlobalKey<NavigatorState>>()
    //           .currentState
    //           ?.pushNamedAndRemoveUntil(RouteNames.signIn, (route) => false);
    //     });
  }

  //alert method
  // static void _showErrorMessage(String message) {
  //   showAlertDialog(
  //       context: locator<GlobalKey<NavigatorState>>().currentContext!,
  //       type: ActionType.oneButton,
  //       title: appName,
  //       message: message,
  //       onButtonOneClick: () {
  //         // _addNewItemProvider.updateState(ApiStates.INITIAL);
  //         Navigator.pop(locator<GlobalKey<NavigatorState>>().currentContext!);
  //       });
  // }
}
