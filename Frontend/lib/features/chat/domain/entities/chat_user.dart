import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String userType; // 'owner' or 'renter'
  final String? profileImage;

  const ChatUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.userType,
    this.profileImage,
  });

  @override
  List<Object?> get props => [id, fullName, email, userType, profileImage];

  ChatUser copyWith({
    int? id,
    String? fullName,
    String? email,
    String? userType,
    String? profileImage,
  }) {
    return ChatUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      userType: userType ?? this.userType,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
