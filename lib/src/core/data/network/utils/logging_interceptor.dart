import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint(
        '************************************ API Request - Start ************************************');

    printKV('URL', options.uri);
    printKV('METHOD', options.method);
    if (options.headers.isNotEmpty) {
      logPrint('HEADERS');
      options.headers.forEach((key, v) => printKV(' - $key', v));
    }
    if (options.queryParameters.isNotEmpty) {
      logPrint('QUERY PARAMETERS:');
      options.queryParameters.forEach((key, v) => printKV(' - $key', v));
    }
    if (options.data != null) {
      logPrint('BODY:');
      printAll(options.data ?? '');
    }
    // await Future.delayed(const Duration(seconds: 3));
    logPrint(
        '************************************ API Request - End ************************************');

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logPrint(
        '************************************ Api Error - Start ************************************');

    logPrint('URL ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE ${err.response?.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      // printKV('REDIRECT', err.response?.realUri ?? '');
      logPrint('BODY');
      printAll(err.response?.data.toString());
    }

    logPrint(
        '************************************ Api Error - End ************************************');
    return handler.next(err);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    logPrint(
        '************************************ Api Response - Start ************************************');

    printKV('URL', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode ?? '');
    // printKV('REDIRECT', response.isRedirect ?? false);
    logPrint('BODY:');
    printAll(response.data ?? '');

    logPrint(
        '************************************ Api Response - End ************************************');

    // debugPrint("data type: ${response.data.runtimeType}");
    // debugPrint("data : ${response.data}");
    return handler.next(response);
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    // debugPrint(s);
    if (kDebugMode) {
      log(s);
    }
  }
}
