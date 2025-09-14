import 'package:goods_app/core/network/dio_client.dart';

import '../response/asset_by_location_response.dart';
import '../response/asset_by_status_response.dart';

abstract class HomeRemoteDatasource {
  Future<List<AssetByStatusResponse>> getAssetByStatus();

  Future<List<AssetByLocationResponse>> getAssetByLocation();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final DioClient _dioClient;

  HomeRemoteDatasourceImpl(this._dioClient);

  @override
  Future<List<AssetByStatusResponse>> getAssetByStatus() async {
    final response = await _dioClient.get('home/agg-asset-by-status/');
    final data = (response.data['results'] as List)
        .map((e) => AssetByStatusResponse.fromJson(e))
        .toList();
    return data;
  }

  @override
  Future<List<AssetByLocationResponse>> getAssetByLocation() async {
    final response = await _dioClient.get('home/agg-asset-by-location/');
    final data = (response.data['results'] as List)
        .map((e) => AssetByLocationResponse.fromJson(e))
        .toList();
    return data;
  }
}
