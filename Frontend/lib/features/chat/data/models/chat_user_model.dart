import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_user.dart';

part 'chat_user_model.g.dart';

@JsonSerializable()
class ChatUserModel extends ChatUser {
  @JsonKey(name: 'full_name')
  final String fullNameField;
  
  @JsonKey(name: 'user_type')
  final String userTypeField;
  
  @JsonKey(name: 'profile_image')
  final String? profileImageField;

  const ChatUserModel({
    required super.id,
    required this.fullNameField,
    required super.email,
    required this.userTypeField,
    this.profileImageField,
  }) : super(
         fullName: fullNameField,
         userType: userTypeField,
         profileImage: profileImageField,
       );

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return _$ChatUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatUserModelToJson(this);

  factory ChatUserModel.fromEntity(ChatUser entity) {
    return ChatUserModel(
      id: entity.id,
      fullNameField: entity.fullName,
      email: entity.email,
      userTypeField: entity.userType,
      profileImageField: entity.profileImage,
    );
  }

  ChatUser toEntity() {
    return ChatUser(
      id: id,
      fullName: fullNameField,
      email: email,
      userType: userTypeField,
      profileImage: profileImageField,
    );
  }
}
