import '../../../data/response/create_asset_response.dart';

abstract class UpdateAssetState {}

class UpdateAssetInitial extends UpdateAssetState {}

class UpdateAssetLoading extends UpdateAssetState {}

class UpdateAssetSuccess extends UpdateAssetState {
  final CreateAssetResponse response;

  UpdateAssetSuccess(this.response);
}

class UpdateAssetFailure extends UpdateAssetState {
  final String message;

  UpdateAssetFailure(this.message);
}
