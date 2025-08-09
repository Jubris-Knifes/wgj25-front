part of 'join_game_cubit.dart';

sealed class JoinGameState extends Equatable {
  const JoinGameState();

  @override
  List<Object?> get props => [];
}

class JoinGameData extends JoinGameState {
  const JoinGameData({
    this.name,
    this.code,
  });

  final String? name;

  final String? code;

  @override
  List<Object?> get props => [name, code];
}

class JoinGameError extends JoinGameState {
  const JoinGameError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class JoinGameLoading extends JoinGameState {
  const JoinGameLoading();
}

class JoinGameSuccess extends JoinGameState {
  const JoinGameSuccess();
}
