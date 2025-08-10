import 'dart:async';

import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'card_hand_state.dart';

class CardHandCubit extends Cubit<CardHandState> {
  CardHandCubit({required this.backendRepository})
    : super(const CardHandState());

  final BackendRepository backendRepository;

  late StreamSubscription<Event> _subscription;

  void initialize() {
    _subscription = backendRepository.events.listen((event) async {
      if (event is CardsDealtEvent) {
        emit(const CardHandState());
        for (final card in event.cards) {
          emit(CardHandState(cards: [...state.cards, card]));
          await Future<void>.delayed(const Duration(milliseconds: 200));
        }
      }
      if (event is BidSelectedEvent) {
        emit(CardHandState(cards: state.cards, selectedCard: event.card));
      }
      if (event is OfferSelectedEvent) {
        emit(CardHandState(cards: state.cards, selectedCard: event.card));
      }
    });
  }

  void selectBid(Art card) {
    backendRepository.sendEvent(
      BidSelectedEvent(
        card: card,
      ),
    );
  }

  void selectOffer(Art card) {
    backendRepository.sendEvent(
      OfferSelectedEvent(
        card: card,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
