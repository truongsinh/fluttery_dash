import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'ground.dart';

class Pipe extends SpriteComponent {
  static const pipeWidth = 78.0;
  static const pipeHeight = 480.0;

  final Size screenSize;

  Pipe(this.screenSize)
      : super.fromSprite(
          pipeWidth,
          pipeHeight,
          Sprite('pipe-green.png'),
        ) {
    setUp();
  }

  setUp() {
    final someParam = 50;
    x = screenSize.width;
    y = screenSize.height - Ground.groundHeight - someParam;
  }

  @override
  void update(double t) {
    this.x -= t * Ground.groundSpeed;
  }
}
