class ProviderListResponse {
  final List<Provider> providerLists;
  final Pagination pagination;

  ProviderListResponse({
    required this.providerLists,
    required this.pagination,
  });

  factory ProviderListResponse.fromJson(Map<String, dynamic> json) {
    return ProviderListResponse(
      providerLists: json['provider_lists'] != null
          ? List<Provider>.from(
          json['provider_lists'].map((x) => Provider.fromJson(x)))
          : [],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : Pagination.empty(), // Provide a default empty pagination
    );
  }

  Map<String, dynamic> toJson() => {
    'provider_lists': providerLists.map((x) => x.toJson()).toList(),
    'pagination': pagination.toJson(),
  };
}

class Provider {
  final int id;
  final String fullName;
  final String? image;
  final int totalServiceOrderCompleted;
  final int totalJobOrderCompleted;
  final int reviewCount;
  final String averageRating;
  final double orderCompletionRate;
  final int customerSatisfactionRate;
  final int verifiedStatus;
  final DateTime lastSeen;
  final String? about;
  final List<String> storeImages;
  final String? videoUrl;
  final DateTime createdAt;
  final List<ServiceCategory> serviceCategories;
  final ProviderServiceArea? providerServiceArea;

  Provider({
    required this.id,
    required this.fullName,
    this.image,
    required this.totalServiceOrderCompleted,
    required this.totalJobOrderCompleted,
    required this.reviewCount,
    required this.averageRating,
    required this.orderCompletionRate,
    required this.customerSatisfactionRate,
    required this.verifiedStatus,
    required this.lastSeen,
    this.about,
    required this.storeImages,
    this.videoUrl,
    required this.createdAt,
    required this.serviceCategories,
    this.providerServiceArea,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    // Helper to convert dynamic int/string fields safely to int
    int parseInt(dynamic val) {
      if (val == null) return 0;
      if (val is int) return val;
      if (val is String) return int.tryParse(val) ?? 0;
      return 0;
    }

    double parseDouble(dynamic val) {
      if (val == null) return 0.0;
      if (val is double) return val;
      if (val is int) return val.toDouble();
      if (val is String) return double.tryParse(val) ?? 0.0;
      return 0.0;
    }

    return Provider(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      image: json['image'],
      totalServiceOrderCompleted: parseInt(json['total_service_order_completed']),
      totalJobOrderCompleted: parseInt(json['total_job_order_completed']),
      reviewCount: parseInt(json['review_count']),
      averageRating: json['average_rating']?.toString() ?? '0',
      orderCompletionRate: parseDouble(json['order_completion_rate']),
      customerSatisfactionRate: parseInt(json['customer_satisfaction_rate']),
      verifiedStatus: parseInt(json['verified_status']),
      lastSeen: DateTime.tryParse(json['last_seen'] ?? '') ?? DateTime.now(),
      about: json['about'],
      storeImages: json['store_images'] != null
          ? List<String>.from(json['store_images'].whereType<String>())
          : [],
      videoUrl: json['video_url'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      serviceCategories: json['service_categories'] != null
          ? List<ServiceCategory>.from(
          json['service_categories'].map((x) => ServiceCategory.fromJson(x)))
          : [],
      providerServiceArea: json['provider_service_area'] != null
          ? ProviderServiceArea.fromJson(json['provider_service_area'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'image': image,
    'total_service_order_completed': totalServiceOrderCompleted,
    'total_job_order_completed': totalJobOrderCompleted,
    'review_count': reviewCount,
    'average_rating': averageRating,
    'order_completion_rate': orderCompletionRate,
    'customer_satisfaction_rate': customerSatisfactionRate,
    'verified_status': verifiedStatus,
    'last_seen': lastSeen.toIso8601String(),
    'about': about,
    'store_images': storeImages,
    'video_url': videoUrl,
    'created_at': createdAt.toIso8601String(),
    'service_categories': serviceCategories.map((x) => x.toJson()).toList(),
    'provider_service_area': providerServiceArea?.toJson(),
  };
}

class ServiceCategory {
  final int id;
  final String name;
  final String image;

  ServiceCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    image: json['image'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
  };
}

class ProviderServiceArea {
  final int id;
  final int userId;
  final int stateId;
  final int cityId;
  final int areaId;
  final String stateName;
  final String cityName;
  final String areaName;
  final String postCode;
  final String address;
  final String? longitude;
  final String? latitude;

  ProviderServiceArea({
    required this.id,
    required this.userId,
    required this.stateId,
    required this.cityId,
    required this.areaId,
    required this.stateName,
    required this.cityName,
    required this.areaName,
    required this.postCode,
    required this.address,
    this.longitude,
    this.latitude,
  });

  factory ProviderServiceArea.fromJson(Map<String, dynamic> json) =>
      ProviderServiceArea(
        id: json['id'] ?? 0,
        userId: json['user_id'] ?? 0,
        stateId: json['state_id'] ?? 0,
        cityId: json['city_id'] ?? 0,
        areaId: json['area_id'] ?? 0,
        stateName: json['state_name'] ?? '',
        cityName: json['city_name'] ?? '',
        areaName: json['area_name'] ?? '',
        postCode: json['post_code'] ?? '',
        address: json['address'] ?? '',
        longitude: json['longitude'],
        latitude: json['latitude'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'state_id': stateId,
    'city_id': cityId,
    'area_id': areaId,
    'state_name': stateName,
    'city_name': cityName,
    'area_name': areaName,
    'post_code': postCode,
    'address': address,
    'longitude': longitude,
    'latitude': latitude,
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
    total: json['total'] ?? 0,
    count: json['count'] ?? 0,
    perPage: json['per_page'] ?? 0,
    currentPage: json['current_page'] ?? 0,
    lastPage: json['last_page'] ?? 0,
    nextPageUrl: json['next_page_url'],
    prevPageUrl: json['prev_page_url'],
  );

  // Provide a default empty Pagination for safe fallback
  factory Pagination.empty() => Pagination(
    total: 0,
    count: 0,
    perPage: 0,
    currentPage: 0,
    lastPage: 0,
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
