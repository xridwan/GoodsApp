import '../../../data/response/location_response.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final List<LocationResponse> locations;

  LocationSuccess(this.locations);
}

class LocationFailure extends LocationState {
  final String message;

  LocationFailure(this.message);
}
