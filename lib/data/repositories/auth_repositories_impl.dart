import 'package:dartz/dartz.dart';
import 'package:goods_app/core/error/failure.dart';
import 'package:goods_app/data/datasource/auth_remote_datasource.dart';
import 'package:goods_app/data/response/login_response.dart';
import 'package:goods_app/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthRemoteDatasource _loginRemoteDatasource;

  AuthRepositoriesImpl(this._loginRemoteDatasource);

  @override
  Future<Either<Failure, LoginResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _loginRemoteDatasource.login(email, password);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> me() async {
    try {
      final response = await _loginRemoteDatasource.me();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> logout() async {
    try {
      final response = await _loginRemoteDatasource.logout();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<String> getToken() async {
    return await _loginRemoteDatasource.getToken();
  }
}
