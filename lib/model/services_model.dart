class ServiceResponse {
  final List<Service> allServices;
  final Pagination pagination;

  ServiceResponse({
    required this.allServices,
    required this.pagination,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) => ServiceResponse(
    allServices: List<Service>.from(
        json['all_services'].map((x) => Service.fromJson(x))),
    pagination: Pagination.fromJson(json['pagination']),
  );

  Map<String, dynamic> toJson() => {
    'all_services': List<dynamic>.from(allServices.map((x) => x.toJson())),
    'pagination': pagination.toJson(),
  };
}

class Service {
  final int id;
  final Category category;
  final SubCategory? subCategory;
  final dynamic childCategory; // null in data, can be adjusted if needed
  final String title;
  final String slug;
  final String? unit;
  final int price;
  final int discountPrice;
  final int isFeatured;
  final String image;
  final int view;
  final int soldCount;
  final int status;
  final int isPublished;
  final int allocateStaff;
  final DateTime createdAt;
  final int totalReviews;
  final String averageRating;
  final Provider? provider;
  final Admin? admin;
  final List<Staff>? staffs;

  Service({
    required this.id,
    required this.category,
    this.subCategory,
    this.childCategory,
    required this.title,
    required this.slug,
    this.unit,
    required this.price,
    required this.discountPrice,
    required this.isFeatured,
    required this.image,
    required this.view,
    required this.soldCount,
    required this.status,
    required this.isPublished,
    required this.allocateStaff,
    required this.createdAt,
    required this.totalReviews,
    required this.averageRating,
    this.provider,
    this.admin,
    this.staffs,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json['id'],
    category: Category.fromJson(json['category']),
    subCategory: (json['sub_category'] != null && json['sub_category'] is Map<String, dynamic>)
        ? SubCategory.fromJson(json['sub_category'])
        : null,
    childCategory: json['child_category'],
    title: json['title'],
    slug: json['slug'],
    unit: json['unit'],
    price: json['price'],
    discountPrice: json['discount_price'],
    isFeatured: json['is_featured'],
    image: json['image'],
    view: json['view'],
    soldCount: json['sold_count'],
    status: json['status'],
    isPublished: json['is_published'],
    allocateStaff: json['allocate_staff'],
    createdAt: DateTime.parse(json['created_at']),
    totalReviews: json['total_reviews'],
    averageRating: json['average_rating'],
    provider: (json['provider'] != null && json['provider'] is Map<String, dynamic>)
        ? Provider.fromJson(json['provider'])
        : null,
    admin: (json['admin'] != null && json['admin'] is Map<String, dynamic>)
        ? Admin.fromJson(json['admin'])
        : null,
    staffs: (json['staffs'] != null && json['staffs'] is List)
        ? List<Staff>.from(json['staffs'].map((x) => Staff.fromJson(x)))
        : null,
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category.toJson(),
    'sub_category': subCategory?.toJson(),
    'child_category': childCategory,
    'title': title,
    'slug': slug,
    'unit': unit,
    'price': price,
    'discount_price': discountPrice,
    'is_featured': isFeatured,
    'image': image,
    'view': view,
    'sold_count': soldCount,
    'status': status,
    'is_published': isPublished,
    'allocate_staff': allocateStaff,
    'created_at': createdAt.toIso8601String(),
    'total_reviews': totalReviews,
    'average_rating': averageRating,
    'provider': provider?.toJson(),
    'admin': admin?.toJson(),
    'staffs': staffs != null ? List<dynamic>.from(staffs!.map((x) => x.toJson())) : null,
  };
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

class SubCategory {
  final int id;
  final String name;

  SubCategory({
    required this.id,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

class Provider {
  final int id;
  final String fullName;
  final String image;
  final int reviewCount;
  final String averageRating;
  final double orderCompletionRate;
  final int customerSatisfactionRate;
  final int verifiedStatus;
  final DateTime lastSeen;
  final DateTime createdAt;
  final String longitude;
  final String latitude;

  Provider({
    required this.id,
    required this.fullName,
    required this.image,
    required this.reviewCount,
    required this.averageRating,
    required this.orderCompletionRate,
    required this.customerSatisfactionRate,
    required this.verifiedStatus,
    required this.lastSeen,
    required this.createdAt,
    required this.longitude,
    required this.latitude,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json['id'],
    fullName: json['full_name'],
    image: json['image'],
    reviewCount: json['review_count'],
    averageRating: json['average_rating'],
    orderCompletionRate: (json['order_completion_rate'] as num).toDouble(),
    customerSatisfactionRate: json['customer_satisfaction_rate'],
    verifiedStatus: json['verified_status'],
    lastSeen: DateTime.parse(json['last_seen']),
    createdAt: DateTime.parse(json['created_at']),
    longitude: json['longitude'],
    latitude: json['latitude'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'image': image,
    'review_count': reviewCount,
    'average_rating': averageRating,
    'order_completion_rate': orderCompletionRate,
    'customer_satisfaction_rate': customerSatisfactionRate,
    'verified_status': verifiedStatus,
    'last_seen': lastSeen.toIso8601String(),
    'created_at': createdAt.toIso8601String(),
    'longitude': longitude,
    'latitude': latitude,
  };
}

class Admin {
  final int id;
  final String name;
  final String email;
  final String image;
  final ServiceLocation serviceLocation;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.serviceLocation,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    image: json['image'],
    serviceLocation: ServiceLocation.fromJson(json['service_location']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'image': image,
    'service_location': serviceLocation.toJson(),
  };
}

class ServiceLocation {
  final int id;
  final int adminId;
  final int stateId;
  final int cityId;
  final int areaId;
  final String address;
  final String postCode;
  final String latitude;
  final String longitude;

  ServiceLocation({
    required this.id,
    required this.adminId,
    required this.stateId,
    required this.cityId,
    required this.areaId,
    required this.address,
    required this.postCode,
    required this.latitude,
    required this.longitude,
  });

  factory ServiceLocation.fromJson(Map<String, dynamic> json) => ServiceLocation(
    id: json['id'],
    adminId: json['admin_id'],
    stateId: json['state_id'],
    cityId: json['city_id'],
    areaId: json['area_id'],
    address: json['address'],
    postCode: json['post_code'],
    latitude: json['latitude'],
    longitude: json['longitude'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'admin_id': adminId,
    'state_id': stateId,
    'city_id': cityId,
    'area_id': areaId,
    'address': address,
    'post_code': postCode,
    'latitude': latitude,
    'longitude': longitude,
  };
}

class Staff {
  final int id;
  final dynamic providerId; // null in data, keep dynamic or int?
  final int adminId;
  final String fullname;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String about;
  final int status;
  final String? image;

  Staff({
    required this.id,
    this.providerId,
    required this.adminId,
    required this.fullname,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.about,
    required this.status,
    this.image,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    id: json['id'],
    providerId: json['provider_id'],
    adminId: json['admin_id'],
    fullname: json['fullname'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    phone: json['phone'],
    about: json['about'],
    status: json['status'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'provider_id': providerId,
    'admin_id': adminId,
    'fullname': fullname,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'about': about,
    'status': status,
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
