import 'package:flutter/material.dart';
import 'package:quiver/core.dart';

class LoginState {
  final String email;
  final String password;
  final bool isLoading;

  const LoginState({
    @required this.email,
    @required this.password,
    @required this.isLoading,
  });

  LoginState copyWith({
    bool isLoading,
    String email,
    Optional<String> emailError,
    String password,
    Optional<String> passwordError,
  }) {
    return LoginState(
      isLoading: isLoading != null ? isLoading : this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      email: null,
      password: null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password &&
          isLoading == other.isLoading;

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ isLoading.hashCode;
}
