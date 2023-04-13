import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Leg extends StatelessWidget {
  final LegMeasurement measurement;
  final AnimationController controller;

  const Leg({required this.measurement, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedOverflowBox(
        size: Size(measurement.width, measurement.height),
        alignment: Alignment.bottomCenter,
        child: Container(
            width: measurement.width,
            height: measurement.height * 1.3,
            decoration: BoxDecoration(
              color: andoColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(measurement.radius),
                  bottomRight: Radius.circular(measurement.radius)),
            )),
      );
}
