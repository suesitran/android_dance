import 'package:android_dance/ando_chan/animation/anim_definition.dart';
import 'package:flutter/animation.dart';

final TweenSequenceItem<double> down = TweenSequenceItem(
    tween: Tween<double>(
      begin: 0.0,
      end: -0.03,
    ),
    weight: 0.1.weight);

final List<TweenSequenceItem<double>> jumpLandAndBounce = [
  // jump
  TweenSequenceItem(
      tween: Tween<double>(
        begin: -0.03,
        end: 0.1,
      ),
      weight: 0.4.weight),
  // and land and bounce
  TweenSequenceItem(
      tween: Tween<double>(begin: 0.1, end: -0.03), weight: 0.25.weight)
];

// jump and bounce up are applicable for legs, body (with arm) and head
Animation<double> jumpAndBounce(AnimationController controller) =>
    TweenSequence<double>([
      down,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      rest(2),
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      rest(3),
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
      ...jumpLandAndBounce,
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
