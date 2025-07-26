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

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.phone,
    required this.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'],
      accountType: json['user_type'] ?? '', // Changed from account_type to user_type
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'account_type': accountType,
    };
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

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
