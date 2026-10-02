import 'package:flutter/material.dart';

/// Diagonal warning chevrons, the rear-of-vehicle marking. Used on the IMGW
/// warning strip.
class ChevronStripe extends StatelessWidget {
  const ChevronStripe({
    required this.primary,
    required this.secondary,
    this.height = 8,
    super.key,
  });

  final Color primary;
  final Color secondary;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: CustomPaint(
          painter: _ChevronPainter(primary: primary, secondary: secondary),
        ),
      ),
    );
  }
}

class _ChevronPainter extends CustomPainter {
  const _ChevronPainter({required this.primary, required this.secondary});

  final Color primary;
  final Color secondary;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..clipRect(Offset.zero & size)
      ..drawRect(Offset.zero & size, Paint()..color = secondary);
    final paint = Paint()..color = primary;
    final stripe = size.height * 1.2;
    for (var x = -size.height; x < size.width + size.height; x += stripe * 2) {
      final path = Path()
        ..moveTo(x, size.height)
        ..lineTo(x + size.height, 0)
        ..lineTo(x + size.height + stripe, 0)
        ..lineTo(x + stripe, size.height)
        ..close();
      canvas.drawPath(path, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ChevronPainter old) =>
      old.primary != primary || old.secondary != secondary;
}

/// One to three ">" marks next to a severity label, so severity never relies
/// on colour alone.
class SeverityChevrons extends StatelessWidget {
  const SeverityChevrons({
    required this.level,
    required this.color,
    this.size = 12,
    super.key,
  });

  /// 1 = low, 2 = medium, 3 = high.
  final int level;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(right: 1),
              child: CustomPaint(
                size: Size(size * 0.55, size),
                painter: _SingleChevronPainter(
                  color: i < level ? color : color.withValues(alpha: 0.22),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SingleChevronPainter extends CustomPainter {
  const _SingleChevronPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final t = w * 0.45;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(t, 0)
      ..lineTo(w, h / 2)
      ..lineTo(t, h)
      ..lineTo(0, h)
      ..lineTo(w - t, h / 2)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SingleChevronPainter old) => old.color != color;
}

/// Severity as chevrons plus the word, set on the line under a title so it
/// never reads as an eyebrow above it.
class SeverityBadge extends StatelessWidget {
  const SeverityBadge({
    required this.level,
    required this.label,
    super.key,
  });

  /// 1 = low, 2 = medium, 3 = high.
  final int level;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SeverityChevrons(level: level, color: theme.colorScheme.onSurface),
        const SizedBox(width: 6),
        Text(label, style: theme.textTheme.labelMedium),
      ],
    );
  }
}
