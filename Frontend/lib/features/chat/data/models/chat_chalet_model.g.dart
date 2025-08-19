// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_chalet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatChaletModel _$ChatChaletModelFromJson(Map<String, dynamic> json) =>
    ChatChaletModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      location: json['location'] as String,
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
    );

Map<String, dynamic> _$ChatChaletModelToJson(ChatChaletModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'pricePerNight': instance.pricePerNight,
    };
