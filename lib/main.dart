import 'dart:math';
import 'dart:ui';

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

        final andoWidth = width / 2;
        final bodyHeight = andoWidth * 2;

        final headCenter = Offset(width / 2, width / 2);
        final headRadius = andoWidth / 2;
        final headRadiantStart = _degreeToRadiant(180);
        final headRadiantSweep = _degreeToRadiant(180);

        const neckGap = 10;

        // antennas
        final double antennaLeftX =
            cos(_degreeToRadiant(245)) * andoWidth / 2 * 1.3 + width / 2;
        final double antennaLeftY =
            sin(_degreeToRadiant(245)) * andoWidth / 2 * 1.3 + andoWidth;

        final double antennaRightX =
            cos(_degreeToRadiant(295)) * andoWidth / 2 * 1.3 + width / 2;
        final double antennaRightY =
            sin(_degreeToRadiant(295)) * andoWidth / 2 * 1.3 + andoWidth;

        // eyes
        final double leftEyeX =
            cos(_degreeToRadiant(235)) * andoWidth / 2 * 0.7 + width / 2;
        final double leftEyeY =
            sin(_degreeToRadiant(235)) * andoWidth / 2 * 0.7 + andoWidth;

        final double rightEyeX =
            cos(_degreeToRadiant(305)) * andoWidth / 2 * 0.7 + width / 2;
        final double rightEyeY =
            sin(_degreeToRadiant(305)) * andoWidth / 2 * 0.7 + andoWidth;

        // body left
        final double bodyTopLeftX = headCenter.dx - andoWidth / 2;
        final double bodyTopLeftY = headCenter.dy + neckGap;
        final double bodyBottomCurveTopLeftX = bodyTopLeftX;
        final double bodyBottomCurveTopLeftY = bodyHeight - width / 10;
        final double bodyBottomCurveBottomLeftX = bodyTopLeftX + width / 10;
        final double bodyBottomCurveBottomLeftY = bodyHeight;
        final double bodyCurveLeftStart = _degreeToRadiant(180);
        final double bodyCurveLeftSweep = _degreeToRadiant(-90);

        // body right
        final double bodyBottomCurveBottomRightX =
            headCenter.dx + andoWidth / 2 - width / 10;
        final double bodyBottomCurveBottomRightY = bodyHeight;
        final double bodyBottomCurveTopRightX =
            bodyBottomCurveBottomRightX + width / 10;
        final double bodyBottomCurveTopRightY =
            bodyBottomCurveBottomRightY - width / 10;
        final double bodyCurveRightStart = _degreeToRadiant(90);
        final double bodyCurveRightSweep = _degreeToRadiant(-90);
        final double bodyTopRightX = headCenter.dx + andoWidth / 2;
        final double bodyTopRightY = bodyTopLeftY;

        // limbs
        const double limbWidth = neckGap * 4;

        return SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
              painter: AndoChanPainter(
                  width: width,
                  height: height,
                  andoWidth: andoWidth,
                  headCenter: headCenter,
                  headRadius: headRadius,
                  headRadiantStart: headRadiantStart,
                  headRadiantSweep: headRadiantSweep,
                  antennaLeftX: antennaLeftX,
                  antennaLeftY: antennaLeftY,
                  antennaRightX: antennaRightX,
                  antennaRightY: antennaRightY,
                  leftEyeX: leftEyeX,
                  leftEyeY: leftEyeY,
                  rightEyeX: rightEyeX,
                  rightEyeY: rightEyeY,
                  bodyTopLeftX: bodyTopLeftX,
                  bodyTopLeftY: bodyTopLeftY,
                  bodyBottomCurveTopLeftX: bodyBottomCurveTopLeftX,
                  bodyBottomCurveTopLeftY: bodyBottomCurveTopLeftY,
                  bodyBottomCurveBottomLeftX: bodyBottomCurveBottomLeftX,
                  bodyBottomCurveBottomLeftY: bodyBottomCurveBottomLeftY,
                  bodyCurveLeftStart: bodyCurveLeftStart,
                  bodyCurveLeftSweep: bodyCurveLeftSweep,
                  leftBodyCurve: Rect.zero, // TODO add calculation
                  bodyBottomCurveBottomRightX: bodyBottomCurveBottomRightX,
                  bodyBottomCurveBottomRightY: bodyBottomCurveBottomRightY,
                  bodyBottomCurveTopRightX: bodyBottomCurveTopRightX,
                  bodyBottomCurveTopRightY: bodyBottomCurveTopRightY,
                  bodyCurveRightStart: bodyCurveRightStart,
                  bodyCurveRightSweep:
                      bodyCurveRightSweep, // TODO add calculation
                  rightBodyCurve: Rect.zero,
                  bodyTopRightX: bodyTopRightX,
                  bodyTopRightY: bodyTopRightY,
                  limbWidth: limbWidth)),
        );
      }),
    );
  }

  double _degreeToRadiant(double degree) => degree * pi / 180;
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

  final double width;
  final double height;

  // the width of Ando chan
  final double andoWidth;

  /// head params
  final Offset headCenter;
  final double headRadius;
  final double headRadiantStart;
  final double headRadiantSweep;
  // antenna
  final double antennaLeftX;
  final double antennaLeftY;
  final double antennaRightX;
  final double antennaRightY;
  // eyes
  final double leftEyeX;
  final double leftEyeY;
  final double rightEyeX;
  final double rightEyeY;

  /// body params
  final double bodyTopLeftX;
  final double bodyTopLeftY;
  final double bodyBottomCurveTopLeftX;
  final double bodyBottomCurveTopLeftY;
  final double bodyBottomCurveBottomLeftX;
  final double bodyBottomCurveBottomLeftY;
  final Rect leftBodyCurve;
  final double bodyCurveLeftStart;
  final double bodyCurveLeftSweep;

  // right side
  final double bodyBottomCurveBottomRightX;
  final double bodyBottomCurveBottomRightY;
  final double bodyBottomCurveTopRightX;
  final double bodyBottomCurveTopRightY;
  final double bodyCurveRightStart;
  final double bodyCurveRightSweep;
  final Rect rightBodyCurve;
  final double bodyTopRightX;
  final double bodyTopRightY;

  // limbs
  final double limbWidth;

  AndoChanPainter(
      {required this.width,
      required this.height,
      // general width of Android figure
      required this.andoWidth,
      // calculate the head of android figure
      required this.headCenter,
      required this.headRadius,
      required this.headRadiantStart,
      required this.headRadiantSweep,
      required this.antennaLeftX,
      required this.antennaLeftY,
      required this.antennaRightX,
      required this.antennaRightY,
      required this.leftEyeX,
      required this.leftEyeY,
      required this.rightEyeX,
      required this.rightEyeY,
      required this.bodyTopLeftX,
      required this.bodyTopLeftY,
      required this.bodyBottomCurveTopLeftX,
      required this.bodyBottomCurveTopLeftY,
      required this.bodyBottomCurveBottomLeftX,
      required this.bodyBottomCurveBottomLeftY,
      required this.leftBodyCurve,
      required this.bodyCurveLeftStart,
      required this.bodyCurveLeftSweep,
      required this.bodyBottomCurveBottomRightX,
      required this.bodyBottomCurveBottomRightY,
      required this.bodyBottomCurveTopRightX,
      required this.bodyBottomCurveTopRightY,
      required this.bodyCurveRightStart,
      required this.bodyCurveRightSweep,
      required this.rightBodyCurve,
      required this.bodyTopRightX,
      required this.bodyTopRightY,
      required this.limbWidth});

  @override
  void paint(Canvas canvas, Size size) {
    _drawTheHead(canvas);

    _drawBody(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawTheHead(Canvas canvas) {
    // draw the head
    canvas.drawArc(Rect.fromCircle(center: headCenter, radius: headRadius),
        headRadiantStart, headRadiantSweep, true, _androidPaint);

    // draw the antenna
    _androidPaint
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    // left antenna
    canvas.drawLine(Offset(width / 2, andoWidth - 8),
        Offset(antennaLeftX, antennaLeftY), _androidPaint);

    // right antenna
    canvas.drawLine(Offset(width / 2, andoWidth - 8),
        Offset(antennaRightX, antennaRightY), _androidPaint);

    // draw 2 eyes
    _whitePaint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(leftEyeX, leftEyeY), andoWidth / 22, _whitePaint);

    canvas.drawCircle(
        Offset(rightEyeX, rightEyeY), andoWidth / 22, _whitePaint);
  }

  void _drawBody(Canvas canvas) {
    // draw body skeleton
    final bodyPath = Path()
      ..moveTo(bodyTopLeftX, bodyTopLeftY)
      ..lineTo(bodyBottomCurveTopLeftX, bodyBottomCurveTopLeftY)
      ..lineTo(bodyBottomCurveBottomLeftX, bodyBottomCurveBottomLeftY)
      ..lineTo(bodyBottomCurveBottomRightX, bodyBottomCurveBottomRightY)

      /// so far this works fine
      ..lineTo(bodyBottomCurveTopRightX, bodyBottomCurveTopRightY)
      ..lineTo(bodyTopRightX, bodyTopRightY)
      ..close();

    canvas.drawPath(bodyPath, _androidPaint);

    // add bottom curves
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(bodyBottomCurveBottomLeftX, bodyBottomCurveTopLeftY),
            radius: bodyBottomCurveBottomLeftY - bodyBottomCurveTopLeftY),
        bodyCurveLeftStart,
        bodyCurveLeftSweep,
        true,
        _androidPaint);
    canvas.drawArc(
        Rect.fromCircle(
            center:
                Offset(bodyBottomCurveBottomRightX, bodyBottomCurveTopRightY),
            radius: bodyBottomCurveBottomRightY - bodyBottomCurveTopRightY),
        bodyCurveRightStart,
        bodyCurveRightSweep,
        true,
        _androidPaint);
  }
}
