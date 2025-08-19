import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_chalet.dart';

part 'chat_chalet_model.g.dart';

@JsonSerializable()
class ChatChaletModel extends ChatChalet {
  @JsonKey(name: 'price_per_night')
  final double pricePerNightField;

  const ChatChaletModel({
    required super.id,
    required super.name,
    required super.location,
    required this.pricePerNightField,
  }) : super(pricePerNight: pricePerNightField);

  factory ChatChaletModel.fromJson(Map<String, dynamic> json) {
    // Handle the case where price_per_night comes as String
    if (json['price_per_night'] is String) {
      json = Map<String, dynamic>.from(json);
      json['price_per_night'] = double.parse(json['price_per_night']);
    }
    return _$ChatChaletModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatChaletModelToJson(this);

  factory ChatChaletModel.fromEntity(ChatChalet entity) {
    return ChatChaletModel(
      id: entity.id,
      name: entity.name,
      location: entity.location,
      pricePerNightField: entity.pricePerNight,
    );
  }

  ChatChalet toEntity() {
    return ChatChalet(
      id: id,
      name: name,
      location: location,
      pricePerNight: pricePerNightField,
    );
  }
}
