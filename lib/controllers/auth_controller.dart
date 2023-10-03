import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/services/auth.dart';
import 'package:flutter_ecommerce/utilities/enums.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  });

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(
      authFormType: formType,
      email: '',
      password: '',
    );
  }
  Future<void> submit ()async {
    try {
      if (authFormType == AuthFormType.login){
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.registerWithEmailAndPassword(email, password);
      }
    }catch (e){
      rethrow;
    }

  }

  Future<void> logout()async {
    try {
      await auth.logout();
    }catch (e){
      rethrow;
    }
  }

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
