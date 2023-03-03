part of 'ando_painter.dart';

extension DrawAndroidBody on Canvas {
  void drawBody(
      {required double bodyBottomCurveRadius,
      required double bodyTopLeftX,
      required double bodyTopLeftY,
      required double bodyBottomCurveTopLeftX,
      required double bodyBottomCurveTopLeftY,
      required double bodyBottomCurveBottomLeftX,
      required double bodyBottomCurveBottomLeftY,
      required double bodyCurveLeftStart,
      required double bodyCurveLeftSweep,
      required double bodyBottomCurveBottomRightX,
      required double bodyBottomCurveBottomRightY,
      required double bodyBottomCurveTopRightX,
      required double bodyBottomCurveTopRightY,
      required double bodyCurveRightStart,
      required double bodyCurveRightSweep,
      required double bodyTopRightX,
      required double bodyTopRightY,
      required Paint paint}) {
    // draw body skeleton
    final bodyPath = Path()
      ..moveTo(bodyTopLeftX, bodyTopLeftY)
      ..lineTo(bodyBottomCurveTopLeftX, bodyBottomCurveTopLeftY)
      ..lineTo(bodyBottomCurveBottomLeftX, bodyBottomCurveBottomLeftY)
      ..lineTo(bodyBottomCurveBottomRightX, bodyBottomCurveBottomRightY)
      ..lineTo(bodyBottomCurveTopRightX, bodyBottomCurveTopRightY)
      ..lineTo(bodyTopRightX, bodyTopRightY)
      ..close();

    drawPath(bodyPath, paint);

    // add bottom curves
    drawArc(
        Rect.fromCircle(
            center: Offset(bodyBottomCurveBottomLeftX, bodyBottomCurveTopLeftY),
            radius: bodyBottomCurveRadius),
        bodyCurveLeftStart,
        bodyCurveLeftSweep,
        true,
        paint);
    drawArc(
        Rect.fromCircle(
            center:
                Offset(bodyBottomCurveBottomRightX, bodyBottomCurveTopRightY),
            radius: bodyBottomCurveRadius),
        bodyCurveRightStart,
        bodyCurveRightSweep,
        true,
        paint);
  }
}
