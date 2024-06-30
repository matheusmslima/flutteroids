import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutteroids/enemy.dart';
import 'package:flutteroids/player.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;

  @override
  Future<void> onLoad() async {
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('background_0.png'),
        ParallaxImageData('Parallax60.png'),
        ParallaxImageData('background_1.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 2),
    );

    add(parallax);

    player = Player();

    add(player);

    add(
      SpawnComponent(
        factory: (amount) {
          return Enemy();
        },
        period: 1,
        area: Rectangle.fromLTWH(
          0,
          0,
          size.x,
          -Enemy.enemySize,
        ),
      ),
    );
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }
}
