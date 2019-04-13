import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/components/component.dart' show PositionComponent;
import 'package:flame/game.dart' show BaseGame;

import 'bird.dart';
import 'ground.dart';
import 'pipe.dart';

enum GameState { playing, waiting, gameOver }

class FlutteryDashGame extends BaseGame {
  static const double GameSpeed = 1.0;

  final Size screenSize;
  final Bird bird;
  final Ground ground;
  final Pipe pipe;
  GameState gameState = GameState.waiting;

  FlutteryDashGame(this.screenSize)
      : bird = Bird(screenSize),
        pipe = Pipe(screenSize),
        ground = Ground(screenSize) {
    this
          //
          ..add(bird)
          ..add(ground)
          ..add(pipe)
        //
        ;
  }

  @override
  void update(double t) {
    switch (gameState) {
      case GameState.playing:
        updatePlaying(t);
        return;
      case GameState.waiting:
      case GameState.gameOver:
        return;
    }
  }

  void updatePlaying(double t) {
    bird.update(t * GameSpeed);
    ground.update(t * GameSpeed);
    if (ground.checkCollidesWith(bird)) {
      print('bird collides with ground');
      gameState = GameState.gameOver;
    }
  }

  void onTapDown(TapDownDetails ev) {
    switch (gameState) {
      case GameState.playing:
        bird.flap();
        return;
      case GameState.waiting:
        gameState = GameState.playing;
        print('from waiting to playing');
        return;
      case GameState.gameOver:
        gameState = GameState.waiting;
        bird.setUp();
        print('from gameOver to waiting');
        return;
    }
  }
}
