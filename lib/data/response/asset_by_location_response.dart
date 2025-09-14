class Location {
  final String? id;
  final String? name;

  Location({this.id, this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(id: json['id'] as String?, name: json['name'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class AssetByLocationResponse {
  final Location? location;
  final int? count;

  AssetByLocationResponse({this.location, this.count});

  factory AssetByLocationResponse.fromJson(Map<String, dynamic> json) {
    return AssetByLocationResponse(
      location: json['status'] != null
          ? Location.fromJson(json['status'])
          : null,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': location?.toJson(), 'count': count};
  }
}
