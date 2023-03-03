import 'dart:math';
import 'dart:ui';

class Line {
  final Offset startPoint;
  final Offset endPoint;

  Line(this.startPoint, this.endPoint);
}

class AndoSettings {
  final double width;
  final double height;

  // the width of Ando chan
  late final double andoWidth;

  /// head params
  late final Offset headCenter;
  late final double headRadius;
  late final double headRadiantStart;
  late final double headRadiantSweep;
  // antenna
  late final Line antennaLeftLine;
  late final Line antennaRightLine;
  late final double antennaThickness;

  // eyes
  late final Offset leftEyePoint;
  late final Offset rightEyePoint;
  late final double eyeRadius;

  /// body params
  late final double bodyBottomCurveRadius;
  late final double bodyTopLeftX;
  late final double bodyTopLeftY;
  late final double bodyBottomCurveTopLeftX;
  late final double bodyBottomCurveTopLeftY;
  late final double bodyBottomCurveBottomLeftX;
  late final double bodyBottomCurveBottomLeftY;
  late final Rect leftBodyCurve;
  late final double bodyCurveLeftStart;
  late final double bodyCurveLeftSweep;

  // right side
  late final double bodyBottomCurveBottomRightX;
  late final double bodyBottomCurveBottomRightY;
  late final double bodyBottomCurveTopRightX;
  late final double bodyBottomCurveTopRightY;
  late final double bodyCurveRightStart;
  late final double bodyCurveRightSweep;
  late final Rect rightBodyCurve;
  late final double bodyTopRightX;
  late final double bodyTopRightY;

  // limbs
  late final double limbWidth;
  late final Line legLeftLine;
  late final Line legRightLine;
  late final Line armLeftLine;
  late final Line armRightLine;

  AndoSettings({
    required this.width,
    required this.height,
  }) {
    andoWidth = width / 2;
    final double bodyHeight = andoWidth * 2;

    headCenter = Offset(andoWidth, andoWidth);
    headRadius = andoWidth / 2;
     headRadiantStart = _degreeToRadiant(180);
     headRadiantSweep = _degreeToRadiant(180);

    final neckGap = andoWidth / 15;

    // antennas
    antennaThickness = andoWidth / 20;

    final double antennaLeftX =
        cos(_degreeToRadiant(245)) * andoWidth / 2 * 1.3 + width / 2;
    final double antennaLeftY =
        sin(_degreeToRadiant(245)) * andoWidth / 2 * 1.3 + andoWidth;

    antennaLeftLine = Line(Offset(width / 2, andoWidth - antennaThickness),
        Offset(antennaLeftX, antennaLeftY));

    final double antennaRightX =
        cos(_degreeToRadiant(295)) * andoWidth / 2 * 1.3 + width / 2;
    final double antennaRightY =
        sin(_degreeToRadiant(295)) * andoWidth / 2 * 1.3 + andoWidth;
    antennaRightLine = Line(Offset(width / 2, andoWidth - antennaThickness),
        Offset(antennaRightX, antennaRightY));

    // eyes
    final double leftEyeX =
        cos(_degreeToRadiant(235)) * andoWidth / 2 * 0.7 + width / 2;
    final double leftEyeY =
        sin(_degreeToRadiant(235)) * andoWidth / 2 * 0.7 + andoWidth;

    leftEyePoint = Offset(leftEyeX, leftEyeY);

    final double rightEyeX =
        cos(_degreeToRadiant(305)) * andoWidth / 2 * 0.7 + width / 2;
    final double rightEyeY =
        sin(_degreeToRadiant(305)) * andoWidth / 2 * 0.7 + andoWidth;
    rightEyePoint = Offset(rightEyeX, rightEyeY);

    eyeRadius = andoWidth / 22;

    /// body
    // body left
    bodyTopLeftX = headCenter.dx - andoWidth / 2;
    bodyTopLeftY = headCenter.dy + neckGap;
    bodyBottomCurveTopLeftX = bodyTopLeftX;
    bodyBottomCurveTopLeftY = bodyHeight - width / 10;
    bodyBottomCurveBottomLeftX = bodyTopLeftX + width / 10;
    bodyBottomCurveBottomLeftY = bodyHeight;
    bodyCurveLeftStart = _degreeToRadiant(180);
    bodyCurveLeftSweep = _degreeToRadiant(-90);

    // body right
    bodyBottomCurveBottomRightX = headCenter.dx + andoWidth / 2 - width / 10;
    bodyBottomCurveBottomRightY = bodyHeight;
    bodyBottomCurveTopRightX = bodyBottomCurveBottomRightX + width / 10;
    bodyBottomCurveTopRightY = bodyBottomCurveBottomRightY - width / 10;
    bodyCurveRightStart = _degreeToRadiant(90);
    bodyCurveRightSweep = _degreeToRadiant(-90);
    bodyTopRightX = headCenter.dx + andoWidth / 2;
    bodyTopRightY = bodyTopLeftY;

    bodyBottomCurveRadius =
        bodyBottomCurveBottomLeftY - bodyBottomCurveTopLeftY;

    /// limbs
    limbWidth = neckGap * 4;

    // left leg
    final legLeftStartX = bodyBottomCurveBottomLeftX + limbWidth / 2;
    final legLeftStartY = bodyBottomCurveTopLeftY;

    final legLeftEndX = legLeftStartX;
    final legLeftEndY = bodyBottomCurveBottomLeftY + limbWidth;

    legLeftLine = Line(
        Offset(legLeftStartX, legLeftStartY), Offset(legLeftEndX, legLeftEndY));

    // right leg
    final legRightStartX = bodyBottomCurveBottomRightX - limbWidth / 2;
    final legRightStartY = bodyBottomCurveTopRightY;

    final legRightEndX = legRightStartX;
    final legRightEndY = bodyBottomCurveBottomRightY + limbWidth;

    legRightLine = Line(Offset(legRightStartX, legRightStartY),
        Offset(legRightEndX, legRightEndY));

    // left arm
    final armLeftStartX = bodyTopLeftX - limbWidth / 2 - neckGap;
    final armLeftStartY = bodyTopLeftY + limbWidth / 2;
    final armLeftEndX = armLeftStartX;
    final armLeftEndY = bodyTopLeftY + andoWidth - limbWidth * 1.5;

    armLeftLine = Line(
        Offset(armLeftStartX, armLeftStartY), Offset(armLeftEndX, armLeftEndY));

    final armRightStartX = bodyTopRightX + limbWidth / 2 + neckGap;
    final armRightStartY = bodyTopRightY + limbWidth / 2;
    final armRightEndX = armRightStartX;
    final armRightEndY = bodyTopRightY + andoWidth - limbWidth * 1.5;

    armRightLine = Line(Offset(armRightStartX, armRightStartY),
        Offset(armRightEndX, armRightEndY));
  }

  static double _degreeToRadiant(double degree) => degree * pi / 180;
}
