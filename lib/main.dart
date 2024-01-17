import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/core/dependency/di.dart';
import 'package:todo_app/core/routing/router.dart';
import 'package:todo_app/core/utils/app_bloc_observer.dart';
import 'package:todo_app/core/utils/app_theme.dart';
import 'package:todo_app/features/auth/application/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  Bloc.observer = AppBlocObserver();

  // Configures dependency injection to init modules and singletons.
  await configureDependencyInjection();
  // Sets up allowed device orientations for the app.
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final appRouter = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        theme: AppTheme.buildTheme(Brightness.light),
      ),
    ),
  );
}
