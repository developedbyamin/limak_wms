part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {}

final class Unauthenticated extends AuthState {}

final class AuthSignInSuccess extends AuthState {
  final LoginResponse loginResponse;
  AuthSignInSuccess({required this.loginResponse});
}

final class AuthSignInFailure extends AuthState {
  final String errorMessage;
  AuthSignInFailure({required this.errorMessage});
}
