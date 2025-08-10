import 'dart:async';

import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'player_turn_state.dart';

class PlayerTurnCubit extends Cubit<PlayerTurnState> {
  PlayerTurnCubit({
    required this.backendRepository,
  }) : super(PlayerTurnInitial());

  final BackendRepository backendRepository;

  late StreamSubscription<Event> _subscription;

  void initialize() {
    _subscription = backendRepository.events.listen((event) {
      if (event is ChooseBidEvent) {
        emit(
          PlayerTurnChooseBid(
            timeout: event.timeout,
            canFinishRound: event.canFinishRound,
          ),
        );
      }
      if (event is ChooseOfferEvent) {
        emit(
          PlayerTurnChooseOffer(timeout: event.timeout),
        );
      }
      if (event is OffersFinishedEvent) {
        emit(
          PlayerTurnChooseOfferChoices(
            timeout: event.timeout,
            choices: event.offers.keys.toList(),
          ),
        );
      }
      if (event is PrepareForNextTurnEvent) {
        emit(const PlayerTurnPrepareForNextTurn());
      }
    });
  }

  void selectOfferChoice(int choice) {
    backendRepository.sendEvent(
      PlayerChooseOfferEvent(
        playerId: choice,
      ),
    );
  }

  void finishRound() {
    backendRepository.sendEvent(
      const BidSelectedEvent(
        card: null,
        isRoundOver: true,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
