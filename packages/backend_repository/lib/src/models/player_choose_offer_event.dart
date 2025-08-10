import 'package:backend_repository/backend_repository.dart';

class PlayerChooseOfferEvent extends Event {
  const PlayerChooseOfferEvent({
    required this.playerId,
  }) : super(type: EventType.playerChooseOffer);

  final int playerId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'player_id': playerId,
      },
    };
  }
}
