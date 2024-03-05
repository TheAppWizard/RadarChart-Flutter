import 'dart:math';
import 'package:flutter/material.dart';

class RadarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;
  final List<double> maxValues;
  final double designInterval;
  final double? frameHeight;
  final double? frameWidth;
  final Color shapeColor;


  const RadarChart(
      {super.key, required this.data,
      required this.labels,
      required this.designInterval, required this.maxValues,
      this.frameHeight, this.frameWidth, required this.shapeColor,
      });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:  Size(frameHeight ?? 300, frameWidth ?? 300),
      painter:
      RadarChartPainter(
          data,
          labels,
          maxValues,
          designInterval,
          shapeColor
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final List<double> maxValues; // List of maximum values for each data point
  final double designInterval;
  final Color shapeColor;

  RadarChartPainter(
      this.data,
      this.labels,
      this.maxValues,
      this.designInterval, this.shapeColor,
      );

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final double angle = 2 * pi / data.length;
    final double interval = designInterval;

    Paint linePaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Paint fillPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    Paint backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint dotPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path();

    for (int i = 0; i < data.length; i++) {
      double currentAngle = i * angle - pi / 2;
      double currentRadius = (data[i] / maxValues[i]) * radius; // Use max value for each data point
      double x = center.dx + currentRadius * cos(currentAngle);
      double y = center.dy + currentRadius * sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      canvas.drawLine(center, Offset(x, y), linePaint);
      canvas.drawCircle(Offset(x, y), 8, dotPaint);
    }

    path.close();
    canvas.drawPath(path, fillPaint);

    for (double r = interval; r <= radius; r += interval) {
      Path backgroundPath = Path();
      for (int i = 0; i < data.length; i++) {
        double currentAngle = i * angle - pi / 2;
        double x = center.dx + r * cos(currentAngle);
        double y = center.dy + r * sin(currentAngle);

        if (i == 0) {
          backgroundPath.moveTo(x, y);
        } else {
          backgroundPath.lineTo(x, y);
        }

        canvas.drawLine(center, Offset(x, y), linePaint);
      }
      backgroundPath.close();
      canvas.drawPath(backgroundPath, backgroundPaint);
    }

    const textStyle = TextStyle(color: Colors.black, fontSize: 20);
    for (int i = 0; i < labels.length; i++) {
      double currentAngle = i * angle - pi / 2;
      double x = center.dx + (radius + 20) * cos(currentAngle);
      double y = center.dy + (radius + 20) * sin(currentAngle);
      TextSpan span = TextSpan(style: textStyle, text: labels[i]);
      TextPainter tp =
      TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


