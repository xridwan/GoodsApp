class Status {
  final String? id;
  final String? name;

  Status({this.id, this.name});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(id: json['id'] as String?, name: json['name'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class AssetByStatusResponse {
  final Status? status;
  final int? count;

  AssetByStatusResponse({this.status, this.count});

  factory AssetByStatusResponse.fromJson(Map<String, dynamic> json) {
    return AssetByStatusResponse(
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status?.toJson(), 'count': count};
  }
}
