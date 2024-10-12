import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes/models/user_model.dart';

enum LoginStatus { initial, loading, success, failed }

class AuthenticationState extends Equatable {

  final User? user;
  final LoginStatus status;
  final String? errorMessage;

  const AuthenticationState({
    this.user,
    this.status = LoginStatus.initial,
    this.errorMessage
  });

  AuthenticationState copyWith({
    User? user,
    LoginStatus? status,
    String? errorMessage,
  }) => AuthenticationState(
    user: user ?? this.user,
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage
  );

  @override
  List<Object?> get props => [
    user, 
    status, 
    errorMessage
  ];
}