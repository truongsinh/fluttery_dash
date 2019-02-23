import 'package:flutter/material.dart' show runApp, MaterialApp;
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import './root.dart' show FlutteryDashGame;

void main() async {
  SystemChrome.setEnabledSystemUIOverlays([]);
  var screenSize = await Flame.util.initialDimensions();
  runApp(MaterialApp(
    home: FlutteryDashGame(screenSize).widget,
  ));
}
