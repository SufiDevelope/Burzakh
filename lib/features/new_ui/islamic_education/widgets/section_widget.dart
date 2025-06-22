import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final int number;
  final String title;
  final Widget content;
  final bool isActive;
  bool? isShowLine;

   Section({
    Key? key,
    required this.number,
     this.isShowLine,
    required this.title,
    required this.content,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive ? Colors.teal[700] : Colors.teal[600],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            isShowLine==true?      Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ): Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title.tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            isShowLine==true? Expanded(
              flex: 1,
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade700.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ):SizedBox(),
          ],
        ),
        const SizedBox(height: 24),

        // Section Content
        content,
      ],
    );
  }
}
