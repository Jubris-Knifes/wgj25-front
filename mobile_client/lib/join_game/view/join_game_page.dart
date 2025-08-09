import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/game_screen/game_screen.dart';
import 'package:mobile_client/join_game/join_game.dart';

class JoinGamePage extends StatelessWidget {
  const JoinGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinGameCubit(
        backendRepository: context.read(),
      ),
      child: const JoinGameView(),
    );
  }
}

class JoinGameView extends StatelessWidget {
  const JoinGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<JoinGameCubit, JoinGameState>(
      listener: (context, state) {
        if (state is JoinGameSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const GameScreenPage(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                const Text('Cual es tu nombre?'),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: TextField(
                    onChanged: context.read<JoinGameCubit>().setName,
                    maxLength: 10,
                  ),
                ),
                BlocSelector<JoinGameCubit, JoinGameState, bool>(
                  selector: (state) =>
                      state is JoinGameData &&
                      (state.name?.isNotEmpty ?? false),
                  builder: (context, enabled) {
                    return ElevatedButton(
                      onPressed: enabled
                          ? context.read<JoinGameCubit>().joinGame
                          : null,
                      child: const Text('Unirse'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
