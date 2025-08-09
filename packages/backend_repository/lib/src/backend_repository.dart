import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:backend_repository/backend_repository.dart';

/// {@template backend_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class BackendRepository {
  /// {@macro backend_repository}
  BackendRepository({required String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;
  late WebSocket _client;
  late StreamController<Event> _eventController;

  Future<void> initialize() async {
    _eventController = StreamController<Event>.broadcast();

    await WebSocket.connect(
          '$_baseUrl/ws',
          headers: {'skip_zrok_interstitial': '1'},
        )
        .then((client) {
          _client = client;
          _client.listen(
            (data) {
              try {
                final json = jsonDecode(data as String);
                final event = Event.fromJson(json as Map<String, dynamic>);
                _eventController.add(event);
              } catch (e) {
                _eventController.add(const Noise());
              }
            },
            onError: (Object error, StackTrace stackTrace) =>
                _eventController.addError(error, stackTrace),
            onDone: () => _eventController.close(),
          );
        })
        .catchError((Object error, StackTrace stackTrace) {
          _eventController.addError(error, stackTrace);
        });
  }

  Stream<Event> get events => _eventController.stream;

  void sendEvent(Event event) {
    _client.add(jsonEncode(event.toJson()));
  }

  void dispose() {
    _client.close();
    _eventController.close();
  }
}
