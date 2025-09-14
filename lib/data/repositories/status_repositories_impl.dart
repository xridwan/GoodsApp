import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/status_response.dart';
import 'package:goods_app/domain/repositories/status_repositories.dart';

import '../datasource/status_remote_datasource.dart';

class StatusRepositoriesImpl implements StatusRepositories {
  final StatusRemoteDatasource _statusRemoteDatasource;

  StatusRepositoriesImpl(this._statusRemoteDatasource);

  @override
  Future<Either<Failure, List<StatusResponse>>> getStatus() async {
    try {
      final response = await _statusRemoteDatasource.getStatus();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
