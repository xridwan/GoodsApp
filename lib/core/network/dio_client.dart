import 'package:dio/dio.dart';
import 'package:goods_app/core/storage/app_state.dart';

import '../error/handle_dio_error.dart';

class DioClient {
  final Dio _dio;
  final String _baseUrl = 'https://be-ksp.analitiq.id/';
  final AppState _appState;

  DioClient(this._dio, this._appState) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _appState.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/$endpoint',
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Response> update(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        '$_baseUrl/$endpoint',
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/$endpoint',
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl/$endpoint',
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
