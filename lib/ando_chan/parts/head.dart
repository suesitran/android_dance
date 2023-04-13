import 'package:android_dance/ando_chan/animation/anim_definition.dart';
import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final HeadMeasurement measurement;
  final AnimationController controller;
  Head({required this.measurement, required this.controller, Key? key})
      : super(key: key);

  late final Animation<Offset> shake = TweenSequence<Offset>([
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ),
        weight: 6.weight),
    // 1
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.05, 0.0),
        ),
        weight: 0.5.weight),
    // 2
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.05, 0.0),
          end: const Offset(0.05, 0.05),
        ),
        weight: 0.5.weight),
    // 3
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.05, 0.05),
          end: const Offset(0.0, -0.05),
        ),
        weight: 0.5.weight),
    // 4
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, -0.05),
          end: const Offset(0.0, -0.1),
        ),
        weight: 0.5.weight),
    // 5
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, -0.1),
          end: const Offset(-0.05, 0.05),
        ),
        weight: 0.5.weight),
    // 6
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.05, 0.05),
          end: const Offset(-0.01, 0.01),
        ),
        weight: 0.5.weight),
    // 7
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.01, 0.01),
          end: const Offset(-0.05, 0.05),
        ),
        weight: 0.5.weight),
    // 8 & 9
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(-0.05, 0.05),
          end: const Offset(-0.05, 0.1),
        ),
        weight: 1.weight),
    // 10
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0.0, 0.1),
          end: Offset.zero,
        ),
        weight: 0.5.weight),
    TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ),
        weight: 9.weight)
  ]).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.6, 0.8, curve: Curves.easeInOutQuart)));

  @override
  Widget build(BuildContext context) => SlideTransition(
        position: shake,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Antenna(measurement: measurement.antenna, controller: controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Face(measurement: measurement.face),
            ),
            Eyes(
              measurement: measurement.eyes,
              controller: controller,
            )
          ],
        ),
      );
}

class Face extends StatelessWidget {
  final FaceMeasurement measurement;

  const Face({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: measurement.size,
        height: measurement.size / 2,
        decoration: BoxDecoration(
            color: andoColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(measurement.size),
                topRight: Radius.circular(measurement.size))),
      );
}

class Antenna extends StatelessWidget {
  final AntennaMeasurement measurement;
  final AnimationController controller;

  late final Animation<double> animation = TweenSequence<double>([
    TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.25,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.25,
          end: 1.0,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.25,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.25,
          end: 1.0,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.25,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.25,
          end: 1.0,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.25,
        ),
        weight: 0.1),
    TweenSequenceItem(
        tween: Tween(
          begin: 1.25,
          end: 1.0,
        ),
        weight: 0.1),
  ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  Antenna({required this.measurement, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) => SizedBox(
          width: measurement.size * animation.value,
          height: measurement.size,
          child: LayoutBuilder(
            builder: (p0, constraints) => CustomPaint(
              painter: _AntennaPainter(antennaThickness: measurement.size / 8),
            ),
          ),
        ),
      );
}

class _AntennaPainter extends CustomPainter {
  final double antennaThickness;

  _AntennaPainter({required this.antennaThickness});

  late final Paint _paint = Paint()
    ..color = andoColor
    ..strokeWidth = antennaThickness
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset.zero,
        Offset(size.width / 2, size.height - antennaThickness * 2), _paint);

    canvas.drawLine(Offset(size.width / 2, size.height - antennaThickness * 2),
        Offset(size.width, 0), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Eyes extends StatelessWidget {
  final EyesMeasurement measurement;
  final AnimationController controller;

  Eyes({required this.measurement, required this.controller, Key? key})
      : super(key: key);

  late Animation<double> animation = Tween(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.12, 0.25, curve: Curves.ease)));
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, child) => SizedBox(
          width: measurement.width * animation.value,
          height: measurement.height * animation.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Eye(size: measurement.width / 4),
              Eye(size: measurement.width / 4),
            ],
          ),
        ),
      );
}

class Eye extends StatelessWidget {
  final double size;
  const Eye({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size), color: Colors.white),
      );
}
