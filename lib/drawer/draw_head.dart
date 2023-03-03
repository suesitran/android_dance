import 'dart:ui';

import 'package:android_dance/definitions.dart';

extension DrawAndroidHead on Canvas {
  void drawHead(
      {required Offset headCenter,
      required double headRadius,
      required double headRadiantStart,
      required double headRadiantSweep,
      required Paint paint,
      required double antennaThickness,
      required Line antennaLeftLine,
      required Line antennaRightLine,
      required Paint whitePaint,
      required Offset leftEyePoint,
      required Offset rightEyePoint,
      required double eyeRadius}) {
    // draw the head
    drawArc(Rect.fromCircle(center: headCenter, radius: headRadius),
        headRadiantStart, headRadiantSweep, true, paint);

    // draw the antenna
    paint
      ..strokeWidth = antennaThickness
      ..strokeCap = StrokeCap.round;
    // left antenna
    drawLine(antennaLeftLine.startPoint, antennaLeftLine.endPoint, paint);

    // right antenna
    drawLine(antennaRightLine.startPoint, antennaRightLine.endPoint, paint);

    // draw 2 eyes
    whitePaint.style = PaintingStyle.fill;
    drawCircle(leftEyePoint, eyeRadius, whitePaint);

    drawCircle(rightEyePoint, eyeRadius, whitePaint);
  }
}
