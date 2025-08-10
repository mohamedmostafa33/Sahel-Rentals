import 'package:equatable/equatable.dart';

class ChaletImage extends Equatable {
  final int id;
  final String image;
  final bool isMain;
  final String? caption;
  final int order;
  final DateTime createdAt;

  const ChaletImage({
    required this.id,
    required this.image,
    required this.isMain,
    this.caption,
    required this.order,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, image, isMain, caption, order, createdAt];

  ChaletImage copyWith({
    int? id,
    String? image,
    bool? isMain,
    String? caption,
    int? order,
    DateTime? createdAt,
  }) {
    return ChaletImage(
      id: id ?? this.id,
      image: image ?? this.image,
      isMain: isMain ?? this.isMain,
      caption: caption ?? this.caption,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
