import 'dart:math';

import 'package:flutter/material.dart';

class MarioCharacter extends StatelessWidget {
  final direction;
  final midrun;
  final size;
  const MarioCharacter({super.key, this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return SizedBox(
        width: 100,
        height: 100,
        child: midrun
            ? Image.asset('assets/standingMario.png')
            : Image.asset('assets/runningMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          width: 100,
          height: 100,
          child: midrun
              ? Image.asset('assets/standingMario.png')
              : Image.asset('assets/runningMario.png'),
        ),
      );
    }
  }
}

class MarioJumping extends StatelessWidget {
  final direction;
  final size;

  const MarioJumping({
    super.key,
    this.direction,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return SizedBox(
        width: size,
        height: size,
        child: Image.asset('assets/jumpingMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          width: size,
          height: size,
          child: Image.asset('assets/jumpingMario.png'),
        ),
      );
    }
  }
}
