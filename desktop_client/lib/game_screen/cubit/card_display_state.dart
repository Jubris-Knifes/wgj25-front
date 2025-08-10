part of 'card_display_cubit.dart';

class CardDisplayState extends Equatable {
  const CardDisplayState({
    this.cards = const [],
  });

  final List<Art> cards;

  @override
  List<Object?> get props => [cards];
}
