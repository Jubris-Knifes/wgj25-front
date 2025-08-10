import 'package:backend_repository/backend_repository.dart';

class EndOfRoundEvent extends Event {
  const EndOfRoundEvent({required this.timeout})
    : super(type: EventType.endOfRound);

  factory EndOfRoundEvent.fromJson(Map<String, dynamic> json) {
    final timeout = json['timeout'] as num;
    return EndOfRoundEvent(timeout: timeout.toInt());
  }

  final int timeout;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'timeout': timeout,
      },
    };
  }
}
