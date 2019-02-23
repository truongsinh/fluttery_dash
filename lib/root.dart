import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart' show BaseGame;

import 'bird.dart';

class FlutteryDashGame extends BaseGame {
  static const double GameSpeed = 1.0;

  final Size screenSize;
  final Bird bird;

  FlutteryDashGame(this.screenSize) : bird = Bird(screenSize) {
    initPositions();

    this.add(bird);
  }

  void initPositions() {
    bird.initPosition();
  }

  @override
  void update(double t) {
    bird.update(t * GameSpeed);
  }

  void onTapDown(TapDownDetails ev) {
    bird.flap();
  }
}
