import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/detail_asset_response.dart';

import '../../data/response/asset_list_response.dart';
import '../../data/response/create_asset_response.dart';

abstract class AssetRepositories {
  Future<Either<Failure, AssetListResponse>> getAssets({
    required int page,
    required int pageSize,
    String? search,
  });

  Future<Either<Failure, CreateAssetResponse>> createAsset(
    String name,
    String statusId,
    String locationId,
  );

  Future<Either<Failure, CreateAssetResponse>> updateAsset(
    String id,
    String name,
    String statusId,
    String locationId,
  );

  Future<Either<Failure, DetailAssetResponse>> getDetailAsset(String id);

  Future<Either<Failure, String>> deleteAsset(String id);
}
