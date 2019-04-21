import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'ground.dart';
import 'pipe.dart';

class MovingEnvironment extends Component with ComposedComponent {
  static const groundSpeed = 200;

  final Size screenSize;
  final Ground ground;
  final Pipe pipe;

  MovingEnvironment(this.screenSize)
      : pipe = Pipe(screenSize),
        ground = Ground(screenSize) {
    setUp();
  }

  void setUp() {
    pipe.setUp();
  }

  void update(double t) {
    ground.update(t * groundSpeed);
    pipe.update(t * groundSpeed);
  }

  bool checkCollidesWith(PositionComponent c) =>
      ground.checkCollidesWith(c) || pipe.checkCollidesWith(c);
}
