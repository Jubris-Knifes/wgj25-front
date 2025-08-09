import 'package:backend_repository/backend_repository.dart';
import 'package:domain/domain.dart';

class CardsDealtEvent extends Event {
  const CardsDealtEvent({required this.cards})
    : super(type: EventType.cardsDealt);

  final List<Art> cards;

  factory CardsDealtEvent.fromJson(Map<String, dynamic> json) {
    final cards = json['cards'] as List<dynamic>;
    return CardsDealtEvent(
      cards: cards.map((e) => Art.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'cards': cards.map((e) => e.toJson()).toList(),
      },
    };
  }
}
