import 'package:android_dance/ando_chan/animation/jump_anim.dart';
import 'package:android_dance/ando_chan/parts/arm.dart';
import 'package:android_dance/ando_chan/parts/body.dart';
import 'package:android_dance/ando_chan/parts/head.dart';
import 'package:android_dance/ando_chan/parts/leg.dart';
import 'package:flutter/material.dart';

import 'measurement.dart';

class AndoChan extends StatelessWidget {
  final AndoChanMeasurement measurement;
  final AnimationController controller;
  late final Animation<double> animation;
  AndoChan(
      {required this.measurement, required this.controller, Key? key})
      : animation = jumpAndBounce(controller), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, measurement.body.height * animation.value),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Head(measurement: measurement.head, controller: controller),
              10.0.h(),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Arm(
                    measurement: measurement.leftArm,
                    controller: controller,
                  ),
                  10.0.w(),
                  Body(measurement: measurement.body, controller: controller),
                  10.0.w(),
                  Arm(
                    measurement: measurement.rightArm,
                    controller: controller,
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Leg(
                    measurement: measurement.leftLeg,
                    controller: controller,
                  ),
                  10.0.w(),
                  Leg(
                    measurement: measurement.rightLeg,
                    controller: controller,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension GapExtension on double {
  Widget h() => SizedBox(
        height: this,
      );

  Widget w() => SizedBox(
        width: this,
      );
}
