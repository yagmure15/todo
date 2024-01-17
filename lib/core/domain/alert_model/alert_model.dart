import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/core/enums/alert_type.dart';
import 'package:todo_app/core/exceptions/exceptions.dart';
import 'package:todo_app/core/logger/log_it.dart';


part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

@freezed
class AlertModel with _$AlertModel {
  const factory AlertModel({
    required String message,
    required AlertType type,
    int? code,
  }) = _AlertModel;

  factory AlertModel.alert({
    required String message,
    required AlertType type,
    int? code,
  }) {
    if (type == AlertType.error) {
      logger.error(message);
    }

    return AlertModel(
      message: message,
      type: type,
      code: code,
    );
  }

  factory AlertModel.exception({
    required Exception exception,
    int? code,
  }) {
    String message;

    if (exception is BadNetworkException) {
      message = 'No Internet Connection';
    } else if (exception is InternalServerException) {
      message = 'Internal Server Exception';
    } else if (exception is InvalidJsonFormatException) {
      message = 'Invalid Json Format Exception';
    } else if (exception is ApiException) {
      message = exception.errorMessage;
    } else {
      message = exception.toString();
    }

    return AlertModel(
      message: message,
      type: AlertType.exception,
      code: code,
    );
  }

  factory AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);

  factory AlertModel.initial() => AlertModel.alert(message: '', type: AlertType.quiet);
}
