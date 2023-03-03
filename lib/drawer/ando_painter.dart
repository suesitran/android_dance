import 'dart:ui';

import 'package:flutter/material.dart' show CustomPainter, Colors;

import '../definitions.dart';

part 'draw_body.dart';
part 'draw_head.dart';
part 'draw_limbs.dart';

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

}