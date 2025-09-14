import 'package:goods_app/core/network/dio_client.dart';
import 'package:goods_app/data/response/status_response.dart';

abstract class StatusRemoteDatasource {
  Future<List<StatusResponse>> getStatus();
}

class StatusRemoteDatasourceImpl implements StatusRemoteDatasource {
  final DioClient _dioClient;

  StatusRemoteDatasourceImpl(this._dioClient);

  @override
  Future<List<StatusResponse>> getStatus() async {
    final response = await _dioClient.get('status/');
    final data = (response.data['results'] as List)
        .map((e) => StatusResponse.fromJson(e))
        .toList();
    return data;
  }
}
