import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/components/component.dart' show PositionComponent;
import 'package:flame/game.dart' show BaseGame;

import 'bird.dart';
import 'ground.dart';

class FlutteryDashGame extends BaseGame {
  static const double GameSpeed = 1.0;

  final Size screenSize;
  final Bird bird;
  final Ground ground;
  bool shouldUpdate = true;

  FlutteryDashGame(this.screenSize)
      : bird = Bird(screenSize),
        ground = Ground(screenSize) {
    this
          //
          ..add(bird)
          ..add(ground)
        //
        ;
  }

  @override
  void update(double t) {
    if (!shouldUpdate) {
      return;
    }
    bird.update(t * GameSpeed);
    ground.update(t * GameSpeed);
    if (ground.checkCollidesWith(bird)) {
      print('bird collides with ground');
      shouldUpdate = false;
    }
  }

  void onTapDown(TapDownDetails ev) {
    bird.flap();
  }
}
