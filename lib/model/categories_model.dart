class CategoryResponse {
  final List<Category> categories;
  final Pagination pagination;

  CategoryResponse({
    required this.categories,
    required this.pagination,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    categories: List<Category>.from(json['categories'].map((x) => Category.fromJson(x))),
    pagination: Pagination.fromJson(json['pagination']),
  );

  Map<String, dynamic> toJson() => {
    'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
    'pagination': pagination.toJson(),
  };
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
    slug: json['slug'],
    icon: json['icon'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'icon': icon,
    'image': image,
  };
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int lastPage;
  final String? nextPageUrl;
  final String? prevPageUrl;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json['total'],
    count: json['count'],
    perPage: json['per_page'],
    currentPage: json['current_page'],
    lastPage: json['last_page'],
    nextPageUrl: json['next_page_url'],
    prevPageUrl: json['prev_page_url'],
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'count': count,
    'per_page': perPage,
    'current_page': currentPage,
    'last_page': lastPage,
    'next_page_url': nextPageUrl,
    'prev_page_url': prevPageUrl,
  };
}
