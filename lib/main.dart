import 'package:flutter/material.dart' show runApp, MaterialApp;
import './root.dart' show FlutteryDashGame;
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
    home: FlutteryDashGame().widget,
  ));
}
