import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/constants/app_constants.dart';
import 'package:todo_app/core/module/api_client/interceptors/api_error_interceptor.dart';
import 'package:todo_app/core/module/api_client/interceptors/bad_network_error_interceptor.dart';
import 'package:todo_app/core/module/api_client/interceptors/internal_server_error_interceptor.dart';
import 'package:todo_app/core/module/api_client/interceptors/something_went_wrong_interceptor.dart';
import 'package:todo_app/core/module/api_client/interceptors/timeout_interceptor.dart';
import 'package:todo_app/core/module/api_client/interceptors/unathenticated_interceptor.dart';

@lazySingleton
class ApiClient {
  ApiClient() {
    _dio.options.baseUrl = AppConstants.baseUrl;
    _dio.options.headers['Accept-Language'] = Platform.localeName.substring(0, 2);
   // _dio.options.headers[AppConstants.headerApiKey] = AppConstants.apiKey;
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.interceptors.add(BadNetworkErrorInterceptor());
    _dio.interceptors.add(InternalServerErrorInterceptor());
    _dio.interceptors.add(ApiErrorInterceptor());
    _dio.interceptors.add(UnauthenticatedInterceptor());
    _dio.interceptors.add(TimeoutInterceptor());
    _dio.interceptors.add(SomethingWentWrongInterceptor());
  }

  final Dio _dio = Dio();

  String get baseUrl => _dio.options.baseUrl;

  Future<Response<dynamic>> post(
    String path,
    dynamic data, {
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.post<dynamic>(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );

  Future<Response<dynamic>> put(String path, dynamic data) => _dio.put<dynamic>(path, data: data);

  Future<Response<dynamic>> delete(String path, {dynamic data}) => _dio.delete<dynamic>(path, data: data);

  Future<Response<dynamic>> get(String path) => _dio.get<dynamic>(path);
}
