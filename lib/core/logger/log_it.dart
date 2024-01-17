import 'dart:io' as io;

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:todo_app/core/dependency/di.dart';

final LogIt logger = getIt<LogIt>();

@lazySingleton
class LogIt {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: io.stdout.supportsAnsiEscapes,
    ),
  );

  /// Log a message at level [Level.trace].
  void trace(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void fatal(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
