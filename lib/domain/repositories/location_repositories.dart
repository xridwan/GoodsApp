import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/location_response.dart';

abstract class LocationRepositories {
  Future<Either<Failure, List<LocationResponse>>> getLocation();
}
