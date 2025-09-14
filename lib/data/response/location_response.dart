class LocationResponse {
  final String id;
  final String? name;

  LocationResponse({required this.id, required this.name});

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
