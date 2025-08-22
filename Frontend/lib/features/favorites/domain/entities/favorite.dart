import 'package:equatable/equatable.dart';
import '../../../chalets/domain/entities/public_chalet.dart';

class Favorite extends Equatable {
  final int id; // Favorite id returned by backend
  final PublicChalet chalet;

  const Favorite({required this.id, required this.chalet});

  @override
  List<Object?> get props => [id, chalet];
}
