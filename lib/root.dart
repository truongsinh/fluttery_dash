import 'package:flutter/material.dart' show Canvas, Colors;
import 'package:flame/game.dart' show BaseGame;
import 'package:flame/text_config.dart' show TextConfig;
import 'package:flame/position.dart' show Position;
import 'package:flame/anchor.dart' show Anchor;

class FlutteryDashGame extends BaseGame {
  @override
  void render(Canvas canvas) {
    String text = "Score: 0";
    TextConfig(
      fontSize: 48.0,
      fontFamily: 'Awesome Font',
      color: Colors.blue,
    ).render(
      canvas,
      text,
      Position(size.width / 2, size.height / 2),
      anchor: Anchor.center,
    );
  }

  @override
  void update(double t) {}
}
