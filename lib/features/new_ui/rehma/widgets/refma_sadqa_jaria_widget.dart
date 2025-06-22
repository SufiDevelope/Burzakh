import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';
import '../../islamic_education/ui/sadqah_ui.dart';

class RehmaSadqaJariaWidget extends StatelessWidget {
  const RehmaSadqaJariaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFAF6F0),
            Color(0xFFFFF8EC),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: const Color(0x339A7B4F),
          width: 1,
        ),
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
                    color: const Color(0x269A7B4F),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: context.mh * 0.024,
                    color: Color(0xff8b6f48),
                  ),
                ),
                0.017.pw(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Sadaqah Jariyah",
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                        fontFamily: 'ns',
                      ),
                      AppText(
                        text: "Ongoing charity that benefits the deceased",
                        fontSize: context.mh * 0.012,
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            0.012.ph(context),
            AppText(
              text:
                  "Donate charity on behalf of the deceased, providing continuous rewards in the afterlife.",
              fontSize: context.mh * 0.014,
              color: Color(0xFF666666),
              fontFamily: 'nr',
            ),
            0.012.ph(context),
            Container(
              width: context.mw,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SadaqahJariyahPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8b6f48),
                  // padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: AppText(
                  text: "Explore Donation Options",
                  fontSize: context.mh * 0.014,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
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
