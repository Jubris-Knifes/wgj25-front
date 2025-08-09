import 'package:app_ui/app_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_client/game_screen/game_screen.dart';

class GameScreenPage extends StatelessWidget {
  const GameScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardHandCubit(
        backendRepository: context.read(),
      ),
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
          // TODO(juan): Replace with instructions
          Expanded(child: Text('Lorem Ipsum', style: TextStyle(fontSize: 20))),
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

class CardsRow extends StatelessWidget {
  const CardsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Transform.translate(
      offset: Offset(0, size.height * 0.1),
      child: BlocSelector<CardHandCubit, CardHandState, List<Art>>(
        selector: (state) {
          return state.cards
              .where((card) => card.id != state.selectedCard?.id)
              .toList();
        },
        builder: (context, cards) {
          return Row(
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
          );
        },
      ),
    );
  }
}
