import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';

import '../../data/response/asset_by_location_response.dart';
import '../../data/response/asset_by_status_response.dart';

abstract class HomeRepositories {
  Future<Either<Failure, List<AssetByStatusResponse>>> getAssetByStatus();

  Future<Either<Failure, List<AssetByLocationResponse>>> getAssetByLocation();
}
