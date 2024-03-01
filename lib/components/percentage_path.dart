import 'dart:ui';

import 'package:flutter/material.dart';

CustomPaint percentagePath(Path path, Size size, {double percentage = 100}) {
  Path percentagePath = createAnimatedPath(path, percentage);
  return CustomPaint(
    size: size,
    painter: RPSCustomPainter(path: percentagePath),
  );
}

class RPSCustomPainter extends CustomPainter {
  Path path;

  RPSCustomPainter({
    required this.path,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001875063;
    paint_0_stroke.color = Color(0xffFF0000).withOpacity(1.0);
    canvas.drawPath(path, paint_0_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path createAnimatedPath(Path originalPath, double animationPercent) {
  final totalLength = originalPath
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

  final currentLength = totalLength * animationPercent;

  return extractPathUntilLength(originalPath, currentLength);
}

Path extractPathUntilLength(Path originalPath, double length) {
  var currentLength = 0.0;

  final path = new Path();

  var metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    var metric = metricsIterator.current;

    var nextLength = currentLength + metric.length;

    final isLastSegment = nextLength > length;
    if (isLastSegment) {
      final remainingLength = length - currentLength;
      final pathSegment = metric.extractPath(0.0, remainingLength);

      path.addPath(pathSegment, Offset.zero);
      break;
    } else {
      // There might be a more efficient way of extracting an entire path
      final pathSegment = metric.extractPath(0.0, metric.length);
      path.addPath(pathSegment, Offset.zero);
    }

    currentLength = nextLength;
  }

  return path;
}
