import 'package:goods_app/core/network/dio_client.dart';
import 'package:goods_app/core/storage/app_state.dart';
import 'package:goods_app/data/request/login_request.dart';
import 'package:goods_app/data/response/login_response.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponse> login(String email, String password);
  Future<LoginResponse> me();
  Future<LoginResponse> logout();
  Future<String> getToken();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _dioClient;
  final AppState _appState;

  AuthRemoteDatasourceImpl(this._dioClient, this._appState);

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await _dioClient.post(
      'auth/login',
      data: LoginRequest(email: email, password: password).toJson(),
    );

    final loginResponse = LoginResponse.fromJson(response.data);

    await _appState.saveToken(loginResponse.token ?? '');

    return loginResponse;
  }

  @override
  Future<LoginResponse> me() async {
    final response = await _dioClient.get('auth/me');
    final loginResponse = LoginResponse.fromJson(response.data);
    return loginResponse;
  }

  @override
  Future<LoginResponse> logout() async {
    final response = await _dioClient.post('auth/logout');
    final loginResponse = LoginResponse.fromJson(response.data);
    await _appState.clearToken();
    return loginResponse;
  }

  @override
  Future<String> getToken() async {
    return await _appState.getToken() ?? '';
  }
}
