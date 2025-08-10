import 'package:backend_repository/backend_repository.dart';

class PrepareForNextTurnEvent extends Event {
  const PrepareForNextTurnEvent({
    required this.timeout,
    required this.nextBidder,
  }) : super(type: EventType.prepareForNextTurn);

  factory PrepareForNextTurnEvent.fromJson(Map<String, dynamic> json) {
    final timeout = json['timeout'] as num;
    final nextBidder = json['next_bidder'] as num;
    return PrepareForNextTurnEvent(
      timeout: timeout.toInt(),
      nextBidder: nextBidder.toInt(),
    );
  }

  final int timeout;

  final int nextBidder;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'timeout': timeout,
        'next_bidder': nextBidder,
      },
    };
  }
}
