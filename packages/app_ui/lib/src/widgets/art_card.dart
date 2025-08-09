import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ArtCard extends StatelessWidget {
  const ArtCard({super.key, required this.art});

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(
        'assets/images/art_cards/${art.type.name}_${art.id}_${art.isReal ? 'R' : 'F'}.png',
        package: 'app_ui',
      ),
    );
  }
}
