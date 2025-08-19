// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUserModel _$ChatUserModelFromJson(Map<String, dynamic> json) =>
    ChatUserModel(
      id: (json['id'] as num).toInt(),
      fullNameField: json['full_name'] as String,
      email: json['email'] as String,
      userTypeField: json['user_type'] as String,
      profileImageField: json['profile_image'] as String?,
    );

Map<String, dynamic> _$ChatUserModelToJson(ChatUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullNameField,
      'user_type': instance.userTypeField,
      'profile_image': instance.profileImageField,
    };
