import 'dart:math';
import 'dart:ui';

import 'package:android_dance/definitions.dart';
import 'package:android_dance/drawer/draw_body.dart';
import 'package:android_dance/drawer/draw_head.dart';
import 'package:android_dance/drawer/draw_limbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {});
      })
      ..duration = const Duration(seconds: 3);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        final width = min(constraint.maxWidth, constraint.maxHeight);
        final height = max(constraint.maxWidth, constraint.maxHeight);

        return SizedBox(
          width: width,
          height: height,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) => CustomPaint(
                painter: AndoChanPainter(
                    settings: AndoSettings(
                        width: width,
                        height: height))),
          ),
        );
      }),
    );
  }
}

class AndoChanPainter extends CustomPainter {
  final Paint _androidPaint = Paint()
    ..color = const Color(0xFF3DDC84)
    ..style = PaintingStyle.fill
    ..strokeWidth = 4;

  final Paint _whitePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  final AndoSettings settings;

  AndoChanPainter({required this.settings});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawHead(
        headCenter: settings.headCenter,
        headRadius: settings.headRadius,
        headRadiantStart: settings.headRadiantStart,
        headRadiantSweep: settings.headRadiantSweep,
        paint: _androidPaint,
        antennaThickness: settings.antennaThickness,
        antennaLeftLine: settings.antennaLeftLine,
        antennaRightLine: settings.antennaRightLine,
        whitePaint: _whitePaint,
        leftEyePoint: settings.leftEyePoint,
        rightEyePoint: settings.rightEyePoint,
        eyeRadius: settings.eyeRadius);

    canvas.drawBody(
        bodyBottomCurveRadius: settings.bodyBottomCurveRadius,
        bodyTopLeftX: settings.bodyTopLeftX,
        bodyTopLeftY: settings.bodyTopLeftY,
        bodyBottomCurveTopLeftX: settings.bodyBottomCurveTopLeftX,
        bodyBottomCurveTopLeftY: settings.bodyBottomCurveTopLeftY,
        bodyBottomCurveBottomLeftX: settings.bodyBottomCurveBottomLeftX,
        bodyBottomCurveBottomLeftY: settings.bodyBottomCurveBottomLeftY,
        bodyCurveLeftStart: settings.bodyCurveLeftStart,
        bodyCurveLeftSweep: settings.bodyCurveLeftSweep,
        bodyBottomCurveBottomRightX: settings.bodyBottomCurveBottomRightX,
        bodyBottomCurveBottomRightY: settings.bodyBottomCurveBottomRightY,
        bodyBottomCurveTopRightX: settings.bodyBottomCurveTopRightX,
        bodyBottomCurveTopRightY: settings.bodyBottomCurveTopRightY,
        bodyCurveRightStart: settings.bodyCurveRightStart,
        bodyCurveRightSweep: settings.bodyCurveRightSweep,
        bodyTopRightX: settings.bodyTopRightX,
        bodyTopRightY: settings.bodyTopRightY,
        paint: _androidPaint);

    canvas.drawLimbs(
        limbWidth: settings.limbWidth,
        legLeftLine: settings.legLeftLine,
        legRightLine: settings.legRightLine,
        armLeftLine: settings.armLeftLine,
        armRightLine: settings.armRightLine,
        paint: _androidPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawLimbs(Canvas canvas) {}
}
