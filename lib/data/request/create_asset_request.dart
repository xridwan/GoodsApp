class CreateAssetRequest {
  final String? name;
  final String? statusId;
  final String? locationId;

  CreateAssetRequest({this.name, this.statusId, this.locationId});

  factory CreateAssetRequest.fromJson(Map<String, dynamic> json) {
    return CreateAssetRequest(
      name: json['name'] as String?,
      statusId: json['status_id'] as String?,
      locationId: json['location_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'status_id': statusId, 'location_id': locationId};
  }
}
