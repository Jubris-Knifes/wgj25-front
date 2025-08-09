import 'package:domain/domain.dart';

class Player {
  Player({
    required this.id,
    required this.name,
    required this.score,
    required this.cards,
  });

  final String id;
  final String name;
  final int score;
  final List<Art> cards;
}
