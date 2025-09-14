import 'package:goods_app/core/network/dio_client.dart';
import 'package:goods_app/data/response/location_response.dart';

abstract class LocationRemoteDatasource {
  Future<List<LocationResponse>> getLocation();
}

class LocationRemoteDatasourceImpl implements LocationRemoteDatasource {
  final DioClient _dioClient;

  LocationRemoteDatasourceImpl(this._dioClient);

  @override
  Future<List<LocationResponse>> getLocation() async {
    final response = await _dioClient.get('location/');
    final data = (response.data['results'] as List)
        .map((e) => LocationResponse.fromJson(e))
        .toList();
    return data;
  }
}
