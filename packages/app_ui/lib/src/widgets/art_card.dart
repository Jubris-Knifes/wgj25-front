import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ArtCard extends StatelessWidget {
  const ArtCard({
    required this.art,
    this.displayFake = false,
    this.onTap,
    super.key,
  });

  final Art art;
  final bool displayFake;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final showFake = displayFake && !art.isReal;
    final fileName = art.type == ArtType.backOfCard
        ? 'back_of_card'
        : '${art.type.name}_${art.id}_${art.isReal ? 'R' : 'F'}';
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/art_cards/$fileName.PNG',
            package: 'app_ui',
          ),
          if (showFake)
            Align(
              alignment: Alignment.topRight,
              child: FractionallySizedBox(
                heightFactor: 0.20,
                child: Image.asset(
                  'assets/images/seal.png',
                  package: 'app_ui',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
