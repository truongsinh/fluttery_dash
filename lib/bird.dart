import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

enum BirdStatus { waiting, flying }
enum BirdFlyingStatus { up, down, none }

class Bird extends SpriteComponent {
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
      : super.fromSprite(
          birdWidth,
          birdHeight,
          Sprite('bluebird-midflap.png'),
        );

  void setPosition(double x, double y) {
    this.x = x;
    this.y = y;
  }

  void initPosition() {
    setPosition(initX, initY);
  }

  @override
  void update(double t) {
    if (this.y < screenSize.height - birdHeight) {
      accelerationTowardGround += gravityAcceleration * t;
      this.y += accelerationTowardGround * t;
    }
    super.update(t);
  }

  void flap() {
    accelerationTowardGround = flapAcceleration;
  }
}
