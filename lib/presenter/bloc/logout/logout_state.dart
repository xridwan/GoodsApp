import '../../../data/response/login_response.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final LoginResponse response;

  LogoutSuccess(this.response);
}

class LogoutFailure extends LogoutState {
  final String message;

  LogoutFailure(this.message);
}
