import 'package:dynamic_rcb_alerts/core/theme/rcb_radii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// The signature move: when [active] turns on, a band of light crosses the
/// child diagonally, like headlights catching retroreflective tape.
///
/// Plays twice and settles. Under reduced motion it renders nothing extra —
/// the arrival is still announced by the surrounding UI.
class OdblaskSweep extends HookWidget {
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
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: RcbMotion.sweep);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    // Plays on mount when already active, and whenever it turns on.
    useEffect(() {
      if (!active || reduceMotion) return null;
      var cancelled = false;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        for (var pass = 0; pass < 2 && !cancelled; pass++) {
          await controller.forward(from: 0);
        }
      });
      return () => cancelled = true;
    }, [active]);

    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        if (!controller.isAnimating) return child!;
        final t = RcbMotion.standard.transform(controller.value);
        // Band travels from beyond the top-left to beyond the bottom-right.
        final centre = -0.6 + t * 2.2;
        final light = Colors.white.withValues(alpha: intensity);
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
