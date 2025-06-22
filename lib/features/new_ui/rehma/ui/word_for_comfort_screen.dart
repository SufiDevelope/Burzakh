// words_of_comfort_screen.dart
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/AppColor.dart';
// import 'package:share_plus/share_plus.dart';

// Import other app files (like app colors)
// import 'app_colors.dart';

// You can use these colors or import from your existing app_colors file
class AppColors {
  // Light theme
  static const Color primary = Color(0xFF1A4D3D);
  static const Color primaryLight = Color(0xFF2D7A62);
  static const Color primaryLighter = Color(0xFFE8F3F0);
  static const Color secondary = Color(0xFFD9A65E);
  static const Color secondaryLight = Color(0xFFF5EEE1);
  static const Color textDark = Color(0xFF333333);
  static const Color textMedium = Color(0xFF555555);
  static const Color textLight = Color(0xFF777777);
  static const Color background = Color(0xFFFAF8F3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFEAE7E0);
  static const Color quranBg = Color(0xFFE8EEF5);
  static const Color quranAccent = Color(0xFF597DA0);
  static const Color hadithBg = Color(0xFFF0EFE9);
  static const Color hadithAccent = Color(0xFF8C7851);

  // Dark theme
  static const Color primaryDark = Color(0xFF2D7A62);
  static const Color primaryLightDark = Color(0xFF3D9A82);
  static const Color primaryLighterDark = Color(0xFF1A352D);
  static const Color secondaryDark = Color(0xFFE9B66E);
  static const Color secondaryLightDark = Color(0xFF3D3019);
  static const Color textDarkDark = Color(0xFFE0E0E0);
  static const Color textMediumDark = Color(0xFFB0B0B0);
  static const Color textLightDark = Color(0xFF808080);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color whiteDark = Color(0xFF1E1E1E);
  static const Color borderDark = Color(0xFF2C2C2C);
  static const Color quranBgDark = Color(0xFF1A2431);
  static const Color quranAccentDark = Color(0xFF83A7CE);
  static const Color hadithBgDark = Color(0xFF2D2A20);
  static const Color hadithAccentDark = Color(0xFFC1AF7E);
}

// Define comfort item data model
class ComfortItem {
  final int id;
  final String title;
  final String source;
  final String reference;
  final String arabicText;
  final String translation;
  final String context;
  final ComfortType type;
  bool isFavorite;

  ComfortItem({
    required this.id,
    required this.title,
    required this.source,
    required this.reference,
    required this.arabicText,
    required this.translation,
    required this.context,
    required this.type,
    this.isFavorite = false,
  });
}

enum ComfortType { quran, hadith }

// Main screen widget
class WordsOfComfortScreen extends StatefulWidget {
  @override
  _WordsOfComfortScreenState createState() => _WordsOfComfortScreenState();
}

class _WordsOfComfortScreenState extends State<WordsOfComfortScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // App Bar
            SliverAppBar(
              pinned: false,
              backgroundColor: AppColor.bgPrimary() ,
              elevation: 1,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text:
                    'Words of Comfort',
                      color:  AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    fontFamily: 'ns',
                  ),
                  AppText(text:
                    'كلمات المواساة',
                      fontSize: 14,
                      color:AppColors.textLight,
                  ),
                ],
              ),
              leading: IconButton(
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.primaryLighterDark : AppColors.primaryLighter,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: isDarkMode ? AppColors.primaryDark : AppColors.primary,
                    size: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // actions: [
              //   IconButton(
              //     icon: Container(
              //       padding: EdgeInsets.all(8),
              //       decoration: BoxDecoration(
              //         color: isDarkMode ? AppColors.primaryLighterDark : AppColors.primaryLighter,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Icon(
              //         Icons.settings,
              //         color: isDarkMode ? AppColors.primaryDark : AppColors.primary,
              //         size: 20,
              //       ),
              //     ),
              //     onPressed: () {
              //       // Show settings
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text('Settings button pressed')),
              //       );
              //     },
              //   ),
              // ],
            ),

            // Introduction Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntroCard(),
              ),
            ),

            // Quranic Verses Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: CategoryTitle(title: 'Comforting Verses from the Quran'),
              ),
            ),

            // Quranic Verses List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = quranVerses[index];
                  return ComfortCard(
                    item: item,
                    onFavoriteChanged: (value) {
                      setState(() {
                        item.isFavorite = value;
                      });
                    },
                  );
                },
                childCount: quranVerses.length,
              ),
            ),

            // Hadiths Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: CategoryTitle(title: 'Comforting Hadiths'),
              ),
            ),

            // Hadiths List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = hadithNarrations[index];
                  return ComfortCard(
                    item: item,
                    onFavoriteChanged: (value) {
                      setState(() {
                        item.isFavorite = value;
                      });
                    },
                  );
                },
                childCount: hadithNarrations.length,
              ),
            ),

            // Bottom padding
            SliverPadding(
              padding: EdgeInsets.only(bottom: 80),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primary,
      //   child: Icon(Icons.add, color: Colors.white),
      //   onPressed: () {
      //     // Add new comfort item logic
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Add new comfort item')),
      //     );
      //   },
      // ),
    );
  }
}

// Introduction Card Widget
class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none
        // side: BorderSide(
        //   color: AppColors.secondary,
        //   width: 4,
        //   // style: BorderSide.strokeAlignInside,
        // ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(left: BorderSide(width: 3,color:AppColors.secondary ))
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -10,
              child: AppText(text:
                '❝',
                  fontSize: 100,
                  color: AppColors.secondary.withOpacity(0.1),
                  fontFamily: 'ns',
              ),
            ),
            AppText(text:
              'In times of grief and loss, the Quran and Hadith offer timeless words of comfort and healing. This collection brings together verses and narrations that provide solace, perspective, and hope to help ease the pain of those who have lost loved ones.',

                color: AppColors.textMedium,
                fontSize: 15,
                height: 1.6,
            ),
          ],
        ),
      ),
    );
  }
}

// Category Title Widget
class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.secondary,
                  isDarkMode ? AppColors.primaryDark : AppColors.primary,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: AppText(text:
              '$title',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color:  AppColors.primary,
              fontFamily: 'ns',
            ),
          ),
        ],
      ),
    );
  }
}

// Comfort Card Widget
class ComfortCard extends StatelessWidget {
  final ComfortItem item;
  final ValueChanged<bool> onFavoriteChanged;

  const ComfortCard({
    Key? key,
    required this.item,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Determine colors based on type
    final bgColor = item.type == ComfortType.quran
        ? (isDarkMode ? AppColors.quranBgDark : AppColors.quranBg)
        : (isDarkMode ? AppColors.hadithBgDark : AppColors.hadithBg);

    final accentColor = item.type == ComfortType.quran
        ? (isDarkMode ? AppColors.quranAccentDark : AppColors.quranAccent)
        : (isDarkMode ? AppColors.hadithAccentDark : AppColors.hadithAccent);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color:  AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Type badge
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: bgColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: accentColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: AppText(text:
                        item.type == ComfortType.quran ? 'Quran' : 'Hadith',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: accentColor,
                        fontFamily: 'nm',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: AppText(text:
                        item.title,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColors.primaryDark : AppColors.primary,
                          letterSpacing: -0.2,
                        fontFamily: 'ns',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                // Source reference
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLighter,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            size: 14,
                            color:  AppColors.textMedium,
                          ),
                          SizedBox(width: 6),
                          AppText(text:
                            item.reference,
                              fontSize: 13,
                              color: AppColors.textMedium,

                          ),
                        ],
                      ),
                    ),

                    // Bookmark button
                    InkWell(
                      onTap: () {
                        onFavoriteChanged(!item.isFavorite);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondary.withOpacity(.2)
                        ),
                        child: Icon(
                          item.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Divider(
            height: 1,
            thickness: 1,
            color: isDarkMode ? AppColors.borderDark : AppColors.border,
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Arabic Text
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 3,color: accentColor.withOpacity(0.5))),
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Right border accent
                      // Positioned(
                      //   top: 0,
                      //   right: 0,
                      //   bottom: 0,
                      //   child: Container(
                      //     width: 4,
                      //     decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //         begin: Alignment.topCenter,
                      //         end: Alignment.bottomCenter,
                      //         colors: [
                      //           accentColor,
                      //           accentColor.withOpacity(0.5),
                      //         ],
                      //       ),
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(4),
                      //         bottomLeft: Radius.circular(4),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Arabic text
                      Text(
                        item.arabicText,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.amiri(
                          fontSize: 22,
                          height: 1.8,
                          color: accentColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Translation
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8),
                        AppText(text:
                          'TRANSLATION',
                            fontSize: 13,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color:AppColors.textLight,
                          fontFamily: 'ns',
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.only(left: 14),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: accentColor.withOpacity(0.4),
                            width: 2,
                          ),
                        ),
                      ),
                      child: AppText(text:
                        item.translation,
                          fontSize: 15,
                          color:AppColors.textDark,
                        fontFamily: 'nr',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Context
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: accentColor,
                          ),
                          SizedBox(width: 8),
                          AppText(text:
                            'Context & Reflection',
                              fontWeight: FontWeight.w600,
                              color: accentColor,
                            fontFamily: 'nb',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      AppText(text:
                        item.context,
                          fontSize: 14,
                          color:AppColors.textMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Actions
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDarkMode ? AppColors.borderDark : AppColors.border,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    icon: Icon(Icons.copy,color: AppColor.buttonColor,),
                    label: AppText(text:'Copy',fontFamily: 'nm',color: AppColor.buttonColor,),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      foregroundColor: isDarkMode ? AppColors.primaryDark : AppColors.primary,
                    ),
                    onPressed: () {
                      final textToCopy = "${item.arabicText}\n\n${item.translation}";
                      Clipboard.setData(ClipboardData(text: textToCopy));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Text copied to clipboard')),
                      // );
                    },
                  ),
                ),
                // Container(
                //   width: 1,
                //   height: 48,
                //   color: isDarkMode ? AppColors.borderDark : AppColors.border,
                // ),
                // Expanded(
                //   child: TextButton.icon(
                //     icon: Icon(Icons.save_alt),
                //     label: Text('Save'),
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.symmetric(vertical: 16),
                //       foregroundColor: isDarkMode ? AppColors.primaryDark : AppColors.primary,
                //     ),
                //     onPressed: () {
                //       // Save functionality
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Saved successfully')),
                //       );
                //     },
                //   ),
                // ),
                // Container(
                //   width: 1,
                //   height: 48,
                //   color: isDarkMode ? AppColors.borderDark : AppColors.border,
                // ),
                // Expanded(
                //   child: TextButton.icon(
                //     icon: Icon(Icons.share),
                //     label: Text('Share'),
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.symmetric(vertical: 16),
                //       foregroundColor: isDarkMode ? AppColors.primaryDark : AppColors.primary,
                //     ),
                //     onPressed: () {
                //       // final textToShare = "${item.title}\n\n${item.arabicText}\n\n${item.translation}";
                //       // Share.share(textToShare);
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Sample data for comfort items
final List<ComfortItem> quranVerses = [
  ComfortItem(
    id: 1,
    title: "Relief After Hardship",
    source: "Quran",
    reference: "Surah Ash-Sharh (94:5-6)",
    arabicText: "فَإِنَّ مَعَ الْعُسْرِ يُسْرًا. إِنَّ مَعَ الْعُسْرِ يُسْرًا",
    translation: "For indeed, with hardship [will be] ease. Indeed, with hardship [will be] ease.",
    context: "These powerful verses from Surah Ash-Sharh remind us that after every difficulty comes relief. The repetition emphasizes Allah's promise that hardship is always temporary and will be followed by ease. This offers profound comfort to those experiencing grief or loss, as it assures us that our pain will not last forever and that relief is already on its way.",
    type: ComfortType.quran,
  ),
  ComfortItem(
    id: 2,
    title: "Every Soul Shall Taste Death",
    source: "Quran",
    reference: "Surah Al-Anbiya (21:35)",
    arabicText: "كُلُّ نَفْسٍ ذَائِقَةُ الْمَوْتِ ۗ وَنَبْلُوكُمْ بِالشَّرِّ وَالْخَيْرِ فِتْنَةً ۖ وَإِلَيْنَا تُرْجَعُونَ",
    translation: "Every soul will taste death. And We test you with evil and with good as trial; and to Us you will be returned.",
    context: "This verse reminds us of the universal reality of death, which brings perspective to our grief. It helps us understand that the loss of loved ones is part of Allah's greater plan and the natural cycle of life. The verse also emphasizes that both good and difficult experiences are tests from Allah, and ultimately we all return to Him. This understanding can provide comfort by placing our temporary separation in the context of our eternal journey.",
    type: ComfortType.quran,
  ),
  ComfortItem(
    id: 3,
    title: "Angels Descend with Comfort",
    source: "Quran",
    reference: "Surah Fussilat (41:30)",
    arabicText: "إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنتُمْ تُوعَدُونَ",
    translation: "Indeed, those who have said, \"Our Lord is Allah\" and then remained on a right course - the angels will descend upon them, [saying], \"Do not fear and do not grieve but receive good tidings of Paradise, which you were promised.\"",
    context: "This beautiful verse describes how angels bring comfort to the believers who remain steadfast in their faith. During times of grief, this verse reminds us that the angels themselves bring messages of comfort, telling us not to fear or grieve. The verse emphasizes that remaining steadfast in faith - even during difficult times - brings divine comfort and the promise of Paradise. This can provide strength and reassurance when mourning loved ones.",
    type: ComfortType.quran,
  ),
  ComfortItem(
    id: 4,
    title: "Return to Your Lord",
    source: "Quran",
    reference: "Surah Al-Fajr (89:27-30)",
    arabicText: "يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ ارْجِعِي إِلَىٰ رَبِّكِ رَاضِيَةً مَرْضِيَّةً فَادْخُلِي فِي عِبَادِي وَادْخُلِي جَنَّتِي",
    translation: "[To the righteous it will be said], \"O reassured soul, return to your Lord, well-pleased and pleasing [to Him], and enter among My [righteous] servants, and enter My Paradise.\"",
    context: "These beautiful verses describe the peaceful return of the faithful soul to Allah. They provide comfort by showing the serene welcome that awaits the righteous. For those grieving, imagining their loved ones being addressed with these gentle words can bring peace. It reminds us that death for a believer is not an end but a blessed return to Allah, who receives His righteous servants with honor and pleasure, welcoming them into Paradise.",
    type: ComfortType.quran,
  ),
  ComfortItem(
    id: 5,
    title: "Allah's Comforting Remembrance",
    source: "Quran",
    reference: "Surah Ar-Ra'd (13:28)",
    arabicText: "الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
    translation: "Those who believe and whose hearts find comfort in the remembrance of Allah. Verily, in the remembrance of Allah do hearts find rest.",
    context: "This verse reveals one of the most powerful sources of comfort during times of grief - the remembrance of Allah. When we feel the pain of loss, turning our hearts to Allah through prayer, recitation of Quran, dhikr, and reflection can bring a unique peace that cannot be found elsewhere. This verse reminds us that no matter how heavy our grief may be, our hearts are designed to find solace in connecting with our Creator, who understands our pain and provides comfort through His remembrance.",
    type: ComfortType.quran,
  ),
  ComfortItem(
    id: 6,
    title: "Prayers for Those Who Preceded Us",
    source: "Quran",
    reference: "Surah Al-Hashr (59:10)",
    arabicText: "وَالَّذِينَ جَاءُوا مِن بَعْدِهِمْ يَقُولُونَ رَبَّنَا اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ وَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِّلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَءُوفٌ رَّحِيمٌ",
    translation: "And [there is a share for] those who came after them, saying, \"Our Lord, forgive us and our brothers who preceded us in faith and put not in our hearts [any] resentment toward those who have believed. Our Lord, indeed You are Kind and Merciful.\"",
    context: "This beautiful verse teaches us how to maintain our connection with loved ones who have passed away. It shows us that praying for the forgiveness and well-being of those who preceded us in faith is a virtuous act. The verse also emphasizes the importance of keeping our hearts pure from any negative feelings. When grieving, this verse reminds us that we can continue to benefit our departed loved ones through sincere prayers and that our spiritual connection with them remains intact even after their passing.",
    type: ComfortType.quran,
  ),
];

final List<ComfortItem> hadithNarrations = [
  ComfortItem(
    id: 7,
    title: "Trust in Allah's Divine Plan",
    source: "Hadith",
    reference: "Sahih Muslim",
    arabicText: "عَجَبًا لِأَمْرِ الْمُؤْمِنِ، إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ، وَلَيْسَ ذَاكَ لِأَحَدٍ إِلَّا لِلْمُؤْمِنِ، إِنْ أَصَابَتْهُ سَرَّاءُ شَكَرَ، فَكَانَ خَيْرًا لَهُ، وَإِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ، فَكَانَ خَيْرًا لَهُ",
    translation: "How wonderful is the affair of the believer, for his affairs are all good, and this applies to no one but the believer. If something good happens to him, he is thankful for it and that is good for him. If something bad happens to him, he bears it with patience and that is good for him.",
    context: "This hadith reminds believers that both ease and hardship are part of Allah's wisdom and plan. What matters is our response - gratitude in good times and patience in difficulty. This perspective brings peace during life's challenges, including grief. By accepting that even in our losses there is good intended for us, we find the strength to endure with patience, knowing that this patient endurance itself is a blessing and source of reward.",
    type: ComfortType.hadith,
  ),
  ComfortItem(
    id: 8,
    title: "Allah Takes What Belongs to Him",
    source: "Hadith",
    reference: "Sahih Al-Bukhari",
    arabicText: "إِنَّ لِلَّهِ مَا أَخَذَ وَلَهُ مَا أَعْطَى، وَكُلُّ شَيْءٍ عِنْدَهُ بِأَجَلٍ مُسَمًّى، فَلْتَصْبِرْ وَلْتَحْتَسِبْ",
    translation: "To Allah belongs what He has taken, and to Him belongs what He has given, and everything with Him has an appointed term. So have patience and hope for reward.",
    context: "The Prophet Muhammad ﷺ said these words to comfort a grieving mother. This hadith reminds us that our loved ones are merely entrusted to us by Allah; they ultimately belong to Him. Everything in this world, including our time with loved ones, has been predetermined by Allah's perfect wisdom. This understanding helps us accept loss with grace and dignity, knowing that we are submitting to Allah's will and earning His reward through our patience.",
    type: ComfortType.hadith,
  ),
  ComfortItem(
    id: 9,
    title: "Reuniting with Loved Ones",
    source: "Hadith",
    reference: "Sahih Muslim",
    arabicText: "إِذَا مَاتَ وَلَدُ الْعَبْدِ قَالَ اللَّهُ لِمَلَائِكَتِهِ: قَبَضْتُمْ وَلَدَ عَبْدِي؟ فَيَقُولُونَ: نَعَمْ، فَيَقُولُ: قَبَضْتُمْ ثَمَرَةَ فُؤَادِهِ؟ فَيَقُولُونَ: نَعَمْ، فَيَقُولُ: مَاذَا قَالَ عَبْدِي؟ فَيَقُولُونَ: حَمِدَكَ وَاسْتَرْجَعَ، فَيَقُولُ اللَّهُ: ابْنُوا لِعَبْدِي بَيْتًا فِي الْجَنَّةِ، وَسَمُّوهُ بَيْتَ الْحَمْدِ",
    translation: "When a child of a servant (of Allah) dies, Allah says to the angels: 'Have you taken the child of My servant?' They say: 'Yes.' He says: 'Have you taken the fruit of his heart?' They say: 'Yes.' He says: 'What did My servant say?' They say: 'He praised You and said: Inna lillahi wa inna ilayhi raji'un (To Allah we belong and to Him we shall return).' Allah says: 'Build for My servant a house in Paradise and call it the House of Praise.'",
    context: "This touching hadith reveals Allah's special mercy toward those who bear the loss of a child with patience and acceptance. It shows that Allah recognizes the depth of a parent's love and the magnitude of their loss. For those who respond with faith by saying \"To Allah we belong and to Him we shall return,\" there is a magnificent reward - a special house in Paradise. This hadith brings comfort by showing that our patient endurance is noticed and rewarded by Allah, and that our loved ones become a means of elevating our status in the Hereafter.",
    type: ComfortType.hadith,
  ),
];