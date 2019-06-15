import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart' show BaseGame;

import 'background.dart';
import 'bird.dart';
import 'ground.dart';
import 'pipe.dart';

enum GameState { playing, waiting, gameOver }

class FlutteryDashGame extends BaseGame {
  static const double GameSpeed = 1.0;

  final Bird bird;
  final Ground ground;
  final Background background;
  final Pipe pipe;
  final Pipe pipe2;
  GameState gameState = GameState.waiting;

  FlutteryDashGame(Size screenSize, Brightness brightness)
      : bird = Bird(screenSize),
        background = Background(screenSize),
        pipe = Pipe(screenSize),
        pipe2 = Pipe(screenSize, true),
        ground = Ground(screenSize) {
    this
          //
          ..add(bird)
          ..add(ground)
          ..add(background)
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
        // update dark theme / night mode
        // background.update(t * GameSpeed);
        return;
    }
  }

  void updatePlaying(double t) {
    bird.update(t * GameSpeed);
    ground.update(t * GameSpeed);
    pipe.update(t * GameSpeed);
    pipe2.update(t * GameSpeed);
    if ( //
        ground.checkCollidesWith(bird) ||
            pipe.checkCollidesWith(bird) ||
            pipe2.checkCollidesWith(bird) ||
            false
        //
        ) {
      Flame.audio.play('hit.wav');
      Flame.audio.play('die.wav');
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
