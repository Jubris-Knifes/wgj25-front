import 'package:desktop_client/game_screen/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScreenPage extends StatelessWidget {
  const GameScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayersCubit(
            backendRepository: context.read(),
          )..initialize(),
        ),
        BlocProvider(
          create: (context) => GameTurnCubit(
            backendRepository: context.read(),
          )..initialize(),
        ),
      ],
      child: const GameScreenView(),
    );
  }
}

class GameScreenView extends StatelessWidget {
  const GameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: GameMessageBoard()),
          Spacer(),
          PlayersRow(),
        ],
      ),
    );
  }
}

class GameMessageBoard extends StatelessWidget {
  const GameMessageBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameTurnCubit, GameTurnState>(
      builder: (context, state) {
        switch (state) {
          case GameTurnChooseBid():
            final player = context.read<PlayersCubit>().getPlayer(
              state.playerId,
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Es hora de que ${player.name} elija una tarjeta!'),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 1, end: 0),
                  duration: Duration(milliseconds: state.timeout),
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      minHeight: 20,
                      value: value,
                    );
                  },
                ),
              ],
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
