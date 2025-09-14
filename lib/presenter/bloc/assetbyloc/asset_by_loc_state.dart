import '../../../data/response/asset_by_location_response.dart';

abstract class AssetByLocState {}

class AssetByLocInitial extends AssetByLocState {}

class AssetByLocLoading extends AssetByLocState {}

class AssetByLocSuccess extends AssetByLocState {
  final List<AssetByLocationResponse> assets;

  AssetByLocSuccess(this.assets);
}

class AssetByLocFailure extends AssetByLocState {
  final String message;

  AssetByLocFailure(this.message);
}
