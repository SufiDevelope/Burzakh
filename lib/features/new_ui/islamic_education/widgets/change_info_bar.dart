// Navigation Bar Widget
import 'package:flutter/material.dart';

class InfoNavigationBar extends StatelessWidget {
  final int activeSection;
  final Function(int) onSectionPressed;

  const InfoNavigationBar({
    Key? key,
    required this.activeSection,
    required this.onSectionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final sectionNum = index + 1;
          final String label = isSmallScreen
              ? ""
              : sectionNum == 1
              ? "Death"
              : sectionNum == 2
              ? "Burial"
              : sectionNum == 3
              ? "Ascension"
              : sectionNum == 4
              ? "Questions"
              : "Barzakh";

          return Container(
            width: 40,
            child: TextButton(
              onPressed: () => onSectionPressed(sectionNum),
              style: TextButton.styleFrom(
                backgroundColor: activeSection == sectionNum
                    ? Colors.teal.shade50
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal:8,
                  vertical: 8,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: activeSection == sectionNum
                          ? Colors.teal[700]
                          : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        sectionNum.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: activeSection == sectionNum
                              ? Colors.white
                              : Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  if (label.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: activeSection == sectionNum
                            ? Colors.teal[800]
                            : Colors.grey[700],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
