import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

/// Report state as a printed mark: outline = new, filled = confirmed,
/// struck through = resolved.
class StatusMark extends StatelessWidget {
  const StatusMark({
    required this.status,
    required this.color,
    this.size = 12,
    super.key,
  });

  final IncidentStatus status;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: CustomPaint(
        size: Size.square(size),
        painter: _StatusMarkPainter(status: status, color: color),
      ),
    );
  }
}

class _StatusMarkPainter extends CustomPainter {
  const _StatusMarkPainter({required this.status, required this.color});

  final IncidentStatus status;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(0.75);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    switch (status) {
      case IncidentStatus.reported:
        canvas.drawRect(rect, stroke);
      case IncidentStatus.confirmed:
        canvas.drawRect(rect, Paint()..color = color);
      case IncidentStatus.resolved:
        canvas
          ..drawRect(rect, stroke)
          ..drawLine(rect.bottomLeft, rect.topRight, stroke);
    }
  }

  @override
  bool shouldRepaint(_StatusMarkPainter old) =>
      old.status != status || old.color != color;
}
