import '../../../data/response/login_response.dart';

abstract class MeState {}

class MeInitial extends MeState {}

class MeLoading extends MeState {}

class MeSuccess extends MeState {
  final LoginResponse user;

  MeSuccess(this.user);
}

class MeFailure extends MeState {
  final String message;

  MeFailure(this.message);
}
