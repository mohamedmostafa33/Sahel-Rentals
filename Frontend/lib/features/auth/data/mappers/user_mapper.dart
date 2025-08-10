import '../models/auth_models.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User toEntity(UserModel model) {
    return User(
      id: model.id,
      email: model.email,
      fullName: model.fullName,
      phone: model.phone,
      accountType: model.accountType,
      profileImage: model.profileImageUrl,
    );
  }

  static UserModel toModel(User entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      phone: entity.phone,
      accountType: entity.accountType,
      profileImageUrl: entity.profileImage,
    );
  }
}
