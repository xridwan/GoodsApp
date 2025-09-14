import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/asset_by_status_response.dart';
import 'package:goods_app/domain/repositories/home_repositories.dart';

import '../datasource/home_remote_datasource.dart';
import '../response/asset_by_location_response.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeRemoteDatasource _remoteDatasource;

  HomeRepositoriesImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<AssetByStatusResponse>>>
  getAssetByStatus() async {
    try {
      final response = await _remoteDatasource.getAssetByStatus();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AssetByLocationResponse>>>
  getAssetByLocation() async {
    try {
      final response = await _remoteDatasource.getAssetByLocation();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
