import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/dependency/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
@InjectableInit(asExtension: false)
FutureOr<GetIt> configureDependencyInjection() => init(getIt);
