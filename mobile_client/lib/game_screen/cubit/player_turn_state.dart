part of 'player_turn_cubit.dart';

@immutable
sealed class PlayerTurnState extends Equatable {
  const PlayerTurnState();

  @override
  List<Object?> get props => [];
}

final class PlayerTurnInitial extends PlayerTurnState {}

final class PlayerTurnChooseBid extends PlayerTurnState {
  const PlayerTurnChooseBid({
    required this.timeout,
  });

  final int timeout;

  @override
  List<Object?> get props => [timeout];
}

final class PlayerTurnChooseOffer extends PlayerTurnState {
  const PlayerTurnChooseOffer({
    required this.timeout,
  });

  final int timeout;

  @override
  List<Object?> get props => [timeout];
}
