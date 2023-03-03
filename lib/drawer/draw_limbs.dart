part of 'ando_painter.dart';

extension DrawLimbs on Canvas {
  void drawLimbs(
      {required double limbWidth,
      required Line legLeftLine,
      required Line legRightLine,
      required Line armLeftLine,
      required Line armRightLine,
      required Paint paint}) {
    // use thick paint
    paint.strokeWidth = limbWidth;

    /// draw legs
    // left leg
    drawLine(legLeftLine.startPoint, legLeftLine.endPoint, paint);

    // right leg

    drawLine(legRightLine.startPoint, legRightLine.endPoint, paint);

    /// draw arms
    // left arm
    drawLine(armLeftLine.startPoint, armLeftLine.endPoint, paint);

    // right arm
    drawLine(armRightLine.startPoint, armRightLine.endPoint, paint);
  }
}
