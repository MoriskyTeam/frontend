import 'package:dynamic_rcb_alerts/core/theme/rcb_colors.dart';
import 'package:flutter/material.dart';

/// The resident's position: a hi-vis dot ringed in asphalt, with a 2 km
/// "around me" radius drawn separately by the map.
class UserLocationMarker extends StatelessWidget {
  const UserLocationMarker({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: RcbColors.hiVis,
            shape: BoxShape.circle,
            border: Border.all(color: RcbColors.asphalt, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4D16181B),
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
