import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/chat_room.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_room_model.dart';
import '../models/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ChatRoom>>> getChatRooms() async {
    try {
      final chatRoomModels = await remoteDataSource.getChatRooms();
      final chatRooms =
          chatRoomModels.map((model) => model.toEntity()).toList();
      return Right(chatRooms);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ChatRoom>> createOrGetChatRoom({
    required int chaletId,
  }) async {
    try {
      final chatRoomModel = await remoteDataSource.createOrGetChatRoom({
        'chalet_id': chaletId,
      });
      return Right(chatRoomModel.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ChatRoom>> createOrGetChatRoomWithOwner({
    required int ownerId,
  }) async {
    try {
      final chatRoomModel = await remoteDataSource.createOrGetChatRoom({
        'owner_id': ownerId,
      });
      return Right(chatRoomModel.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages(int chatRoomId) async {
    try {
      final messageModels = await remoteDataSource.getMessages(chatRoomId);
      final messages = messageModels.map((model) => model.toEntity()).toList();
      return Right(messages);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Message>> sendMessage({
    required int chatRoomId,
    required String content,
    int? chaletId,
  }) async {
    try {
      final body = {
        'content': content,
        if (chaletId != null) 'chalet_id': chaletId,
      };

      final messageModel = await remoteDataSource.sendMessage(chatRoomId, body);
      return Right(messageModel.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(
          'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        switch (statusCode) {
          case 400:
            if (responseData is Map<String, dynamic>) {
              final errorMessage = _extractErrorMessage(responseData);
              return ValidationFailure(errorMessage);
            }
            return ValidationFailure('Invalid request data');

          case 401:
            return AuthFailure('Authentication failed. Please login again.');

          case 403:
            return AuthFailure(
              'You are not authorized to perform this action.',
            );

          case 404:
            return NotFoundFailure('Resource not found');

          case 500:
          default:
            return ServerFailure(
              'Server error occurred. Please try again later.',
            );
        }

      case DioExceptionType.cancel:
        return CancelFailure('Request was cancelled');

      case DioExceptionType.connectionError:
        return NetworkFailure(
          'No internet connection. Please check your network settings.',
        );

      default:
        return ServerFailure('Unexpected error occurred: ${e.message}');
    }
  }

  String _extractErrorMessage(Map<String, dynamic> responseData) {
    if (responseData.containsKey('error')) {
      return responseData['error'].toString();
    }

    if (responseData.containsKey('detail')) {
      return responseData['detail'].toString();
    }

    // Extract validation errors
    final errors = <String>[];
    responseData.forEach((key, value) {
      if (value is List) {
        errors.addAll(value.map((e) => e.toString()));
      } else {
        errors.add(value.toString());
      }
    });

    return errors.isNotEmpty ? errors.join(', ') : 'Validation error occurred';
  }
}
