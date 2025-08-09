part of 'card_hand_cubit.dart';

class CardHandState extends Equatable {
  const CardHandState({this.cards = const [], this.selectedCard});

  final List<Art> cards;

  final Art? selectedCard;

  @override
  List<Object?> get props => [cards, selectedCard];
}
