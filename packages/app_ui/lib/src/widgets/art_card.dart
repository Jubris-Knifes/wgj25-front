import 'package:flutter/material.dart';

/// {@template art_card}
/// Widget that displays an art card.
/// {@endtemplate}
class ArtCard extends StatelessWidget {
  /// {@macro art_card}
  const ArtCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset('assets/images/art_cards/painting_0_R.jpg'),
    );
  }
}
