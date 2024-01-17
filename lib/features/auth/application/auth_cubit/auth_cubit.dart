import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/domain/alert_model/alert_model.dart';
import 'package:todo_app/features/auth/infrastructure/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState.initial());

  final AuthRepository authRepository;

  Future<void> getAuthInstance() async {
    emit(const AuthState.loading());
    await Future.delayed(Duration.zero);
    final firebaseInstance = FirebaseAuth.instance;
    firebaseInstance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthState.unauthenticated());
      } else {
        emit(AuthState.authenticated(user: user));
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final response = await authRepository.login(email: email, password: password);
    await Future.delayed(const Duration(seconds: 1));

    response.pick(
      onData: (user) {
        emit(AuthState.authenticated(user: user));
      },
      onError: (alert) {
        emit(AuthState.error(alert: alert));
      },
    );
  }

  Future<void> register({required String email, required String password}) async {
    emit(const AuthState.loading());
    final response = await authRepository.register();

    response.pick(
      onData: (user) {
        emit(AuthState.authenticated(user: user));
      },
      onError: (alert) {
        emit(AuthState.error(alert: alert));
      },
    );
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final response = await authRepository.logout();

    response.pick(
      onData: (user) {
        emit(const AuthState.unauthenticated());
      },
      onError: (alert) {
        emit(AuthState.error(alert: alert));
      },
    );
  }
}
