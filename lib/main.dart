import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show MaterialApp, Scaffold, runApp;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import './root.dart' show FlutteryDashGame;

void main() async {
  SystemChrome.setEnabledSystemUIOverlays([]);
  final screenSize = await Flame.util.initialDimensions();
  runApp(MaterialApp(
    showPerformanceOverlay: true,
    home: Scaffold(body: Builder(
      builder: (BuildContext context) {
        Brightness brigtness = MediaQuery.platformBrightnessOf(context);
        final flutterDashGame = FlutteryDashGame(screenSize, brigtness);
        Flame.util.addGestureRecognizer(
          TapGestureRecognizer()..onTapDown = flutterDashGame.onTapDown,
        );
        print(
            'brigtness $brigtness window.platformBrightness ${window.platformBrightness}');
        return flutterDashGame.widget;
      },
    )),
  ));
}
