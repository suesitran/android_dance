import 'package:flutter/animation.dart';

const durationInSeconds = 10;

extension ToWeight on num {
  double get weight => this / durationInSeconds;
}

TweenSequenceItem<double> rest(double seconds) => TweenSequenceItem(
    tween: Tween<double>(begin: 0, end: 0), weight: seconds.weight);
