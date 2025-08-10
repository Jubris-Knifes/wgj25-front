part of 'game_turn_cubit.dart';

@immutable
sealed class GameTurnState extends Equatable {
  const GameTurnState();

  @override
  List<Object?> get props => [];
}

final class GameTurnInitial extends GameTurnState {
  const GameTurnInitial();
}

final class GameTurnChooseBid extends GameTurnState {
  const GameTurnChooseBid({
    required this.timeout,
    required this.playerId,
  });

  final int timeout;

  final int playerId;

  @override
  List<Object?> get props => [timeout];
}
