import 'package:flutter/material.dart';

class LineWithDot extends StatefulWidget {
  @override
  _LineWithDotState createState() => _LineWithDotState();
}

class _LineWithDotState extends State<LineWithDot> {
  double _dotPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dotPosition += details.delta.dx;
          if (_dotPosition < 0) {
            _dotPosition = 0;
          } else if (_dotPosition > MediaQuery.of(context).size.width - 50) {
            _dotPosition = MediaQuery.of(context).size.width - 50;
          }
        });
      },
      child: CustomPaint(
        painter: LineWithDotPainter(_dotPosition),
        size: Size(MediaQuery.of(context).size.width, 100),
      ),
    );
  }
}

class LineWithDotPainter extends CustomPainter {
  final double dotPosition;

  LineWithDotPainter(this.dotPosition);

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), linePaint);

    Paint dotPaint = Paint()..color = Colors.red;
    canvas.drawCircle(Offset(dotPosition, size.height / 2), 10.0, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}