import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show MaterialApp, Scaffold, runApp;
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import './root.dart' show FlutteryDashGame;

void main() async {
  SystemChrome.setEnabledSystemUIOverlays([]);
  final screenSize = await Flame.util.initialDimensions();
  final flutterDashGame = FlutteryDashGame(screenSize);
  runApp(MaterialApp(
    showPerformanceOverlay: true,
    home: Scaffold(body: flutterDashGame.widget),
  ));
  Flame.util.addGestureRecognizer(
    TapGestureRecognizer()..onTapDown = flutterDashGame.onTapDown,
  );
}
