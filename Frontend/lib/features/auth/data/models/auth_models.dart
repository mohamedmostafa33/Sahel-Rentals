class AuthResponse {
  final String message;
  final UserModel user;
  final String accessToken;
  final String refreshToken;

  AuthResponse({
    required this.message,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] ?? '',
      user: UserModel.fromJson(json['user']),
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
    );
  }
}

class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String? phone;
  final String accountType;
  final String? profileImageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.phone,
    required this.accountType,
    this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'],
      accountType: json['user_type'] ?? json['account_type'] ?? '', // Check both fields
      profileImageUrl: json['profile_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'account_type': accountType,
      'profile_image_url': profileImageUrl,
    };
  }

  // إضافة copyWith method لتحديث البيانات
  UserModel copyWith({
    int? id,
    String? email,
    String? fullName,
    String? phone,
    String? accountType,
    String? profileImageUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      accountType: accountType ?? this.accountType,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}

class RegisterRequest {
  final String email;
  final String fullName;
  final String? phone;
  final String userType;
  final String password1;
  final String password2;

  RegisterRequest({
    required this.email,
    required this.fullName,
    this.phone,
    required this.userType,
    required this.password1,
    required this.password2,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'user_type': userType,
      'password1': password1,
      'password2': password2,
    };
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
