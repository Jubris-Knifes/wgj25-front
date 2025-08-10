import 'package:backend_repository/backend_repository.dart';
import 'package:domain/domain.dart';

class OffersFinishedEvent extends Event {
  const OffersFinishedEvent({
    required this.timeout,
    required this.offers,
  }) : super(type: EventType.offersFinished);

  factory OffersFinishedEvent.fromJson(Map<String, dynamic> json) {
    return OffersFinishedEvent(
      timeout: json['timeout'] as int,
      offers: Map<int, Art>.fromEntries(
        (json['offers'] as List<dynamic>).map(
          (e) => MapEntry(
            (e['player_id'] as num).toInt(),
            Art.fromJson(e['card'] as Map<String, dynamic>),
          ),
        ),
      ),
    );
  }

  final int timeout;

  final Map<int, Art> offers;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'timeout': timeout,
        'offers': offers.entries
            .map(
              (e) => {
                'player_id': e.key,
                'card': e.value.toJson(),
              },
            )
            .toList(),
      },
    };
  }
}
