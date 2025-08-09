import 'package:backend_repository/backend_repository.dart';

class PlayerJoinEvent extends Event {
  const PlayerJoinEvent({
    required this.name,
    required this.id,
  }) : super(type: EventType.playerJoin);

  factory PlayerJoinEvent.fromJson(Map<String, dynamic> json) {
    return PlayerJoinEvent(
      name: json['name'] as String,
      id: (json['player_id'] as num).toInt(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'name': name,
        'id': id,
      },
    };
  }

  final String name;
  final int id;
}
