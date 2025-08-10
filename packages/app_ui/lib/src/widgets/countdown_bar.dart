import 'package:flutter/material.dart';

class CountdownBar extends StatelessWidget {
  const CountdownBar({
    required this.timeout,
    super.key,
  });

  final int timeout;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: 0),
      duration: Duration(milliseconds: timeout),
      builder: (context, value, child) {
        return LinearProgressIndicator(
          minHeight: 20,
          value: value,
        );
      },
    );
  }
}
