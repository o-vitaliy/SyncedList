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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterState &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password &&
          passwordConfirm == other.passwordConfirm &&
          isLoading == other.isLoading;

  @override
  int get hashCode =>
      email.hashCode ^
      password.hashCode ^
      passwordConfirm.hashCode ^
      isLoading.hashCode;
}
