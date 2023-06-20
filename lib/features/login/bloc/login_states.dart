import 'package:flutter/material.dart';

class LoginState {
  final String email;
  final String password;

  const LoginState({
     this.email = "",
     this.password = "",
  });

  LoginState copyWith({
    /// {variables} optional named parameters
    String? email,
    String? password,
  }) {
    debugPrint("in password  $password Email $email");
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
