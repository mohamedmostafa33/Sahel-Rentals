// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      id: (json['id'] as num).toInt(),
      renterModel:
          ChatUserModel.fromJson(json['renter'] as Map<String, dynamic>),
      ownerModel: ChatUserModel.fromJson(json['owner'] as Map<String, dynamic>),
      lastChaletModel: json['last_chalet'] == null
          ? null
          : ChatChaletModel.fromJson(
              json['last_chalet'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastMessageModel: json['last_message'] == null
          ? null
          : MessageModel.fromJson(json['last_message'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num).toInt(),
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'renter': instance.renterModel.toJson(),
      'owner': instance.ownerModel.toJson(),
      'last_chalet': instance.lastChaletModel?.toJson(),
      'last_message': instance.lastMessageModel?.toJson(),
    };
