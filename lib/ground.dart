import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Ground extends SpriteComponent {
  static const groundHeight = 130.0;
  static const groundSpeed = 200;

  final Size screenSize;

  Ground(this.screenSize)
      : super.fromSprite(
          screenSize.width * 2,
          groundHeight,
          Sprite('ground.png'),
        ) {
    x = 0;
    y = screenSize.height - groundHeight;
  }

  void update(double t) {
    if (this.x + screenSize.width <= 0) {
      this.x = 0;
    }
    this.x -= t * groundSpeed;
  }

  bool checkCollidesWith(PositionComponent c) {
    final rect = c.toRect();
    return rect.bottom >= this.y;
  }
}
