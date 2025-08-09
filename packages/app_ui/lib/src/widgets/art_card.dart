import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ArtCard extends StatelessWidget {
  const ArtCard({super.key, required this.art, this.displayFake = false});

  final Art art;
  final bool displayFake;

  @override
  Widget build(BuildContext context) {
    final borderColor = displayFake && !art.isReal ? Colors.red : Colors.black;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/art_cards/${art.type.name}_${art.id}_${art.isReal ? 'R' : 'F'}.png',
        package: 'app_ui',
      ),
    );
  }
}
