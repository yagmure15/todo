import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:todo_app/core/exceptions/exceptions.dart';

class ApiErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null &&
        err.response!.statusCode != null &&
        (err.response!.statusCode! == 400 || err.response!.statusCode == 401 || err.response!.statusCode == 404)) {
      try {
        final error = err.response! as Map<String, dynamic>;
        final message = json.decode(error.toString()) as Map<String, dynamic>;
        final hasErrors = message['detail'] != null;

        if (hasErrors) {
          final errors = json.decode(message['detail'] as String) as Map<String, dynamic>;
          final firstValue = errors.values.first as List;

          return handler.reject(
            ApiException(
              errorMessage: firstValue.first as String,
              requestOptions: err.requestOptions,
              response: err.response,
              error: err.error,
              type: err.type,
            ),
          );
        } else {
          final response = err.response?.data as Map<String, dynamic>;
          final title = response['title'] as String;

          return title == 'One or more validation errors occurred.'
              ? handler.reject(InvalidJsonFormatException(requestOptions: err.requestOptions))
              : handler.reject(
                  ApiException(
                    errorMessage: title,
                    requestOptions: err.requestOptions,
                    response: err.response,
                    error: err.error,
                    type: err.type,
                  ),
                );
        }
      } catch (e) {
        return handler.reject(InternalServerException(requestOptions: err.requestOptions));
      }
    }

    return handler.next(err);
  }
}
