part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoadingStat extends AuthState {}
class LoginSuccessState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class GoogleSuccessState extends AuthState {}
final class AuthFailureState extends AuthState {
  String errorMessage;
  AuthFailureState({required this.errorMessage});
}
class AuthSuccessState extends AuthState {
  final String message;
  AuthSuccessState({required this.message});
}