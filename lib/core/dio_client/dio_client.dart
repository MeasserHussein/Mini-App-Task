import 'dart:developer';

import 'package:dio/dio.dart';


import '../units/contain.dart';
import '../units/shared_pref_helper.dart';
import 'api_keys.dart';
import 'endpoints.dart';
import 'server_exception.dart';

class DioClient {

  DioClient(this._dio, {this.token, this.language}) {
    _dio.options.baseUrl = Endpoint.apiBaseUrl;
    _dio.options.connectTimeout = Endpoint.connectionTimeout;
    _dio.options.receiveTimeout = Endpoint.receiveTimeout;
    _dio.options.responseType = ResponseType.json;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var token = await SharedPrefHelper.getSecuredString(
            SharedPrefKeys.userToken,
          );
          options.headers[ApiKeys.acceptLanguage] = language ?? 'ar';
          options.headers[ApiKeys.contentType] = 'application/json';
          if (token != null) {
            options.headers['Authorization'] = '$token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  final Dio _dio;
  String? token;
  String? language;

  void update(String newLanguage) {
    language = newLanguage;
    SharedPrefKeys.language = newLanguage;
    _dio.options.headers[ApiKeys.acceptLanguage] = newLanguage;
  }

  void updateToken(String newToken) {
    token = newToken;
    _dio.options.headers['Authorization'] = newToken;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options ?? Options(headers: {}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw ServerException.fromDioException(e);
    }
  }


}


