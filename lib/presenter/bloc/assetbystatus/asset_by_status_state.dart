import '../../../data/response/asset_by_status_response.dart';

abstract class AssetByStatusState {}

class AssetByStatusInitial extends AssetByStatusState {}

class AssetByStatusLoading extends AssetByStatusState {}

class AssetByStatusSuccess extends AssetByStatusState {
  final List<AssetByStatusResponse> assets;

  AssetByStatusSuccess(this.assets);
}

class AssetByStatusFailure extends AssetByStatusState {
  final String message;

  AssetByStatusFailure(this.message);
}
