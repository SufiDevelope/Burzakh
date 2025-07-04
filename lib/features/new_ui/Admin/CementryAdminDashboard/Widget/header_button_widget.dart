import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class HeaderButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const HeaderButtonWidget({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: context.mh * 0.03),
      label: label.isNotEmpty
          ? Text(
              label,
              style:  TextStyle(fontSize: context.mh * 0.015),
            )
          : const SizedBox.shrink(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding:  EdgeInsets.symmetric(horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
      ),
    );
  }
}
