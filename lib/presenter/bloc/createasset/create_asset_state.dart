import '../../../data/response/create_asset_response.dart';

abstract class CreateAssetState {}

class CreateAssetInitial extends CreateAssetState {}

class CreateAssetLoading extends CreateAssetState {}

class CreateAssetSuccess extends CreateAssetState {
  final CreateAssetResponse response;

  CreateAssetSuccess(this.response);
}

class CreateAssetFailure extends CreateAssetState {
  final String message;

  CreateAssetFailure(this.message);
}
