import 'package:equatable/equatable.dart';

class OwnerPhone extends Equatable {
  final String? phone;

  const OwnerPhone({
    this.phone,
  });

  @override
  List<Object?> get props => [phone];

  OwnerPhone copyWith({
    String? phone,
  }) {
    return OwnerPhone(
      phone: phone ?? this.phone,
    );
  }

  bool get hasPhone => phone != null && phone!.isNotEmpty;
}
