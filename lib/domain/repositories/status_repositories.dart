import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/status_response.dart';

abstract class StatusRepositories {
  Future<Either<Failure, List<StatusResponse>>> getStatus();
}