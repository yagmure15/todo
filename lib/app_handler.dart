import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/dependency/di.dart';
import 'package:todo_app/core/routing/router.gr.dart';
import 'package:todo_app/features/auth/application/auth_cubit/auth_cubit.dart';

@RoutePage()
class AppHandler extends StatelessWidget {
  const AppHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          bloc: getIt<AuthCubit>()..getAuthInstance(),
          listener: (context, state) {
            if (state is Authenticated) {
              AutoRouter.of(context).replaceAll([const HomeRoute()]);
            } else {
              AutoRouter.of(context).replaceAll([const SignInRoute()]);
            }
          },
        ),
      ],
      child: const RepaintBoundary(
        child: AutoRouter(),
      ),
    );
  }
}
