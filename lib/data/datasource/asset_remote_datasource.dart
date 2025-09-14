import 'package:goods_app/core/network/dio_client.dart';
import 'package:goods_app/data/request/create_asset_request.dart';
import 'package:goods_app/data/response/create_asset_response.dart';
import 'package:goods_app/data/response/detail_asset_response.dart';

import '../response/asset_list_response.dart';

abstract class AssetRemoteDatasource {
  Future<AssetListResponse> getAssets({
    required int page,
    required int pageSize,
    String? search,
  });

  Future<CreateAssetResponse> createAsset(
    String name,
    String statusId,
    String locationId,
  );

  Future<CreateAssetResponse> updateAsset(
    String id,
    String name,
    String statusId,
    String locationId,
  );

  Future<DetailAssetResponse> getDetailAsset(String id);

  Future<String> deleteAsset(String id);
}

class AssetRemoteDatasourceImpl implements AssetRemoteDatasource {
  final DioClient _dioClient;

  AssetRemoteDatasourceImpl(this._dioClient);

  @override
  Future<AssetListResponse> getAssets({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final response = await _dioClient.get(
      'asset/',
      queryParameters: {
        'page': page,
        'page_size': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );

    final assetListResponse = AssetListResponse.fromJson(response.data);
    return assetListResponse;
  }

  @override
  Future<CreateAssetResponse> createAsset(
    String name,
    String statusId,
    String locationId,
  ) async {
    final response = await _dioClient.post(
      'asset/',
      data: CreateAssetRequest(
        name: name,
        statusId: statusId,
        locationId: locationId,
      ).toJson(),
    );
    final createAssetResponse = CreateAssetResponse.fromJson(response.data);
    return createAssetResponse;
  }

  @override
  Future<CreateAssetResponse> updateAsset(
    String id,
    String name,
    String statusId,
    String locationId,
  ) async {
    final response = await _dioClient.update(
      'asset/$id',
      data: CreateAssetRequest(
        name: name,
        statusId: statusId,
        locationId: locationId,
      ).toJson(),
    );
    final createAssetResponse = CreateAssetResponse.fromJson(response.data);
    return createAssetResponse;
  }

  @override
  Future<DetailAssetResponse> getDetailAsset(String id) async {
    final response = await _dioClient.get('asset/$id');
    return DetailAssetResponse.fromJson(response.data);
  }

  @override
  Future<String> deleteAsset(String id) async {
    final response = await _dioClient.delete('asset/$id');
    return response.data;
  }
}
