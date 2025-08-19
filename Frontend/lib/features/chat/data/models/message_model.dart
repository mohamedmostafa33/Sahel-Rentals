import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/message.dart';
import 'chat_user_model.dart';
import 'chat_chalet_model.dart';

part 'message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageModel extends Message {
  @JsonKey(name: 'sender')
  final ChatUserModel senderModel;
  
  @JsonKey(name: 'chalet')
  final ChatChaletModel? chaletModel;

  @JsonKey(name: 'created_at')
  final DateTime createdAtField;

  @JsonKey(name: 'is_read')
  final bool isReadField;

  const MessageModel({
    required super.id,
    required this.senderModel,
    this.chaletModel,
    required super.content,
    required this.createdAtField,
    required this.isReadField,
  }) : super(
    sender: senderModel,
    chalet: chaletModel,
    createdAt: createdAtField,
    isRead: isReadField,
  );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return _$MessageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromEntity(Message entity) {
    return MessageModel(
      id: entity.id,
      senderModel: ChatUserModel.fromEntity(entity.sender),
      chaletModel: entity.chalet != null ? ChatChaletModel.fromEntity(entity.chalet!) : null,
      content: entity.content,
      createdAtField: entity.createdAt,
      isReadField: entity.isRead,
    );
  }

  @override
  Message toEntity() {
    return Message(
      id: id,
      sender: senderModel.toEntity(),
      chalet: chaletModel?.toEntity(),
      content: content,
      createdAt: createdAtField,
      isRead: isReadField,
    );
  }
}
