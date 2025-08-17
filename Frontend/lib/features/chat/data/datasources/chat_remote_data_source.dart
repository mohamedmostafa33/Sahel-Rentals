import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/chat_room_model.dart';
import '../models/message_model.dart';

part 'chat_remote_data_source.g.dart';

@RestApi()
abstract class ChatRemoteDataSource {
  factory ChatRemoteDataSource(Dio dio, {String? baseUrl}) =
      _ChatRemoteDataSource;

  @GET('/api/messaging/chat-rooms/')
  Future<List<ChatRoomModel>> getChatRooms();

  @POST('/api/messaging/chat-rooms/')
  Future<ChatRoomModel> createOrGetChatRoom(@Body() Map<String, dynamic> body);

  @GET('/api/messaging/chat-rooms/{id}/messages/')
  Future<List<MessageModel>> getMessages(@Path('id') int chatRoomId);

  @POST('/api/messaging/chat-rooms/{id}/send_message/')
  Future<MessageModel> sendMessage(
    @Path('id') int chatRoomId,
    @Body() Map<String, dynamic> body,
  );
}
