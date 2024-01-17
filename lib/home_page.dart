import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/dependency/di.dart';
import 'package:todo_app/features/auth/application/auth_cubit/auth_cubit.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> singOut() async {
    await getIt<AuthCubit>().logout();
  }

  Widget _title() {
    return const Text('Home Page');
  }

  Widget _userUid() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Text('User UID:  ${state is Authenticated ? state.user?.uid : 'No User'}');
      },
    );
  }

  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await singOut();
      },
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _userUid(),
          _signOutButton(context),
        ],
      ),
    );
  }
}
