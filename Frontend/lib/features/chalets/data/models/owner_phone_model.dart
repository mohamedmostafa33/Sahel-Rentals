import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/owner_phone.dart';

part 'owner_phone_model.g.dart';

@JsonSerializable()
class OwnerPhoneModel extends OwnerPhone {
  const OwnerPhoneModel({
    super.phone,
  });

  factory OwnerPhoneModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerPhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerPhoneModelToJson(this);

  factory OwnerPhoneModel.fromEntity(OwnerPhone entity) {
    return OwnerPhoneModel(
      phone: entity.phone,
    );
  }

  OwnerPhone toEntity() {
    return OwnerPhone(
      phone: phone,
    );
  }
}
