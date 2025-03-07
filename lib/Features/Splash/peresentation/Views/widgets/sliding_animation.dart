
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingAnimation extends StatelessWidget {
  const SlidingAnimation({
    super.key,
    required this.slidinganimation,
  });

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidinganimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidinganimation,
            child:  const Text(
              'Read Free Books',
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
