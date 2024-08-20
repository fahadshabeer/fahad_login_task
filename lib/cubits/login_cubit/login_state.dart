part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  User user;
  LoginSuccess({required this.user});
}
class LoginFailed extends LoginState {
  String err;
  LoginFailed({required this.err});
}
