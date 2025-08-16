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

  const ChatRoomModel({
    required super.id,
    required this.renterModel,
    required this.ownerModel,
    this.lastChaletModel,
    @JsonKey(name: 'created_at') required super.createdAt,
    @JsonKey(name: 'updated_at') required super.updatedAt,
    this.lastMessageModel,
    @JsonKey(name: 'unread_count') required super.unreadCount,
  }) : super(
         renter: renterModel,
         owner: ownerModel,
         lastChalet: lastChaletModel,
         lastMessage: lastMessageModel,
       );

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

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
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      lastMessageModel:
          entity.lastMessage != null
              ? MessageModel.fromEntity(entity.lastMessage!)
              : null,
      unreadCount: entity.unreadCount,
    );
  }

  @override
  ChatRoom toEntity() {
    return ChatRoom(
      id: id,
      renter: renterModel.toEntity(),
      owner: ownerModel.toEntity(),
      lastChalet: lastChaletModel?.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastMessage: lastMessageModel?.toEntity(),
      unreadCount: unreadCount,
    );
  }
}
