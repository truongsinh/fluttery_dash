import 'dart:ui';
import 'package:flutter/gestures.dart';
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
  final Pipe pipe2;
  GameState gameState = GameState.waiting;

  FlutteryDashGame(this.screenSize)
      : bird = Bird(screenSize),
        pipe = Pipe(screenSize),
        pipe2 = Pipe(screenSize, true),
        ground = Ground(screenSize) {
    this
          //
          ..add(bird)
          ..add(ground)
          ..add(pipe)
          ..add(pipe2)
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
    pipe.update(t * GameSpeed);
    pipe2.update(t * GameSpeed);
    if (//
      ground.checkCollidesWith(bird) ||
      pipe.checkCollidesWith(bird) ||
      pipe2.checkCollidesWith(bird) ||
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
        pipe.setUp();
        pipe2.setUp();
        print('from gameOver to waiting');
        return;
    }
  }
}
