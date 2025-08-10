part of 'card_display_cubit.dart';

class CardDisplayState extends Equatable {
  const CardDisplayState({
    this.cards = const [],
    this.playerIds = const [],
  });

  final List<Art> cards;

  final List<int> playerIds;

  @override
  List<Object?> get props => [cards, playerIds];
}
