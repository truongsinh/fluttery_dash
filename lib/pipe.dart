import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/anchor.dart';

import 'ground.dart';

class Pipe extends SpriteComponent {
  static const pipeWidth = 78.0;
  static const pipeHeight = 480.0;

  final Size screenSize;
  final Random random = Random();
  final bool top;

  Pipe(this.screenSize, [this.top = false])
      : super.fromSprite(
          pipeWidth,
          pipeHeight,
          Sprite('pipe-green.png'),
        ) {
    setUp();
    if (top) {
      angle = pi;
      anchor = Anchor.topRight;
    }
  }

  recycle() {
    final someParam = 50 + random.nextInt(300);
    x = screenSize.width;
    y = someParam.toDouble();
    if (!top) {
      y = screenSize.height - Ground.groundHeight - y;
    }
  }

  setUp() {
    recycle();
    if (top) {
      x += (screenSize.width + pipeWidth) / 2;
    }
  }

  @override
  void update(double t) {
    x -= t * Ground.groundSpeed;
    if (x < -pipeWidth) {
      recycle();
    }
  }

  bool checkCollidesWith(PositionComponent c) {
    final rect = c.toRect();
    final thisRect = this.toRect();
    var intersectedRect = rect.intersect(thisRect);
    return intersectedRect.width > 0 && intersectedRect.height > 0;
  }

  // @todo: likely flame's bug, when we change `angle` and `anchor`, `toRect` should have changed accordingly
  @override
  Rect toRect() {
    var superRect = super.toRect();

    if (!top) {
      return superRect;
    }

    return Rect.fromLTWH(
      superRect.left,
      superRect.top - pipeHeight,
      superRect.width,
      superRect.height,
    );
  }
}
