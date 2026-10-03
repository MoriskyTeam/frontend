import 'package:flutter/material.dart';

/// A Battenburg checker band — two rows of alternating squares, as on
/// emergency vehicles. Reserved for high-severity incidents.
class BattenburgBand extends StatelessWidget {
  const BattenburgBand({
    required this.primary,
    required this.secondary,
    this.cell = 6,
    this.rows = 2,
    super.key,
  });

  final Color primary;
  final Color secondary;
  final double cell;
  final int rows;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        height: cell * rows,
        width: double.infinity,
        child: CustomPaint(
          painter: _BattenburgPainter(
            primary: primary,
            secondary: secondary,
            cell: cell,
          ),
        ),
      ),
    );
  }
}

class _BattenburgPainter extends CustomPainter {
  const _BattenburgPainter({
    required this.primary,
    required this.secondary,
    required this.cell,
  });

  final Color primary;
  final Color secondary;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = secondary);
    final paint = Paint()..color = primary;
    final columns = (size.width / cell).ceil();
    final rows = (size.height / cell).round();
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        if ((row + column).isEven) {
          canvas.drawRect(
            Rect.fromLTWH(column * cell, row * cell, cell, cell),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_BattenburgPainter old) =>
      old.primary != primary || old.secondary != secondary || old.cell != cell;
}

/// Checker frame drawn around a square marker.
class BattenburgFramePainter extends CustomPainter {
  const BattenburgFramePainter({
    required this.primary,
    required this.secondary,
    required this.cell,
    required this.radius,
  });

  final Color primary;
  final Color secondary;
  final double cell;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final outer = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    canvas
      ..save()
      ..clipRRect(outer)
      ..drawRect(Offset.zero & size, Paint()..color = secondary);
    final paint = Paint()..color = primary;
    final columns = (size.width / cell).ceil();
    final rows = (size.height / cell).ceil();
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        if ((row + column).isEven) {
          canvas.drawRect(
            Rect.fromLTWH(column * cell, row * cell, cell, cell),
            paint,
          );
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(BattenburgFramePainter old) =>
      old.primary != primary ||
      old.secondary != secondary ||
      old.cell != cell ||
      old.radius != radius;
}
