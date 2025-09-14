import '../../../data/response/status_response.dart';

abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoading extends StatusState {}

class StatusSuccess extends StatusState {
  final List<StatusResponse> statuses;

  StatusSuccess(this.statuses);
}

class StatusFailure extends StatusState {
  final String message;

  StatusFailure(this.message);
}
