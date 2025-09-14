import 'package:dartz/dartz.dart';
import 'package:goods_app/domain/repositories/status_repositories.dart';

import '../../core/error/failure.dart';
import '../../data/response/status_response.dart';

class StatusUseCase {
  final StatusRepositories _repositories;

  StatusUseCase(this._repositories);

  Future<Either<Failure, List<StatusResponse>>> call() async {
    return await _repositories.getStatus();
  }
}
