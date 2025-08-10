import 'package:backend_repository/backend_repository.dart';
import 'package:domain/domain.dart';

class BidSelectedEvent extends Event {
  const BidSelectedEvent({
    required this.card,
    this.isRoundOver = false,
  }) : super(type: EventType.bidSelected);

  factory BidSelectedEvent.fromJson(Map<String, dynamic> json) {
    final cardMap = json['card'] as Map<String, dynamic>?;

    final card = cardMap != null ? Art.fromJson(cardMap) : null;
    return BidSelectedEvent(
      card: card,
      isRoundOver: json['is_round_over'] as bool,
    );
  }

  final Art? card;

  final bool isRoundOver;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'card': card?.toJson(),
        'is_round_over': isRoundOver,
      },
    };
  }
}
