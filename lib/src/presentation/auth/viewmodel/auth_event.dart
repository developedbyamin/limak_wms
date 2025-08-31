part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthCheck extends AuthEvent {}

final class AuthSignIn extends AuthEvent {
  final LoginRequest loginRequest;
  AuthSignIn({required this.loginRequest});
}
