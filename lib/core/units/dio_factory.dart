

import 'package:dio/dio.dart';
import 'package:naqla_task/core/units/shared_pref_helper.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'contain.dart';





class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {

    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type':'application/json',
      'Authorization':
      '${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',

    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'token $token',
      'Content-Type':'application/json',
      'contentType': 'application/json',
      'Accept': 'application/json',
    };
  }




  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}

