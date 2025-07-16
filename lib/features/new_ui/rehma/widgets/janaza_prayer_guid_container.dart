import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/rehma/ui/janaza_prayer_guide.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/under_construction_dialog.dart';
import 'package:flutter/material.dart';

class JanazaPrayerGuidContainer extends StatelessWidget {
  const JanazaPrayerGuidContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // EnhancedColors.secondary,
            Color(0xFF8A6E47),
            Color(0xFFa98246),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: context.mw * 0.12 ,
                  height: context.mw * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child:  Icon(
                    Icons.book_outlined,
                    size: context.mh * 0.024,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text:
                        "Janazah Prayer Guide",
                          fontSize: context.mh * 0.016,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        fontFamily: 'ns',
                      ),
                      AppText(text:
                        "Essential guidance for the final prayers",
                          fontSize: context.mh * 0.014,
                          color: Colors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            0.016.ph(context),
            AppText(text:
              "Learn the complete step-by-step process for performing the funeral prayer according to Islamic traditions.",

                fontSize: context.mh * 0.014,
                color: Colors.white.withOpacity(0.9),
            ),
            0.016.ph(context),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JanazaPrayerGuide(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.white ,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 8,
              ),
              child: AppText(text:
                "View Complete Guide",
                  fontSize: context.mh * 0.014,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8A6E47),
                fontFamily: 'ns',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
