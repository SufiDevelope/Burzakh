import 'dart:developer';

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/journey_actionButton.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/journey_title_widget.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/on_going_benifit.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/refrence-model_widget.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/search_widget.dart';
import 'package:burzakh/features/new_ui/islamic_education/widgets/time_line_modal_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/features/new_ui/islamic_education/ui/journy_after_death_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/change_info_bar.dart';
import '../widgets/journey_video_section.dart';
import '../widgets/scholar_info.dart';
import '../widgets/section_widget.dart';
// import 'package:google_fonts/google_fonts.dart';





class JourneyAfterDeath extends StatefulWidget {
  const JourneyAfterDeath({Key? key}) : super(key: key);

  @override
  State<JourneyAfterDeath> createState() => _JourneyAfterDeathState();
}

class _JourneyAfterDeathState extends State<JourneyAfterDeath> {
  int activeSection = 1;
  bool showReferences = false;
  bool showTimeline = false;
  bool showSearch = false;
  String searchQuery = '';
  List<Map<String, dynamic>> searchResults = [];
  bool isVideoPlaying = false;
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Determine active section based on scroll position
    final scrollOffset = _scrollController.offset + 200;

    for (int i = 4; i >= 0; i--) {
      final RenderObject? renderObject = sectionKeys[i].currentContext?.findRenderObject();
      if (renderObject != null && renderObject is RenderBox) {
        final position = renderObject.localToGlobal(Offset.zero);
        if (scrollOffset >= position.dy) {
          if (activeSection != i + 1) {
            setState(() {
              activeSection = i + 1;
            });
          }
          break;
        }
      }
    }
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;

      if (query.isEmpty) {
        searchResults = [];
        return;
      }

      final results = <Map<String, dynamic>>[];
      final sections = [
        "Moment of Death",
        "Preparation for Burial",
        "Soul's Ascension",
        "Questioning in the Grave",
        "Life in Barzakh"
      ];

      // Simulate search results
      for (int i = 0; i < sections.length; i++) {
        final title = sections[i];
        if (title.toLowerCase().contains(query.toLowerCase())) {
          results.add({
            'id': 'section-${i + 1}',
            'title': title,
            'snippet': '${"Information about".tr()} ${"${title.toLowerCase()}".tr()}'
          });
        }
      }

      searchResults = results;
    });
  }

  void scrollToSection(int sectionIndex) {
    final RenderObject? renderObject =
    sectionKeys[sectionIndex - 1].currentContext?.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      final position = renderObject.localToGlobal(Offset.zero);
      _scrollController.animateTo(
        position.dy - 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToSection1(int sectionIndex) {
    final keyContext = sectionKeys[sectionIndex - 1].currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());

      final offset = _scrollController.offset + position.dy - 100;

      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Main content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Bar
                SliverAppBar(
                  pinned: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 70,
                  titleSpacing: 0,
                  leadingWidth: 60,
                  leading: IconButton(
                    icon:  Icon(Icons.arrow_back_ios_rounded,size: 18,color: AppColor.greyLight(),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: JourneyTitleWidget(),

                  actions: [
                    JourneyActionbutton(searchTap:  () => setState(() => showSearch = true), timeLineTap:  () => setState(() => showTimeline = true), downloadTap: (){}),
                  ],
                ),

                // Main content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Introduction
                        Text(
                          "The soul's journey does not end with death — it begins a new chapter. Islam teaches us that when a Muslim passes away, they embark on a profound journey toward the eternal afterlife. This knowledge, passed down through the Quran and authentic teachings of Prophet Muhammad ﷺ, offers both comfort to those grieving and guidance for our own preparation.".tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 25,),

                        // Featured Video
                        VideoSection(
                          onPlayPressed: () {
                            log("75234");
                            setState(() => isVideoPlaying = true);
                          },
                        ),

                        const SizedBox(height: 24),

                        // Scholar Information
                        const ScholarInfo(),

                        const SizedBox(height: 24),

                        // Navigation Bar
                        InfoNavigationBar(
                          activeSection: activeSection,
                          onSectionPressed: (section) {
                            setState(() => activeSection = section);
                            log("sec43v $section");
                            scrollToSection1(section);
                          },
                        ),

                        const SizedBox(height: 40),

                        // Main Content Sections
                        // Section 1: Moment of Death
                        Section(
                          key: sectionKeys[0],
                          number: 1,
                          isShowLine: true,
                          title: "Moment of Death",
                          isActive: activeSection == 1,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "At the moment of death, the soul gently leaves the body. The Prophet Muhammad ﷺ said that the eyes remain fixed, looking toward the departing soul. For the believer, this moment is described as peaceful, like the drawing of a hair from flour.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "Angels come to receive the soul of the believer with gentleness and mercy. The soul is described as having a pleasant scent, and the angels wrap it in shrouds of Paradise and carry it upward.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                               QuoteBlock(
                                text: "And the intoxication of death will bring the truth; that is what you were trying to avoid.".tr(),
                                source: "Quran 50:19".tr(),
                              ),
                              const SizedBox(height: 24),
                               Text(
                                "This powerful verse reminds us that death brings forth absolute truth and reality. The word \"intoxication\" (sakrah) suggests that death has an overwhelming quality that removes the veils of heedlessness. In that moment, the reality that some may have been avoiding or denying throughout their lives becomes unmistakably clear.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "The scholars explain that at this moment, the dying person sees their final destination - either Paradise or Hellfire. They may see angels of mercy or angels of punishment depending on their state. The Prophet Muhammad ﷺ taught that a believer's soul departs with ease, while for others, the departure may be more difficult.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Section 2: Preparation for Burial
                        Section(
                          key: sectionKeys[1],
                          number: 2,
                          title: "Preparation for Burial",
                          isActive: activeSection == 2,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "The body is treated with utmost respect and dignity. It is gently washed (ghusl), typically three or more times with water and lotus leaves or camphor, by family members of the same gender or those knowledgeable in Islamic washing rituals.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "After washing, the body is wrapped in simple white shrouds (kafan) - three layers for men and five for women. The shrouding is done with simplicity, regardless of the person's status in life, as a reminder of our equality in death.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                               HadithBox(
                                title: "Hadith on Intercession of Funeral Prayer".tr(),
                                text: "If a company of Muslims numbering forty, who do not associate anything with Allah, pray over a deceased person, Allah will accept their intercession for him.".tr(),
                                source: "Sahih Muslim".tr(),
                              ),
                              const SizedBox(height: 24),
                               Text(
                                "The funeral prayer (Salat al-Janazah) is performed by the community, seeking forgiveness for the deceased and mercy from Allah. This prayer is unique as it is performed standing, without bowing or prostration.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "This powerful hadith emphasizes the importance of community gathering for the funeral prayer, as the collective prayers of forty sincere believers serve as an effective intercession for the deceased. It is for this reason that Muslims are encouraged to attend funeral prayers even for those they may not personally know.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Section 3: The Soul's Ascension
                        Section(
                          key: sectionKeys[2],
                          number: 3,
                          title: "The Soul's Ascension",
                          isActive: activeSection == 3,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "According to Islamic traditions, the soul of a believer ascends through the heavens. At each heaven, the Prophet Muhammad ﷺ described that the soul is greeted and welcomed until it reaches the seventh heaven.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "The soul is then presented before Allah, where the record of deeds is acknowledged. For the righteous, there is joy and honor in this meeting, while for those who led sinful lives, this can be a moment of regret and sorrow.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                              const QuoteBlock(
                                text: "Every soul shall taste death. And only on the Day of Resurrection shall you be paid your wages in full.",
                                source: "Quran 3:185",
                              ),
                              const SizedBox(height: 24),
                               Text(
                                "After this presentation, the soul is returned to the body in the grave to experience the next phase of the journey - life in Barzakh. This return is described as a reunion of the soul with its physical form, albeit in a different manner than during worldly life.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Section 4: Questioning in the Grave
                        Section(
                          key: sectionKeys[3],
                          number: 4,
                          title: "Questioning in the Grave",
                          isActive: activeSection == 4,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "After burial, the deceased is visited by two angels, Munkar and Nakir, who sit the person up and question them about their faith. The fundamental questions are: \"Who is your Lord? What is your religion? Who is your Prophet?\"".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "A believer will answer confidently: \"Allah is my Lord, Islam is my religion, and Muhammad is my Prophet.\" The Prophet ﷺ said that Allah will keep the believers firm with the right words in this critical moment.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "This questioning is the first test of the afterlife and determines the immediate experience of the soul in Barzakh. For the believers who answer correctly, the grave will be expanded and filled with light. For others, the grave becomes a place of constriction and darkness.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                              InfoBox(
                                child: Text(
                                  "The Prophet Muhammad ﷺ taught that believers should frequently remember death, as it serves as a reminder of our ultimate return to Allah. This remembrance helps us prepare for this questioning by strengthening our faith and living according to Islamic teachings.".tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.6,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Section 5: Life in Barzakh
                        Section(
                          key: sectionKeys[4],
                          number: 5,
                          title: "Life in Barzakh",
                          isActive: activeSection == 5,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Barzakh is the intermediate state between death and resurrection, a realm where souls reside until the Day of Judgment. The Prophet Muhammad ﷺ taught that the grave will either be a garden from the gardens of Paradise or a pit from the pits of Hellfire.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                               Text(
                                "For the righteous, their graves are expanded as far as the eye can see, filled with light and comfort. They are shown their place in Paradise each morning and evening. The souls of martyrs are in the form of green birds that fly freely in Paradise.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                               QuoteBlock(
                                text: "And do not say about those who are killed in the way of Allah, 'They are dead.' Rather, they are alive, but you perceive it not.".tr(),
                                source: "Quran 2:154",
                              ),
                              const SizedBox(height: 24),
                               Text(
                                "The deceased can hear the footsteps of those who leave after burial and are aware of visits by the living to their graves. They benefit from the prayers, charity, and good deeds performed on their behalf.".tr(),
                                style: TextStyle(fontSize: 16, height: 1.6),
                              ),
                              const SizedBox(height: 24),
                              const OngoingBenefits(),
                            ],
                          ),
                        ),

                        // Footer
                        Padding(
                          padding: const EdgeInsets.only(top: 60, bottom: 40),
                          child: Column(
                            children: [
                               Text(
                                "This information is based on authentic sources from the Quran and Sunnah, though some aspects of the afterlife remain part of the unseen knowledge that only Allah possesses completely.".tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Center(
                                child: TextButton.icon(
                                  onPressed: () => setState(() => showReferences = true),
                                  icon: Icon(Icons.article_outlined, color: Colors.teal[700]),
                                  label: Text(
                                    "View References".tr(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal[700],
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    backgroundColor: Colors.teal[50],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              // SizedBox(
                              //   width: double.infinity,
                              //   height: 56,
                              //   child: ElevatedButton.icon(
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.share),
                              //     label: const Text(
                              //       "Share This Knowledge",
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.w600,
                              //       ),
                              //     ),
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: Colors.teal[700],
                              //       foregroundColor: Colors.white,
                              //       elevation: 2,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(12),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Modals
            if (showReferences) ReferencesModal(
              onClose: () => setState(() => showReferences = false),
            ),

            if (showSearch) SearchModal(
              onClose: () => setState(() => showSearch = false),
              searchQuery: searchQuery,
              onSearchQueryChanged: handleSearch,
              searchResults: searchResults,
              onResultSelected: (result) {
                setState(() {
                  showSearch = false;
                  final sectionNum = int.parse(result['id'].toString().split('-')[1]);
                  activeSection = sectionNum;
                });
                scrollToSection(activeSection);
              },
            ),

            if (showTimeline) TimelineModal(
              onClose: () => setState(() => showTimeline = false),
              activeSection: activeSection,
              onSectionSelected: (section) {
                setState(() {
                  showTimeline = false;
                  activeSection = section;
                });
                scrollToSection(section);
              },
            ),
          ],
        ),
      ),
    );
  }
}


// Section Widget

// Quote Block Widget
class QuoteBlock extends StatelessWidget {
  final String text;
  final String source;

  const QuoteBlock({
    Key? key,
    required this.text,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          left: BorderSide(
            color: Colors.teal.shade500,
            width: 4,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\"${"$text".tr()}\"",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.grey[800],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 24,
                height: 2,
                color: Colors.teal[500],
              ),
              const SizedBox(width: 8),
              Text(
                source.tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Hadith Box Widget
class HadithBox extends StatelessWidget {
  final String title;
  final String text;
  final String source;

  const HadithBox({
    Key? key,
    required this.title,
    required this.text,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.amber.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:2.0),
                child: Icon(
                  Icons.menu_book,
                  size: 20,
                  color: Colors.amber[800],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "\"$text\"",
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "— $source",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.amber[700],
            ),
          ),
        ],
      ),
    );
  }
}

// Info Box Widget
class InfoBox extends StatelessWidget {
  final Widget child;

  const InfoBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.info_outline,
              size: 24,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: child),
        ],
      ),
    );
  }
}
