class UserResponseModel {
  final int code;
  final Meta meta;
  final List<User> data;

  UserResponseModel({
    required this.code,
    required this.meta,
    required this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      code: json['code'],
      meta: Meta.fromJson(json['meta']),
      data: List<User>.from(json['data'].map((x) => User.fromJson(x))),
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination {
  final int total;
  final int pages;
  final int page;
  final int limit;

  Pagination({
    required this.total,
    required this.pages,
    required this.page,
    required this.limit,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      pages: json['pages'],
      page: json['page'],
      limit: json['limit'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      status: json['status'],
    );
  }
}
