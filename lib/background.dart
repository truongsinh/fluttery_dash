import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Background extends SpriteComponent {
  Background(Size screenSize)
      : super.fromSprite(
          screenSize.width,
          screenSize.height,
          Sprite('background-day.png'),
        );
  int priority() => -100;
}
