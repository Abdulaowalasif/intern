class SliderResponse {
  final List<SliderItem> sliders;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  SliderResponse({
    required this.sliders,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    sliders: List<SliderItem>.from(json['sliders'].map((x) => SliderItem.fromJson(x))),
    currentPage: json['current_page'],
    totalPages: json['total_pages'],
    totalItems: json['total_items'],
  );

  Map<String, dynamic> toJson() => {
    'sliders': List<dynamic>.from(sliders.map((x) => x.toJson())),
    'current_page': currentPage,
    'total_pages': totalPages,
    'total_items': totalItems,
  };
}

class SliderItem {
  final int id;
  final int identity;
  final String type;
  final int status;
  final String image;

  SliderItem({
    required this.id,
    required this.identity,
    required this.type,
    required this.status,
    required this.image,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json['id'],
    identity: json['identity'],
    type: json['type'],
    status: json['status'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'identity': identity,
    'type': type,
    'status': status,
    'image': image,
  };
}
