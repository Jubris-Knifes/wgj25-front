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
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: PlayerPortrait(playerNumber: 1, animateSign: true),
              ),
              Flexible(
                child: PlayerPortrait(playerNumber: 2, animateSign: false),
              ),
              Flexible(
                child: PlayerPortrait(playerNumber: 3, animateSign: true),
              ),
              Flexible(
                child: PlayerPortrait(playerNumber: 4, animateSign: true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayerPortrait extends StatefulWidget {
  const PlayerPortrait({
    super.key,
    required this.playerNumber,
    required this.animateSign,
  });

  final int playerNumber;

  final bool animateSign;

  @override
  State<PlayerPortrait> createState() => _PlayerPortraitState();
}

class _PlayerPortraitState extends State<PlayerPortrait> {
  bool showSign = false;

  @override
  void initState() {
    super.initState();
    if (widget.animateSign) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          showSign = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          left: 50,
          top: showSign ? -70 : -10,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          onEnd: () {
            setState(() {
              showSign = !showSign;
            });
          },
          child: Image.asset(
            'assets/images/signs/sign_${widget.playerNumber}.PNG',
            height: 100,
          ),
        ),
        ColoredBox(
          color: Colors.brown,
          child: ListTile(
            tileColor: Colors.brown,
            leading: Image.asset('assets/images/characters/pringle_guy.GIF'),
            title: Text('000000000'),
            subtitle: Text('Player 1'),
          ),
        ),
      ],
    );
  }
}
