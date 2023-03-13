import 'package:android_dance/ando_chan/parts/arm.dart';
import 'package:android_dance/ando_chan/parts/body.dart';
import 'package:android_dance/ando_chan/parts/head.dart';
import 'package:android_dance/ando_chan/parts/leg.dart';
import 'package:flutter/material.dart';

import 'measurement.dart';

class AndoChan extends StatelessWidget {
  final AndoChanMeasurement measurement;
  const AndoChan({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Head(measurement: measurement.head),
          10.0.h(),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Arm(measurement: measurement.leftArm,),
              10.0.w(),
              Body(measurement: measurement.body),
              10.0.w(),
              Arm(measurement: measurement.rightArm)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Leg(measurement: measurement.leftLeg,),
              10.0.w(),
              Leg(measurement: measurement.rightLeg)
            ],
          )
        ],
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