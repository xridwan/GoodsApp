import 'package:dartz/dartz.dart';
import 'package:goods_app/data/response/location_response.dart';
import 'package:goods_app/domain/repositories/location_repositories.dart';

import '../../core/error/failure.dart';

class LocationUseCase {
  final LocationRepositories _repositories;

  LocationUseCase(this._repositories);

  Future<Either<Failure, List<LocationResponse>>> call() async {
    return await _repositories.getLocation();
  }
}
