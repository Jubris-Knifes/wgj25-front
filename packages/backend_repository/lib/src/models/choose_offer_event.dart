import 'package:backend_repository/backend_repository.dart';

class ChooseOfferEvent extends Event {
  const ChooseOfferEvent({
    required this.playerIds,
    required this.timeout,
  }) : super(type: EventType.chooseOffer);

  factory ChooseOfferEvent.fromJson(Map<String, dynamic> json) {
    return ChooseOfferEvent(
      playerIds: (json['player_ids'] as List<num>)
          .map((e) => e.toInt())
          .toList(),
      timeout: json['timeout'] as int,
    );
  }

  final List<int> playerIds;

  final int timeout;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'player_ids': playerIds,
        'timeout': timeout,
      },
    };
  }
}
