import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Arm extends StatelessWidget {
  final ArmMeasurement measurement;

  const Arm({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: measurement.width,
    height: measurement.height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(measurement.radius),
      color: andoColor
    ),
  );
}
