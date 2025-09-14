import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/response/login_response.dart';

abstract class AuthRepositories {
  Future<Either<Failure, LoginResponse>> login(String email, String password);

  Future<Either<Failure, LoginResponse>> me();

  Future<Either<Failure, LoginResponse>> logout();

  Future<String> getToken();
}
