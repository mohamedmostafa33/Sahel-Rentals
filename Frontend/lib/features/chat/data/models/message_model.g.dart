// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: (json['id'] as num).toInt(),
      senderModel:
          ChatUserModel.fromJson(json['sender'] as Map<String, dynamic>),
      chaletModel: json['chalet'] == null
          ? null
          : ChatChaletModel.fromJson(json['chalet'] as Map<String, dynamic>),
      content: json['content'] as String,
      createdAtField: DateTime.parse(json['created_at'] as String),
      isReadField: json['is_read'] as bool,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sender': instance.senderModel.toJson(),
      'chalet': instance.chaletModel?.toJson(),
      'created_at': instance.createdAtField.toIso8601String(),
      'is_read': instance.isReadField,
    };
