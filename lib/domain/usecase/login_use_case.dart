import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/response/login_response.dart';
import 'package:goods_app/domain/repositories/auth_repositories.dart';

class LoginUseCase {
  final AuthRepositories _repositories;

  LoginUseCase(this._repositories);

  Future<Either<Failure, LoginResponse>> call(
    String email,
    String password,
  ) async {
    return await _repositories.login(email, password);
  }
}

class MeUseCase {
  final AuthRepositories _repositories;

  MeUseCase(this._repositories);

  Future<Either<Failure, LoginResponse>> call() async {
    return await _repositories.me();
  }
}

class LogoutUseCase {
  final AuthRepositories _repositories;

  LogoutUseCase(this._repositories);

  Future<Either<Failure, LoginResponse>> call() async {
    return await _repositories.logout();
  }
}

class GetTokenUseCase {
  final AuthRepositories _repositories;

  GetTokenUseCase(this._repositories);

  Future<String> call() async {
    return await _repositories.getToken();
  }
}
