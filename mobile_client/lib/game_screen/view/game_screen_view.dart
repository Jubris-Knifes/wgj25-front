import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/game_screen/game_screen.dart';

class GameScreenPage extends StatelessWidget {
  const GameScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardHandCubit(
            backendRepository: context.read(),
          )..initialize(),
        ),
        BlocProvider(
          create: (context) => PlayerTurnCubit(
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
          Spacer(),
          Expanded(child: MessageBoard()),
          Spacer(flex: 2),
          Expanded(
            flex: 4,
            child: CardsRow(),
          ),
        ],
      ),
    );
  }
}

class MessageBoard extends StatelessWidget {
  const MessageBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerTurnCubit, PlayerTurnState>(
      builder: (context, state) {
        switch (state) {
          case PlayerTurnChooseBid():
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Elige que quieres subastar!'),
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

class CardsRow extends StatelessWidget {
  const CardsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<CardHandCubit, CardHandState>(
      builder: (context, state) {
        final cards = state.cards
            .where(
              (card) => card.id != state.selectedCard?.id,
            )
            .toList();

        return Stack(
          children: [
            Transform.translate(
              offset: Offset(0, size.height * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: List.generate(
                  cards.length,
                  (index) => ArtCard(
                    onTap: () =>
                        context.read<CardHandCubit>().selectCard(cards[index]),
                    art: cards[index],
                    displayFake: true,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
