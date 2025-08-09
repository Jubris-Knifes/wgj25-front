import 'package:backend_repository/backend_repository.dart';

class SetNameRequest extends Event {
  const SetNameRequest({required this.name})
    : super(type: EventType.setNameRequest);

  final String name;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.key,
      'event_data': {
        'name': name,
      },
    };
  }
}
