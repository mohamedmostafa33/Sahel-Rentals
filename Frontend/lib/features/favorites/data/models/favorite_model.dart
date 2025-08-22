import '../../../chalets/data/models/chalet_models.dart';

class FavoriteModel {
  final int id;
  final PublicChaletModel chalet;
  final DateTime createdAt;

  FavoriteModel({required this.id, required this.chalet, required this.createdAt});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] as int,
      chalet: PublicChaletModel.fromJson(json['chalet'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
