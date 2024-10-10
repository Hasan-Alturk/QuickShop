import 'package:equatable/equatable.dart';

class UserResopnse extends Equatable {
  final bool status;
  final String message;
  final User data;

  const UserResopnse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResopnse.fromJson(Map<String, dynamic> json) {
    return UserResopnse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: User.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }

  @override
  List<Object?> get props {
    return [
      status,
      message,
      data,
    ];
  }
}

class User extends Equatable {
  final int id;
  final String name;
  final dynamic email;
  final dynamic phone;
  final dynamic emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final dynamic googleId;
  final dynamic facebookId;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.googleId,
    required this.facebookId,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as dynamic,
      phone: json['phone'] as dynamic,
      emailVerifiedAt: json['email_verified_at'] as dynamic,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      googleId: json['google_id'] as dynamic,
      facebookId: json['facebook_id'] as dynamic,
      token: json['token'] as String,
    );
  }

  // دالة toJson لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'google_id': googleId,
      'facebook_id': facebookId,
      'token': token
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      googleId,
      facebookId,
      token
    ];
  }
}
