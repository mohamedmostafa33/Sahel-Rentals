import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_chalet.dart';

part 'chat_chalet_model.g.dart';

@JsonSerializable()
class ChatChaletModel extends ChatChalet {
  const ChatChaletModel({
    required super.id,
    required super.name,
    required super.location,
    @JsonKey(name: 'price_per_night') required super.pricePerNight,
  });

  factory ChatChaletModel.fromJson(Map<String, dynamic> json) =>
      _$ChatChaletModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatChaletModelToJson(this);

  factory ChatChaletModel.fromEntity(ChatChalet entity) {
    return ChatChaletModel(
      id: entity.id,
      name: entity.name,
      location: entity.location,
      pricePerNight: entity.pricePerNight,
    );
  }

  ChatChalet toEntity() {
    return ChatChalet(
      id: id,
      name: name,
      location: location,
      pricePerNight: pricePerNight,
    );
  }
}
