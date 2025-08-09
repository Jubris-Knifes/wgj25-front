import 'package:app_ui/app_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class GameScreenPage extends StatelessWidget {
  const GameScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GameScreenView();
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        // TODO(juan): Replace with real data
        children: List.generate(
          5,
          (index) => ArtCard(
            art: Art(
              id: 1,
              type: ArtType.painting,
              isReal: index.isEven,
            ),
            displayFake: true,
          ),
        ),
      ),
    );
  }
}
