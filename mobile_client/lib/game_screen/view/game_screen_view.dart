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
                CountdownBar(timeout: state.timeout),
              ],
            );
          case PlayerTurnChooseOffer():
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Haz una oferta!'),
                CountdownBar(timeout: state.timeout),
              ],
            );
          case PlayerTurnChooseOfferChoices():
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Elige una oferta!'),
                CountdownBar(timeout: state.timeout),
                Row(
                  children: List.generate(
                    state.choices.length,
                    (index) {
                      return FilledButton(
                        onPressed: () {
                          context.read<PlayerTurnCubit>().selectOfferChoice(
                            state.choices[index],
                          );
                        },
                        child: Text('Oferta ${index + 1}'),
                      );
                    },
                  ),
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
                    onTap: () {
                      final playerTurnState = context
                          .read<PlayerTurnCubit>()
                          .state;
                      if (playerTurnState is PlayerTurnChooseBid) {
                        context.read<CardHandCubit>().selectBid(cards[index]);
                      }
                      if (playerTurnState is PlayerTurnChooseOffer) {
                        context.read<CardHandCubit>().selectOffer(cards[index]);
                      }
                    },
                    art: cards[index],
                    displayFake: true,
                  ),
                ),
              ),
            ),
            if (state.selectedCard != null)
              Transform.scale(
                scale: 1.2,
                child: ArtCard(
                  art: state.selectedCard!,
                  displayFake: true,
                ),
              ),
          ],
        );
      },
    );
  }
}
