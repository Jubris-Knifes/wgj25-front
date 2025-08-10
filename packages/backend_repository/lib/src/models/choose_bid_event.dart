import 'package:backend_repository/backend_repository.dart';

class ChooseBidEvent extends Event {
  const ChooseBidEvent({
    required this.playerId,
    required this.timeout,
    required this.canFinishRound,
  }) : super(type: EventType.chooseBid);

  factory ChooseBidEvent.fromJson(Map<String, dynamic> json) {
    return ChooseBidEvent(
      playerId: (json['player_id'] as num).toInt(),
      timeout: (json['timeout'] as num).toInt(),
      canFinishRound: json['can_finish_round'] as bool,
    );
  }

  final int playerId;

  final int timeout;

  final bool canFinishRound;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'player_id': playerId,
        'timeout': timeout,
        'can_finish_round': canFinishRound,
      },
    };
  }
}
