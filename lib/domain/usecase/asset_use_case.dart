import 'package:dartz/dartz.dart';
import 'package:goods_app/data/response/detail_asset_response.dart';
import 'package:goods_app/domain/repositories/asset_repositories.dart';

import '../../core/error/failure.dart';
import '../../data/response/asset_list_response.dart';
import '../../data/response/create_asset_response.dart';

class GetAssetsUseCase {
  final AssetRepositories _repositories;

  GetAssetsUseCase(this._repositories);

  Future<Either<Failure, AssetListResponse>> call({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    return await _repositories.getAssets(
      page: page,
      pageSize: pageSize,
      search: search,
    );
  }
}

class CreateAssetUseCase {
  final AssetRepositories _repositories;

  CreateAssetUseCase(this._repositories);

  Future<Either<Failure, CreateAssetResponse>> call(
    String name,
    String statusId,
    String locationId,
  ) async {
    return await _repositories.createAsset(name, statusId, locationId);
  }
}

class UpdateAssetUseCase {
  final AssetRepositories _repositories;

  UpdateAssetUseCase(this._repositories);

  Future<Either<Failure, CreateAssetResponse>> call(
    String id,
    String name,
    String statusId,
    String locationId,
  ) async {
    return await _repositories.updateAsset(id, name, statusId, locationId);
  }
}

class DetailAssetUseCase {
  final AssetRepositories _repositories;

  DetailAssetUseCase(this._repositories);

  Future<Either<Failure, DetailAssetResponse>> call(String id) async {
    return await _repositories.getDetailAsset(id);
  }
}

class DeleteAssetUseCase {
  final AssetRepositories _repositories;

  DeleteAssetUseCase(this._repositories);

  Future<Either<Failure, String>> call(String id) async {
    return await _repositories.deleteAsset(id);
  }
}
