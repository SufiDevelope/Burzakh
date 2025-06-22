import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/islamic_education/ui/cemetry_ui.dart';
import 'package:burzakh/features/new_ui/islamic_education/ui/journy_after_death_ui.dart';
import 'package:burzakh/features/new_ui/rehma/ui/word_for_comfort_screen.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/janaza_prayer_guid_container.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/refma_sadqa_jaria_widget.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/rehma_header.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/speek_with_imam_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../islamic_education/ui/dua_screen.dart';
import '../widgets/sacred_resouce_widget.dart';

class RehmaScreen extends StatelessWidget {
  const RehmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          children: [
            RehmaHeader(),
            0.016.ph(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      JanazaPrayerGuidContainer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: context.mw * 0.04,
                              height: context.mw * 0.04,
                              decoration: BoxDecoration(
                                color: Color(0xFF8A6E47),
                                shape: BoxShape.circle,
                              ),
                            ),
                            0.016.pw(context),
                            Text(
                              "Sacred Resources".tr(),
                              style: TextStyle(
                                fontSize: context.mh * 0.016,
                                fontWeight: FontWeight.w600,
                                color: AppColor.darkGreen,
                              ),
                            ),
                          ],
                        ),
                      ),

                      buildResourceCard(
                        icon: Icons.book_outlined,
                        title: "Words of Comfort",
                        subtitle: "Comforting hadith and Quranic verses",
                        bgColor: const Color(0x1A4A6FA5),
                        iconColor: Color(0xff4a6fa5),
                        buttonLabel: "Read Verses",
                        buttonColor: Color(0xff4a6fa5),
                        buttonBgColor: const Color(0x1A4A6FA5),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WordsOfComfortScreen(),
                              ));
                        },
                        context: context,
                      ),

                      // Du'a
                      buildResourceCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DuaCollectionScreen(),
                              ));
                        },
                        icon: Icons.circle_outlined,
                        title: "Du'a",
                        subtitle: "Prayers and dua for the deceased",
                        bgColor: const Color(0x1A1A6D53),
                        iconColor: Color(0xff1a6d53),
                        buttonLabel: "View Du'as",
                        buttonColor: Color(0xff1a6d53),
                        buttonBgColor: const Color(0x1A1A6D53),
                        context: context,
                      ),
                      RehmaSadqaJariaWidget(),
                      buildResourceCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JourneyAfterDeath(),
                              ));
                        },
                        icon: Icons.public,
                        title: "Path to Eternity",
                        subtitle:
                            "From the moment of passing to life in Barzakh",
                        buttonLabel: 'Learn More',
                        bgColor: const Color(0x1A4A6FA5),
                        iconColor: Color(0xff4a6fa5),
                        buttonColor: Color(0xff4a6fa5),
                        buttonBgColor: const Color(0x1A4A6FA5),
                        context: context,
                      ),
                      buildResourceCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CemeteryEtiquettePage(),
                              ));
                        },
                        icon: Icons.close,
                        title: "Cemetery Etiquette",
                        subtitle:
                            "Appropriate behavior when visiting the cemetery",
                        bgColor: const Color(0x1A1A6D53),
                        iconColor: Color(0xff1a6d53),
                        buttonLabel: "View Guidlines",
                        buttonColor: Color(0xff1a6d53),
                        buttonBgColor: const Color(0x1A1A6D53),
                        context: context,
                      ),
                      SpeekWithImamWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
