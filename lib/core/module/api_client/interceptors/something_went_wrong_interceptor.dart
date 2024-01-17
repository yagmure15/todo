import 'package:dio/dio.dart';
import 'package:todo_app/core/exceptions/exceptions.dart';

class SomethingWentWrongInterceptor extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.reject(
      SomethingWentWrongExpection(
        requestOptions: err.requestOptions,
        response: err.response,
        error: err.error,
        type: err.type,
      ),
    );

    return handler.next(err);
  }
}
