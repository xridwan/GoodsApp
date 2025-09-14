class CreateAssetResponse {
  final String id;
  final String name;
  final String statusId;
  final String locationId;

  CreateAssetResponse({
    required this.id,
    required this.name,
    required this.statusId,
    required this.locationId,
  });

  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      statusId: json['status_id'] as String,
      locationId: json['location_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status_id': statusId,
      'location_id': locationId,
    };
  }
}
