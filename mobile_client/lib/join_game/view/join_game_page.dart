import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/join_game/join_game.dart';

class JoinGamePage extends StatelessWidget {
  const JoinGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinGameCubit(),
      child: const JoinGameView(),
    );
  }
}

class JoinGameView extends StatelessWidget {
  const JoinGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
