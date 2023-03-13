import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Leg extends StatelessWidget {
  final LegMeasurement measurement;

  const Leg({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: measurement.width,
      height: measurement.height,
    decoration: BoxDecoration(
      color: andoColor,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(measurement.radius), bottomRight: Radius.circular(measurement.radius))
    ),
  );
}
