part of 'players_cubit.dart';

class PlayersState extends Equatable {
  const PlayersState({
    this.players = const [],
  });

  final List<Player> players;

  @override
  List<Object?> get props => [players];
}
