import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Background extends SpriteComponent {
  Background(Size screenSize)
      : super.fromSprite(
          screenSize.width,
          screenSize.height,
          _daySprite,
        );
  static final _nightSprite = Sprite('background-night.png');
  static final _daySprite = Sprite('background-day.png');
  int priority() => -100;

  void updatePlatformBrightness(Brightness platformBrightness) {
    if (platformBrightness == Brightness.dark) {
      sprite = _nightSprite;
    } else {
      sprite = _daySprite;
    }
  }
}
