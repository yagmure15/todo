import 'dart:developer';

import 'package:data_channel/data_channel.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/domain/alert_model/alert_model.dart';
import 'package:todo_app/core/enums/alert_type.dart';

typedef RepositoryFunction<T> = Future<DC<AlertModel, T>> Function();

Future<DC<AlertModel, T>> exceptionHandler<T>(RepositoryFunction<T> repositoryFunction) async {
  try {
    return await repositoryFunction();
  } on UnauthenticatedException catch (_) {
    final alert = AlertModel.initial();

    return DC.error(alert);
  } on ApiException catch (e) {
    final alert = AlertModel.exception(exception: e, code: e.response?.statusCode);

    return DC.error(alert);
  } on TimeoutException catch (_) {
    final alert = AlertModel.alert(message: 'Time Out', type: AlertType.error);

    return DC.error(alert);
  } on SomethingWentWrongExpection catch (_) {
    final alert = AlertModel.alert(message: 'Something Went Wrong!', type: AlertType.error);

    return DC.error(alert);
  } on FirebaseAuthException catch (e) {
    var message = '';
    if (e.code == 'wrong-password') {
      message = 'Wrong password provided for that user.';
    } else if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    } else if (e.code == 'invalid-email') {
      message = 'The email address is badly formatted.';
    } else if (e.code == 'user-disabled') {
      message = 'The user corresponding to the given email has been disabled.';
    } else if (e.code == 'too-many-requests') {
      message = 'Too many requests. Try again later.';
    } else if (e.code == 'operation-not-allowed') {
      message =
          'Email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.';
    } else if (e.code == 'weak-password') {
      message = 'The password is too weak.';
    } else if (e.code == 'invalid-verification-code') {
      message = 'The verification code is invalid. Please try again.';
    } else if (e.code == 'invalid-verification-id') {
      message = 'The verification ID is invalid.';
    } else if (e.code == 'invalid-credential') {
      message = 'The supplied auth credential is malformed or has expired.';
    } else if (e.code == 'invalid-verification-id') {
      message = 'The verification ID is invalid.';
    } else if (e.code == 'invalid-verification-code') {
      message = 'The verification code is invalid.';
    } else if (e.code == 'invalid-phone-number') {
      message =
          'The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].';
    } else if (e.code == 'missing-phone-number') {
      message = 'To send verification codes, provide a phone number for the recipient.';
    } else if (e.code == 'quota-exceeded') {
      message = 'The SMS quota for the project has been exceeded.';
    } else if (e.code == 'user-not-found') {
      message = 'There is no user corresponding to the phone number.';
    } else if (e.code == 'missing-verification-code') {
      message = 'The phone auth credential was created with';
    } else {
      message = 'Something Went Wrong! : ${e.code}';
    }
    final alert = AlertModel.alert(message: message, type: AlertType.error);

    return DC.error(alert);
  } on Exception catch (e) {
    final alert = AlertModel.exception(exception: e);

    return DC.error(alert);
  } catch (e) {
    if (e is Error) {
      log((e.stackTrace ?? 'No stacktrace').toString());
    }

    final alert = AlertModel.alert(message: 'Something Went Wrong! : $e', type: AlertType.error);

    return DC.error(alert);
  }
}

class BadNetworkException extends DioException implements Exception {
  BadNetworkException({required super.requestOptions});
}

class InternalServerException extends DioException implements Exception {
  InternalServerException({required super.requestOptions});
}

class UnauthenticatedException extends DioException implements Exception {
  UnauthenticatedException({required super.requestOptions});
}

class ApiException extends DioException implements Exception {
  ApiException({
    required this.errorMessage,
    required super.requestOptions,
    super.response,
    super.error,
    super.type,
  });

  final String errorMessage;
}

class InvalidJsonFormatException extends DioException implements Exception {
  InvalidJsonFormatException({required super.requestOptions});
}

class TimeoutException extends DioException implements Exception {
  TimeoutException({required super.requestOptions});
}

class SomethingWentWrongExpection extends DioException implements Exception {
  SomethingWentWrongExpection({
    required super.requestOptions,
    super.response,
    super.error,
    super.type,
  });
}

class RevokeTokenException implements Exception {}
