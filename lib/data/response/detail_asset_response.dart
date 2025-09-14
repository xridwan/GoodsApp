import 'package:goods_app/data/response/status_response.dart';

import 'location_response.dart';

class DetailAssetResponse {
  final String id;
  final String name;
  final LocationResponse location;
  final StatusResponse status;

  DetailAssetResponse({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
  });

  factory DetailAssetResponse.fromJson(Map<String, dynamic> json) {
    return DetailAssetResponse(
      id: json['id'],
      name: json['name'],
      location: LocationResponse.fromJson(json['location']),
      status: StatusResponse.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location.toJson(),
      'status': status.toJson(),
    };
  }
}
