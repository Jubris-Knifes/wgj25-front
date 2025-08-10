import 'package:backend_repository/backend_repository.dart';

class SelectOfferChosenEvent extends Event {
  const SelectOfferChosenEvent({
    required this.playerId,
    required this.timeout,
  }) : super(type: EventType.selectOfferChosen);

  factory SelectOfferChosenEvent.fromJson(Map<String, dynamic> json) {
    return SelectOfferChosenEvent(
      playerId: (json['player_id'] as num).toInt(),
      timeout: (json['timeout'] as num).toInt(),
    );
  }

  final int playerId;

  final int timeout;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'player_id': playerId,
        'timeout': timeout,
      },
    };
  }
}
