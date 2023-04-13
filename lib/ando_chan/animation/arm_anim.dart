import 'dart:math';

import 'package:android_dance/ando_chan/animation/anim_definition.dart';
import 'package:flutter/material.dart';

Animation<double> leftArm(AnimationController controller) =>
    TweenSequence<double>([
      ...leftArmMove,
      ...leftArmMove,
      ...leftArmMove,
      ...leftArmMove,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftPointing,
      ...leftArmMove,
      ...leftArmMove,
      ...leftArmMove,
      ...leftArmMove,
      rest(1),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

Animation<double> rightArm(AnimationController controller) =>
    TweenSequence<double>([
      ...rightArmMove, // 1.5
      ...rightArmMove,
      ...rightArmMove,
      ...rightArmMove,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...swings,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      ...rightPointing,
      rest(1),
      ...rightArmMove, // 1.5
      ...rightArmMove,
      ...rightArmMove,
      ...rightArmMove,
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

/// separate movements

final List<TweenSequenceItem<double>> leftArmMove = [
  // arm up
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: 180 * pi / 180), weight: 0.5.weight),
  // arm down
  TweenSequenceItem(
      tween: Tween<double>(begin: 180 * pi / 180, end: 0), weight: 0.25.weight),
  // rest
  rest(0.75)
];

final List<TweenSequenceItem<double>> rightArmMove = [
  // rest
  rest(0.75),
  // arm up
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: -180 * pi / 180), weight: 0.5.weight),
  // arm down
  TweenSequenceItem(
      tween: Tween<double>(begin: -180 * pi / 180, end: 0),
      weight: 0.25.weight),
];

final List<TweenSequenceItem<double>> swings = [
  // swing left
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: 30 * pi / 180), weight: 0.25.weight),
  // return to rest
  TweenSequenceItem(
      tween: Tween<double>(begin: 30 * pi / 180, end: 0), weight: 0.25.weight),
  // swing right
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: -30 * pi / 180), weight: 0.25.weight),
  // return to rest
  TweenSequenceItem(
      tween: Tween<double>(begin: -30 * pi / 180, end: 0), weight: 0.25.weight),
];

final List<TweenSequenceItem<double>> leftPointing = [
  // point up
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: 75 * pi / 180), weight: 0.1.weight),
  // point down
  TweenSequenceItem(
      tween: Tween<double>(begin: 75 * pi / 180, end: 70 * pi / 180),
      weight: 0.1.weight),
  // up again
  TweenSequenceItem(
      tween: Tween<double>(begin: 70 * pi / 180, end: 75 * pi / 180),
      weight: 0.1.weight),
  // down again
  TweenSequenceItem(
      tween: Tween<double>(begin: 75 * pi / 180, end: 70 * pi / 180),
      weight: 0.1.weight),
  // return to rest
  TweenSequenceItem(
      tween: Tween<double>(begin: 70 * pi / 180, end: 0), weight: 0.1.weight),
];

final List<TweenSequenceItem<double>> rightPointing = [
  // point up
  TweenSequenceItem(
      tween: Tween<double>(begin: 0, end: -75 * pi / 180), weight: 0.1.weight),
  // point down
  TweenSequenceItem(
      tween: Tween<double>(begin: -75 * pi / 180, end: -70 * pi / 180),
      weight: 0.1.weight),
  // up again
  TweenSequenceItem(
      tween: Tween<double>(begin: -70 * pi / 180, end: -75 * pi / 180),
      weight: 0.1.weight),
  // down again
  TweenSequenceItem(
      tween: Tween<double>(begin: -75 * pi / 180, end: -70 * pi / 180),
      weight: 0.1.weight),
  // return to rest
  TweenSequenceItem(
      tween: Tween<double>(begin: -70 * pi / 180, end: 0), weight: 0.1.weight),
];
