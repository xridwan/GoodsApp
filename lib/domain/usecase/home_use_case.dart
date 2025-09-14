import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/response/asset_by_location_response.dart';
import '../../data/response/asset_by_status_response.dart';
import '../repositories/home_repositories.dart';

class AssetByStatusUseCase {
  final HomeRepositories _repositories;

  AssetByStatusUseCase(this._repositories);

  Future<Either<Failure, List<AssetByStatusResponse>>> call() async {
    return await _repositories.getAssetByStatus();
  }
}

class AssetByLocUseCase {
  final HomeRepositories _repositories;

  AssetByLocUseCase(this._repositories);

  Future<Either<Failure, List<AssetByLocationResponse>>> call() async {
    return await _repositories.getAssetByLocation();
  }
}
