import 'dart:math';

import 'package:android_dance/ando_chan/animation/arm_anim.dart';
import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Arm extends StatelessWidget {
  final ArmMeasurement measurement;
  final AnimationController controller;
  late final Animation<double> animation;

  Arm({required this.measurement, required this.controller, Key? key})
      : animation = measurement.alignment == LimbAlignment.left
            ? leftArm(controller)
            : rightArm(controller),
        super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: measurement.alignment == LimbAlignment.left
            ? leftArm(controller)
            : rightArm(controller),
        builder: (context, child) => Transform.rotate(
          alignment: Alignment.topCenter,
          angle: animation.value,
          child: Container(
            width: measurement.width,
            height: measurement.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(measurement.radius),
                border: Border.all(color: Colors.white, width: 2.0),
                color: andoColor),
          ),
        ),
      );
}
