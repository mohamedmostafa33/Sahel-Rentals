import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/chat_room.dart';
import 'chat_user_model.dart';
import 'chat_chalet_model.dart';
import 'message_model.dart';

part 'chat_room_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatRoomModel extends ChatRoom {
  @JsonKey(name: 'renter')
  final ChatUserModel renterModel;

  @JsonKey(name: 'owner')
  final ChatUserModel ownerModel;

  @JsonKey(name: 'last_chalet')
  final ChatChaletModel? lastChaletModel;

  @JsonKey(name: 'last_message')
  final MessageModel? lastMessageModel;

  @JsonKey(name: 'created_at')
  final DateTime createdAtField;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAtField;

  @JsonKey(name: 'unread_count')
  final int unreadCountField;

  const ChatRoomModel({
    required super.id,
    required this.renterModel,
    required this.ownerModel,
    this.lastChaletModel,
    required this.createdAtField,
    required this.updatedAtField,
    this.lastMessageModel,
    required this.unreadCountField,
  }) : super(
         renter: renterModel,
         owner: ownerModel,
         lastChalet: lastChaletModel,
         lastMessage: lastMessageModel,
         createdAt: createdAtField,
         updatedAt: updatedAtField,
         unreadCount: unreadCountField,
       );

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return _$ChatRoomModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatRoomModelToJson(this);

  factory ChatRoomModel.fromEntity(ChatRoom entity) {
    return ChatRoomModel(
      id: entity.id,
      renterModel: ChatUserModel.fromEntity(entity.renter),
      ownerModel: ChatUserModel.fromEntity(entity.owner),
      lastChaletModel:
          entity.lastChalet != null
              ? ChatChaletModel.fromEntity(entity.lastChalet!)
              : null,
      createdAtField: entity.createdAt,
      updatedAtField: entity.updatedAt,
      lastMessageModel:
          entity.lastMessage != null
              ? MessageModel.fromEntity(entity.lastMessage!)
              : null,
      unreadCountField: entity.unreadCount,
    );
  }

  @override
  ChatRoom toEntity() {
    return ChatRoom(
      id: id,
      renter: renterModel.toEntity(),
      owner: ownerModel.toEntity(),
      lastChalet: lastChaletModel?.toEntity(),
      createdAt: createdAtField,
      updatedAt: updatedAtField,
      lastMessage: lastMessageModel?.toEntity(),
      unreadCount: unreadCountField,
    );
  }
}
