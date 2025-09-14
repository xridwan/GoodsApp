import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/domain/repositories/asset_repositories.dart';

import '../datasource/asset_remote_datasource.dart';
import '../response/asset_list_response.dart';
import '../response/create_asset_response.dart';
import '../response/detail_asset_response.dart';

class AssetRepositoriesImpl implements AssetRepositories {
  final AssetRemoteDatasource _remoteDatasource;

  AssetRepositoriesImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, AssetListResponse>> getAssets({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    try {
      final response = await _remoteDatasource.getAssets(
        page: page,
        pageSize: pageSize,
        search: search,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateAssetResponse>> createAsset(
    String name,
    String statusId,
    String locationId,
  ) async {
    try {
      final response = await _remoteDatasource.createAsset(
        name,
        statusId,
        locationId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateAssetResponse>> updateAsset(
    String id,
    String name,
    String statusId,
    String locationId,
  ) async {
    try {
      final response = await _remoteDatasource.updateAsset(
        id,
        name,
        statusId,
        locationId,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailAssetResponse>> getDetailAsset(String id) async {
    try {
      final response = await _remoteDatasource.getDetailAsset(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAsset(String id) async {
    try {
      final response = await _remoteDatasource.deleteAsset(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
