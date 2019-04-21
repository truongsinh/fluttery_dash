import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart' show BaseGame;

import 'bird.dart';
import 'ground.dart';

enum GameState { playing, waiting, gameOver }

class FlutteryDashGame extends BaseGame {
  static const double GameSpeed = 1.0;

  final Size screenSize;
  final Bird bird;
  final Ground ground;
  GameState gameState = GameState.waiting;

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
    if (//
      ground.checkCollidesWith(bird) ||
      false
      //
      ) {
      print('bird collides');
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
        ground.setUp();
        print('from gameOver to waiting');
        return;
    }
  }
}
