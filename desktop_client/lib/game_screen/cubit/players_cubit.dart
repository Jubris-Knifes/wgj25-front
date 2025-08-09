import 'dart:async';

import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:desktop_client/app/app.dart';
import 'package:equatable/equatable.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit({
    required this.backendRepository,
  }) : super(const PlayersState());

  final BackendRepository backendRepository;

  late StreamSubscription<Event> _subscription;

  void initialize() {
    _subscription = backendRepository.events.listen((event) {
      if (event is PlayerJoinEvent) {
        final player = Player(
          id: event.id,
          name: event.name,
          score: 0,
        );
        emit(PlayersState(players: [...state.players, player]));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
