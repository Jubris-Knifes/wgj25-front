import 'package:backend_repository/backend_repository.dart';
import 'package:domain/domain.dart';

class OfferSelectedEvent extends Event {
  const OfferSelectedEvent({
    required this.card,
  }) : super(type: EventType.offerSelected);

  factory OfferSelectedEvent.fromJson(Map<String, dynamic> json) {
    return OfferSelectedEvent(
      card: Art.fromJson(json['card'] as Map<String, dynamic>),
    );
  }

  final Art card;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'card': card.toJson(),
      },
    };
  }
}
