import 'dart:async';

import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'game_turn_state.dart';

class GameTurnCubit extends Cubit<GameTurnState> {
  GameTurnCubit({
    required this.backendRepository,
  }) : super(const GameTurnInitial());

  final BackendRepository backendRepository;

  late StreamSubscription<Event> _subscription;

  void initialize() {
    _subscription = backendRepository.events.listen((event) async {
      if (event is ChooseBidEvent) {
        emit(
          GameTurnChooseBid(timeout: event.timeout, playerId: event.playerId),
        );
      }
      if (event is ChooseOfferEvent) {
        emit(
          GameTurnChooseOffer(
            timeout: event.timeout,
            playerIds: event.playerIds,
          ),
        );
      }
      if (event is BidSelectedEvent || event is OffersFinishedEvent) {
        emit(const GameTurnInitial());
      }
      if (event is SelectOfferChosenEvent) {
        emit(
          GameTurnChosenOffer(
            playerId: event.playerId,
          ),
        );
        await Future<void>.delayed(Duration(milliseconds: event.timeout));
        emit(const GameTurnInitial());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
