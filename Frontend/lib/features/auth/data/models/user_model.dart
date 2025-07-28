import '../../domain/entities/user.dart';

class UserModel extends User {
  final String? profileImage;
  
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    super.phone,
    required super.createdAt,
    required super.updatedAt,
    required super.accountType,
    this.profileImage,
  });

  // Convenience getter for full name
  String get fullName => '$firstName $lastName';

  // Getters to access inherited properties
  @override
  int get id => super.id;
  
  @override
  String get email => super.email;
  
  @override
  String get firstName => super.firstName;
  
  @override
  String get lastName => super.lastName;
  
  @override
  String? get phone => super.phone;
  
  @override
  String get accountType => super.accountType;
  
  @override
  DateTime get createdAt => super.createdAt;
  
  @override
  DateTime get updatedAt => super.updatedAt;
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      accountType: json['account_type'] as String,
      profileImage: json['profile_image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'account_type': accountType,
      'profile_image': profileImage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // CopyWith method for updating user data
  UserModel copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? accountType,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      accountType: accountType ?? this.accountType,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
