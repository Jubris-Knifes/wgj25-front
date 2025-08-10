import 'package:backend_repository/backend_repository.dart';

class ShowBackOfCardBidEvent extends Event {
  const ShowBackOfCardBidEvent({
    required this.timeout,
  }) : super(type: EventType.showBackOfCardBid);

  factory ShowBackOfCardBidEvent.fromJson(Map<String, dynamic> json) {
    return ShowBackOfCardBidEvent(
      timeout: (json['timeout'] as num).toInt(),
    );
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
