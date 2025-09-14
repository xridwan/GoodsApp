import '../../../data/response/detail_asset_response.dart';

abstract class DetailAssetState {}

class DetailAssetInitial extends DetailAssetState {}

class DetailAssetLoading extends DetailAssetState {}

class DetailAssetSuccess extends DetailAssetState {
  final DetailAssetResponse asset;

  DetailAssetSuccess(this.asset);
}

class DetailAssetFailure extends DetailAssetState {
  final String message;

  DetailAssetFailure(this.message);
}
