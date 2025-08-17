import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String fullName;
  final String? phone;
  final String accountType;
  final String? profileImage;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    this.phone,
    required this.accountType,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    fullName,
    phone,
    accountType,
    profileImage,
  ];

  User copyWith({
    int? id,
    String? email,
    String? fullName,
    String? phone,
    String? accountType,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      accountType: accountType ?? this.accountType,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
