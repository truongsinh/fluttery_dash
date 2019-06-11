import 'dart:math' as Math;
import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/anchor.dart';
import 'package:flame/flame.dart';

enum BirdStatus { waiting, flying }
enum BirdFlyingStatus { up, down, none }

class Bird extends AnimationComponent {
  double accelerationTowardGround = 0;

  final Size screenSize;

  static const initX = 80.0;
  static const initY = 250.0;

  static const birdWidth = 51.0;
  static const birdHeight = 36.0;

  static const gravityAcceleration = 1000;
  static const flapAcceleration = -500.0;

  BirdStatus status = BirdStatus.waiting;
  BirdFlyingStatus flyingStatus = BirdFlyingStatus.none;

  Bird(this.screenSize)
      : super(
          birdWidth,
          birdHeight,
          Animation.spriteList([
            Sprite('bluebird-midflap.png'),
            Sprite('bluebird-upflap.png'),
            Sprite('bluebird-midflap.png'),
            Sprite('bluebird-downflap.png'),
          ], stepTime: 0.15, loop: true),
        ) {
    anchor = Anchor.center;
    setUp();
  }

  void setUp() {
    x = initX;
    y = initY;
    accelerationTowardGround = flapAcceleration;
    angle = 0;
  }

  @override
  void update(double t) {
    if (this.y < screenSize.height - birdHeight) {
      accelerationTowardGround += gravityAcceleration * t;
      this.y += accelerationTowardGround * t;
      angle = Math.atan(accelerationTowardGround / 1000);
    }
    super.update(t);
  }

  void flap() {
    Flame.audio.play('wing.wav');
    accelerationTowardGround += flapAcceleration;
  }

  // @todo: likely flame's bug, when we change `angle` and `anchor`, `toRect` should have changed accordingly
  @override
  Rect toRect() {
    var superRect = super.toRect();

    return Rect.fromLTWH(
      superRect.left - superRect.width / 2,
      superRect.top - superRect.height / 2,
      superRect.width,
      superRect.height,
    );
  }
}
