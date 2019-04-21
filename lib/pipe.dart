import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'ground.dart';

class Pipe extends SpriteComponent {
  static const pipeWidth = 78.0;
  static const pipeHeight = 480.0;

  final Size screenSize;
  final Random random = Random();

  Pipe(this.screenSize)
      : super.fromSprite(
          pipeWidth,
          pipeHeight,
          Sprite('pipe-green.png'),
        ) {
    setUp();
  }

  setUp() {
    final someParam = 50 + random.nextInt(300);
    x = screenSize.width;
    y = screenSize.height - Ground.groundHeight - someParam;
  }

  @override
  void update(double t) {
    x -= t;
    if (x < -pipeWidth) {
      setUp();
    }
  }

  bool checkCollidesWith(PositionComponent c) {
    final rect = c.toRect();
    final thisRect = this.toRect();
    var intersectedRect = rect.intersect(thisRect);
    return intersectedRect.width > 0 && intersectedRect.height > 0;
  }
}
