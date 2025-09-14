class AssetListResponse {
  final int count;
  final int pageCount;
  final int pageSize;
  final int page;
  final List<AssetItem> results;

  AssetListResponse({
    required this.count,
    required this.pageCount,
    required this.pageSize,
    required this.page,
    required this.results,
  });

  factory AssetListResponse.fromJson(Map<String, dynamic> json) {
    return AssetListResponse(
      count: json['count'],
      pageCount: json['page_count'],
      pageSize: json['page_size'],
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((e) => AssetItem.fromJson(e))
          .toList(),
    );
  }
}

class AssetItem {
  final String id;
  final String name;

  AssetItem({required this.id, required this.name});

  factory AssetItem.fromJson(Map<String, dynamic> json) {
    return AssetItem(
      id: json['id'],
      name: json['name'],
    );
  }
}