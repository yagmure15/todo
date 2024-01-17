import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/dependency/di.dart';
import 'package:todo_app/core/utils/app_top_snackbar.dart';
import 'package:todo_app/features/auth/application/auth_cubit/auth_cubit.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String errorMessage = '';

  bool isLogin = false;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();





  Widget _title() {
    return const Text('Sign In Page');
  }

  Widget _emailField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage);
  }

  Widget _loginOrCreateUserButton() {
    return ElevatedButton(
      onPressed: () => getIt<AuthCubit>().login(
        email: 'a@a.com',
        password: '123123a',
      ),
      child: const Text('Login'),
    );
  }

  Widget _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => getIt<AuthCubit>().logout(),
      child: const Text('log out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Error) {
            AppTopSnackbar.showError(context, state.alert.message);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              _emailField(),
              _passwordField(),
              _errorMessage(),
              _loginOrCreateUserButton(),
              _submitButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
