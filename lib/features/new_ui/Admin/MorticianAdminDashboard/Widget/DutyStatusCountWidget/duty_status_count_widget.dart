import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DutyStatusCountWidget extends StatelessWidget {
  final int count;
  final String label;

  const DutyStatusCountWidget({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    Color getLabelColor() {
      if (label == "Pending") {
        return const Color(0xFFEF4444);
      } else if (label == "Completed Today") {
        return const Color(0xFF22C55E);
      } else {
        return const Color(0xFF475569);
      }
    }

    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.bold,
            color: getLabelColor(),
          ),
        ),
        Text(
          label.tr(),
          style: TextStyle(
            fontSize: context.mh * 0.011,
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
