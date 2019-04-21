import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/sprite.dart';
import 'pipe.dart';

class Ground extends SpriteComponent with ComposedComponent {
  static const groundHeight = 130.0;
  static const groundSpeed = 200;

  final Size screenSize;
  final Pipe pipe;

  Ground(this.screenSize)
      : pipe = Pipe(screenSize),
        super.fromSprite(
          screenSize.width * 2,
          groundHeight,
          Sprite('ground.png'),
        ) {
    x = 0;
    y = screenSize.height - groundHeight;
    this
          //
          ..add(pipe)
          //
        ;

  }

  void setUp() {
    pipe.setUp();
  }

  void update(double t) {
    if (this.x + screenSize.width <= 0) {
      this.x = 0;
    }
    this.x -= t * groundSpeed;
    pipe.update(t);
  }

  bool checkCollidesWith(PositionComponent c) {
    final rect = c.toRect();
    return rect.bottom >= this.y || this.pipe.checkCollidesWith(c);
  }
}
