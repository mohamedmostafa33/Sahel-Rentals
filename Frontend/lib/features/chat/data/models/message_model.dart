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

  const MessageModel({
    required super.id,
    required this.senderModel,
    this.chaletModel,
    required super.content,
    @JsonKey(name: 'created_at') required super.createdAt,
    @JsonKey(name: 'is_read') required super.isRead,
  }) : super(
    sender: senderModel,
    chalet: chaletModel,
  );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    print('🔍 MessageModel.fromJson: Raw JSON: $json');
    
    // Check each field individually
    final id = json['id'];
    final sender = json['sender'];
    final chalet = json['chalet'];
    final content = json['content'];
    final createdAt = json['created_at'];
    final isRead = json['is_read'];
    
    print('🔍 Message field values:');
    print('   id: $id (${id.runtimeType})');
    print('   sender: $sender (${sender.runtimeType})');
    print('   chalet: $chalet (${chalet.runtimeType})');
    print('   content: $content (${content.runtimeType})');
    print('   created_at: $createdAt (${createdAt.runtimeType})');
    print('   is_read: $isRead (${isRead.runtimeType})');
    
    try {
      return _$MessageModelFromJson(json);
    } catch (e, stack) {
      print('💥 MessageModel error: $e');
      print('💥 Stack: $stack');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromEntity(Message entity) {
    return MessageModel(
      id: entity.id,
      senderModel: ChatUserModel.fromEntity(entity.sender),
      chaletModel: entity.chalet != null ? ChatChaletModel.fromEntity(entity.chalet!) : null,
      content: entity.content,
      createdAt: entity.createdAt,
      isRead: entity.isRead,
    );
  }

  @override
  Message toEntity() {
    return Message(
      id: id,
      sender: senderModel.toEntity(),
      chalet: chaletModel?.toEntity(),
      content: content,
      createdAt: createdAt,
      isRead: isRead,
    );
  }
}
