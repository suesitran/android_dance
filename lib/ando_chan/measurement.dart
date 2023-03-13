import 'dart:math';
import 'dart:ui';

enum LimbAlignment { left, right }

const Color andoColor = Color(0xFF3DDC84);

class AndoChanMeasurement {
  final HeadMeasurement head;
  final ArmMeasurement leftArm;
  final ArmMeasurement rightArm;
  final LegMeasurement leftLeg;
  final LegMeasurement rightLeg;
  final BodyMeasurement body;

  AndoChanMeasurement({required double width, required double height})
      : head = HeadMeasurement(width: width, height: height),
        leftArm = ArmMeasurement(
            width: width, height: height, alignment: LimbAlignment.left),
        rightArm = ArmMeasurement(
            width: width, height: height, alignment: LimbAlignment.right),
        leftLeg = LegMeasurement(
            width: width, height: height, alignment: LimbAlignment.left),
        rightLeg = LegMeasurement(
            width: width, height: height, alignment: LimbAlignment.right),
        body = BodyMeasurement(width: width, height: height);
}

class HeadMeasurement {
  final EyesMeasurement eyes;
  final AntennaMeasurement antenna;
  final FaceMeasurement face;

  HeadMeasurement({required double width, required double height})
      : eyes = EyesMeasurement(width: width, height: height),
        antenna = AntennaMeasurement(width: width, height: height),
        face = FaceMeasurement(width: width, height: height);
}

class EyesMeasurement {
  final double width;
  final double height;
  EyesMeasurement({required double width, required double height})
      : width = min(width, height) / 6,
        height = min(width, height) / 8;
}

class AntennaMeasurement {
  final double size;
  AntennaMeasurement({required double width, required double height})
      : size = min(width, height) / 5;
}

class FaceMeasurement {
  final double size;

  FaceMeasurement({required double width, required double height})
      : size = min(width, height) / 3;
}

class LimbMeasurement {
  final LimbAlignment alignment;
  LimbMeasurement(
      {required double width, required double height, required this.alignment});
}

class ArmMeasurement extends LimbMeasurement {
  final double width;
  final double height;
  final double radius;
  ArmMeasurement(
      {required super.width, required super.height, required super.alignment})
      : width = min(width, height) / 12,
        height = min(width, height) / 4,
        radius = min(width, height) / 12;
}

class LegMeasurement extends LimbMeasurement {
  final double width;
  final double height;
  final double radius;

  LegMeasurement(
      {required super.width, required super.height, required super.alignment})
      : width = min(width, height) / 12,
        height = min(width, height) / 6,
        radius = min(width, height) / 12;
}

class BodyMeasurement {
  final double width;
  final double height;
  final double radius;
  BodyMeasurement({required double width, required double height})
      : width = min(width, height) / 3,
        height = min(width, height) / 3,
        radius = min(width, height) / 15;
}
