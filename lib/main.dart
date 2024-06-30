import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutteroids/space_shooter_game.dart';

void main() {
  runApp(
    GameWidget(
      game: SpaceShooterGame(),
    ),
  );
}
