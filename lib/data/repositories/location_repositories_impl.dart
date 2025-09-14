import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/location_response.dart';
import 'package:goods_app/data/response/status_response.dart';
import 'package:goods_app/domain/repositories/location_repositories.dart';
import 'package:goods_app/domain/repositories/status_repositories.dart';

import '../datasource/location_remote_datasource.dart';
import '../datasource/status_remote_datasource.dart';

class LocationRepositoriesImpl implements LocationRepositories {
  final LocationRemoteDatasource _locationRemoteDatasource;

  LocationRepositoriesImpl(this._locationRemoteDatasource);

  @override
  Future<Either<Failure, List<LocationResponse>>> getLocation() async {
    try {
      final response = await _locationRemoteDatasource.getLocation();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
