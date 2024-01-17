import 'package:data_channel/data_channel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/core/domain/alert_model/alert_model.dart';
import 'package:todo_app/core/exceptions/exceptions.dart';

@lazySingleton
class AuthRepository {
  AuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Future<User?> get currentUser async {
    return _firebaseAuth.currentUser;
  }

  Future<DC<AlertModel, User?>> login({required String email, required String password}) async {
    return exceptionHandler<User?>(() async {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        password: password,
        email: email,
      );

      return DC.data(response.user);
    });
  }

  Future<DC<AlertModel, User?>> register() async {
    return exceptionHandler<User?>(() async {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        password: '',
        email: '',
      );

      return DC.data(response.user);
    });
  }

  Future<DC<AlertModel, void>> logout() async {
    return exceptionHandler<void>(() async {
      await _firebaseAuth.signOut();

      return DC.data(null);
    });
  }
}
