import 'package:backend_repository/backend_repository.dart';

class MadeOfferEvent extends Event {
  const MadeOfferEvent({required this.playerIds})
    : super(type: EventType.madeOffer);

  factory MadeOfferEvent.fromJson(Map<String, dynamic> json) {
    return MadeOfferEvent(
      playerIds: (json['player_ids'] as List<num>)
          .map((e) => e.toInt())
          .toList(),
    );
  }

  final List<int> playerIds;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'player_ids': playerIds,
      },
    };
  }
}
