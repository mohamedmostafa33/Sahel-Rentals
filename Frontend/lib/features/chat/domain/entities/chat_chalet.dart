import 'package:equatable/equatable.dart';

class ChatChalet extends Equatable {
  final int id;
  final String name;
  final String location;
  final double pricePerNight;

  const ChatChalet({
    required this.id,
    required this.name,
    required this.location,
    required this.pricePerNight,
  });

  @override
  List<Object?> get props => [id, name, location, pricePerNight];

  ChatChalet copyWith({
    int? id,
    String? name,
    String? location,
    double? pricePerNight,
  }) {
    return ChatChalet(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      pricePerNight: pricePerNight ?? this.pricePerNight,
    );
  }
}
