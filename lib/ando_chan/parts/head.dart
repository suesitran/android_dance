import 'package:android_dance/ando_chan/measurement.dart';
import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final HeadMeasurement measurement;
  const Head({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Antenna(measurement: measurement.antenna),
      Align(
        alignment: Alignment.bottomCenter,
        child: Face(measurement: measurement.face),
      ),
      Eyes(measurement: measurement.eyes)
    ],
  );
}

class Face extends StatelessWidget {
  final FaceMeasurement measurement;

  const Face({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: measurement.size,
    height: measurement.size/2,
    decoration: BoxDecoration(
      color: andoColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(measurement.size), topRight: Radius.circular(measurement.size))
    ),
  );
}

class Antenna extends StatelessWidget {
  final AntennaMeasurement measurement;
  const Antenna({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: measurement.size,
    height: measurement.size,
    child: LayoutBuilder(
      builder: (p0, constraints) => CustomPaint(
        painter: _AntennaPainter(antennaThickness: measurement.size/8),
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
    canvas.drawLine(Offset.zero, Offset(size.width/2, size.height - antennaThickness), _paint);
    canvas.drawLine(Offset(size.width/2, size.height - antennaThickness), Offset(size.width, 0), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Eyes extends StatelessWidget {
  final EyesMeasurement measurement;

  const Eyes({required this.measurement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: measurement.width,
    height: measurement.height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Eye(size: measurement.width/4),
        Eye(size: measurement.width/4),
      ],
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
      borderRadius: BorderRadius.circular(size),
          color: Colors.white
    ),
  );
}


