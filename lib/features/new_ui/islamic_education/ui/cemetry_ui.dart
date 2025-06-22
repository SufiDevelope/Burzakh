// ignore_for_file: deprecated_member_use

import 'package:burzakh/features/new_ui/islamic_education/ui/sadqah_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di_container.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../dashboard/presentation/controller/cubit.dart';
import '../widgets/cemetry_widgets.dart';

class CemeteryEtiquettePage extends StatefulWidget {
  @override
  _CemeteryEtiquettePageState createState() => _CemeteryEtiquettePageState();
}

class _CemeteryEtiquettePageState extends State<CemeteryEtiquettePage> {
  // State variables
  String? activeSection;
  bool showScrollTop = false;
  String? hoveredCard;
  final ScrollController _scrollController = ScrollController();

  // Section data for content
  final List<Map<String, dynamic>> sections = [
    {
      'id': 'before',
      'title': 'Before Visiting',
      'icon': Icons.access_time,
      'isWarning': false,
      'items': [
        "Check cemetery visiting hours before arriving",
        "Dress modestly and respectfully",
        "Prepare mentally for a solemn and reflective visit"
      ]
    },
    {
      'id': 'during',
      'title': 'During Your Visit',
      'icon': Icons.remove_red_eye,
      'isWarning': false,
      'items': [
        "Enter the cemetery with respectful awareness",
        "Walk respectfully and quietly between graves, avoiding stepping on or sitting on them",
        "Lower your gaze and maintain a solemn demeanor",
        "Keep conversation minimal and respectful"
      ]
    },
    {
      'id': 'prohibited',
      'title': 'Prohibited Actions',
      'icon': Icons.warning_amber_rounded,
      'isWarning': true,
      'items': [
        "Do not sit, lean, or step on graves",
        "Avoid loud conversations, laughing, or using mobile phones",
        {"text": "Do not take photographs or videos during burial", "important": true},
        "Do not eat or drink in the cemetery",
        {"text": "Do not build permanent structures on graves or plant trees on them", "important": true},
        "Do not light candles or place forbidden items"
      ]
    },
    {
      'id': 'recommended',
      'title': 'Recommended Etiquette',
      'icon': Icons.check_circle_outline,
      'isWarning': false,
      'items': [
        "Maintain a quiet, respectful demeanor throughout your visit",
        "Take time for quiet reflection and remembrance",
        "Be considerate of others who may be grieving",
        "Follow cemetery-specific rules about visiting hours and conduct"
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Detect scroll position for back-to-top button
  void _scrollListener() {
    if (_scrollController.offset > 150) {
      if (!showScrollTop) {
        setState(() {
          showScrollTop = true;
        });
      }
    } else {
      if (showScrollTop) {
        setState(() {
          showScrollTop = false;
        });
      }
    }
  }

  // Scroll to top function
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Toggle section expansion
  void _toggleSection(String sectionId) {
    setState(() {
      if (activeSection == sectionId) {
        activeSection = null;
      } else {
        activeSection = sectionId;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define colors
    final primaryColor = Color(0xFF053B30);
    final richGold = Color(0xFFAD8442);
    final lightGold = Color(0xFFD9C9A8);
    final mainText = Color(0xFF1A1914);
    final subtleText = Color(0xFF5F5A51);
    final placeholderText = Color(0xFFA9A49E);
    final cardBackground = Color(0xFFFFFDFA).withOpacity(0.95);


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFBF7F2), Color(0xFFF2EDE6)],
          ),
        ),
        child: Stack(
          children: [
            // Main content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Bar with back button
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // var dashboardCubit=DiContainer().sl<DashboardCubit>();
                      // dashboardCubit.getIndex(0);
                    },
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom decoration line
                      Stack(
                        children: [
                          Positioned(
                            left: -4,
                            top: -6,
                            child: Container(
                              width: 48,
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [richGold, richGold.withOpacity(0)],
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Cemetery Etiquette'.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: mainText,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Appropriate behavior and practices'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: subtleText,
                        ),
                      ),
                    ],
                  ),
                  expandedHeight: 0,
                  toolbarHeight: 70,
                ),

                // Content area
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Key Points Summary


                      Container(
                        margin: EdgeInsets.only(bottom: 16, top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          border: Border(
                            top: BorderSide(color: lightGold, width: 1),
                            right: BorderSide(color: lightGold, width: 1),
                            bottom: BorderSide(color: lightGold, width: 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 12,
                              color: Colors.black.withOpacity(0.04),
                            ),
                          ],
                        ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: cardBackground,
                            borderRadius: BorderRadius.circular(12),
                            // border: Border.all(color: lightGold),
                            border: Border(
                              left: BorderSide(color: primaryColor, width: 3),
                            ),


                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KEY POINTS'.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(height: 12),
                              buildKeyPoint('Keep graves simple without structures or plantings'.tr()),
                              SizedBox(height: 8),
                              buildKeyPoint('Maintain quiet, respectful behavior during visits'.tr()),
                              SizedBox(height: 8),
                              buildKeyPoint('Benefit the deceased with prayers and charity, not decorations'.tr()),
                            ],
                          ),
                        ),
                      ),

                      // Introduction
                      buildIntroductionCard(),
                      SizedBox(height: 20),

                      // Section cards
                      ...sections.map((section) =>
                          buildSectionCard(
                            section['id'],
                            section['title'],
                            section['icon'],
                            section['isWarning'],
                            section['items'],
                            primaryColor,
                            richGold,
                            lightGold,
                            mainText,
                            subtleText,
                            cardBackground,
                                  ()=> _toggleSection(section['id']),
                              activeSection == section['id'] ? _calculateListHeight(section['items']) : 0,
                              activeSection == section['id'] ? 0.5 : 0,
                          )
                      ).toList(),

                      // Important Grave Prohibitions
                      buildGraveProhibitionsCard(
                        primaryColor,
                        richGold,
                        lightGold,
                        mainText,
                        subtleText,
                        cardBackground,
                      ),

                      // Note at bottom
                      Container(
                        margin: EdgeInsets.only(top: 24, bottom: 100),
                        alignment: Alignment.center,
                        child: Text(
                          'Please note that cemetery policies may vary. Always respect specific rules established by cemetery administration.'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            color: placeholderText,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),

            // Back to top button
            if (showScrollTop)
              Positioned(
                bottom: 96,
                right: 16,
                child: InkWell(
                  onTap: _scrollToTop,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

            // Bottom Action Button
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     padding: EdgeInsets.all(16).copyWith(
            //       bottom: 16 + MediaQuery.of(context).padding.bottom,
            //     ),
            //     decoration: BoxDecoration(
            //       color: cardBackground,
            //       boxShadow: [
            //         BoxShadow(
            //           offset: Offset(0, -4),
            //           blurRadius: 10,
            //           color: Colors.black.withOpacity(0.03),
            //         ),
            //       ],
            //       border: Border(
            //         top: BorderSide(color: lightGold, width: 1),
            //       ),
            //     ),
            //     child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(context, MaterialPageRoute(builder: (context) => SadaqahJariyahPage(),));
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: AppColor.buttonColor,
            //         foregroundColor: Colors.white,
            //         elevation: 2,
            //         padding: EdgeInsets.symmetric(vertical: 14),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(Icons.download, size: 16,color: Colors.white,),
            //           SizedBox(width: 8),
            //           Text(
            //             'Download Guidelines',
            //             style: TextStyle(
            //               fontSize: 14,
            //               fontWeight: FontWeight.w500,
            //               letterSpacing: 0.8,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Calculate the height needed for each list
  double _calculateListHeight(List items) {
    // Base padding
    double height = 24;

    // Add height for each item
    for (var item in items) {
      // Calculate based on text length
      String text = item is Map ? item['text'] : item;
      int lines = (text.length / 30).ceil(); // Approximate line count
      height += lines * 20 + 12; // line height + padding
    }

    return height;
  }

}