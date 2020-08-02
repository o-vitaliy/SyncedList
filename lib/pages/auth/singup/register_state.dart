import 'package:flutter/material.dart';

class RegisterState {
  final String email;
  final String password;
  final String passwordConfirm;
  final bool isLoading;

  const RegisterState({
    @required this.email,
    @required this.password,
    @required this.passwordConfirm,
    @required this.isLoading,
  });

  RegisterState copyWith({
    bool isLoading,
    String email,
    String password,
    String passwordConfirm,
    List diseases,
    DateTime birthDate,
  }) {
    return RegisterState(
      isLoading: isLoading != null ? isLoading : this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }

  factory RegisterState.initial() {
    return RegisterState(
      isLoading: false,
      email: null,
      password: null,
      passwordConfirm: null,
    );
  }
}
