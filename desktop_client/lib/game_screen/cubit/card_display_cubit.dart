import 'dart:async';

import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'card_display_state.dart';

class CardDisplayCubit extends Cubit<CardDisplayState> {
  CardDisplayCubit({
    required this.backendRepository,
  }) : super(const CardDisplayState());

  final BackendRepository backendRepository;

  late StreamSubscription<Event> _subscription;

  void initialize() {
    _subscription = backendRepository.events.listen((event) async {
      if (event is ShowBackOfCardBidEvent) {
        emit(
          const CardDisplayState(
            cards: [
              Art(
                id: 0,
                type: ArtType.backOfCard,
                isReal: false,
              ),
            ],
          ),
        );
      }
      if (event is BidSelectedEvent) {
        emit(
          CardDisplayState(
            cards: event.card != null ? [event.card!] : [],
          ),
        );
        await Future<void>.delayed(Duration(milliseconds: event.timeout));
        emit(const CardDisplayState());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
