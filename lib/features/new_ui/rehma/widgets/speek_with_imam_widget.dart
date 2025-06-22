import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/under_construction_dialog.dart';

class SpeekWithImamWidget extends StatelessWidget {
  const SpeekWithImamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // EnhancedColors.secondary,
            AppColor.darkGreen,
            AppColor.primary(),
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
                  width: context.mw * 0.12,
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
                    Icons.person,
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
                      "Speak with an Imam",
                        fontSize: context.mh * 0.017 ,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'ns',
                      ),
                      AppText(text:
                      "Personal spiritual guidance",
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
            "For personalized spiritual guidance and support during this difficult time, you can request to speak with an imam who will provide comfort and religious counsel.",

              fontSize: context.mh * 0.014,
              color: Colors.white.withOpacity(0.9),
            ),
            0.016.ph(context),

            Container(
              width: context.mw ,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => UnderConstructionDialog(),);
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
                "Request Imam Consultation",
                  fontSize: context.mh * 0.014,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen,
                  fontFamily: 'ns',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
