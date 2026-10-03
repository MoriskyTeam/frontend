import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:flutter/material.dart';

/// The signature move: when [active] turns on, a band of light crosses the
/// child diagonally, like headlights catching retroreflective tape.
///
/// Plays twice and settles. Under reduced motion it renders nothing extra —
/// the arrival is still announced by the surrounding UI.
class OdblaskSweep extends StatefulWidget {
  const OdblaskSweep({
    required this.active,
    required this.child,
    this.intensity = 0.85,
    super.key,
  });

  final bool active;
  final Widget child;
  final double intensity;

  @override
  State<OdblaskSweep> createState() => _OdblaskSweepState();
}

class _OdblaskSweepState extends State<OdblaskSweep>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: RcbMotion.sweep,
  );

  @override
  void initState() {
    super.initState();
    if (widget.active) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _play());
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _play());
  }

  @override
  void didUpdateWidget(OdblaskSweep oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active && !oldWidget.active) _play();
  }

  Future<void> _play() async {
    if (!mounted || MediaQuery.disableAnimationsOf(context)) return;
    for (var pass = 0; pass < 2 && mounted; pass++) {
      await _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        if (!_controller.isAnimating) return child!;
        final t = RcbMotion.standard.transform(_controller.value);
        // Band travels from beyond the top-left to beyond the bottom-right.
        final centre = -0.6 + t * 2.2;
        final light = Colors.white.withValues(alpha: widget.intensity);
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.transparent,
              light,
              Colors.transparent,
            ],
            stops: [
              (centre - 0.14).clamp(0.0, 1.0),
              centre.clamp(0.0, 1.0),
              (centre + 0.14).clamp(0.0, 1.0),
            ],
          ).createShader(bounds),
          child: child,
        );
      },
    );
  }
}
