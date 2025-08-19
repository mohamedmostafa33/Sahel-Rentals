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
      pricePerNightField: (json['price_per_night'] as num).toDouble(),
    );

Map<String, dynamic> _$ChatChaletModelToJson(ChatChaletModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'price_per_night': instance.pricePerNightField,
    };
