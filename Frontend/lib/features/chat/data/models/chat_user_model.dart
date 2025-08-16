import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_user.dart';

part 'chat_user_model.g.dart';

@JsonSerializable()
class ChatUserModel extends ChatUser {
  const ChatUserModel({
    required super.id,
    @JsonKey(name: 'full_name') required super.fullName,
    required super.email,
    @JsonKey(name: 'user_type') required super.userType,
    @JsonKey(name: 'profile_image') super.profileImage,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return _$ChatUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatUserModelToJson(this);

  factory ChatUserModel.fromEntity(ChatUser entity) {
    return ChatUserModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      userType: entity.userType,
      profileImage: entity.profileImage,
    );
  }

  ChatUser toEntity() {
    return ChatUser(
      id: id,
      fullName: fullName,
      email: email,
      userType: userType,
      profileImage: profileImage,
    );
  }
}
