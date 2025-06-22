import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/AppColor.dart';

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
}

// Data model for Du'a
class Dua {
  final int id;
  final String title;
  final String source;
  final String arabicText;
  final String transliteration;
  final String meaning;
  final String benefit;
  bool isBookmarked;

  Dua({
    required this.id,
    required this.title,
    required this.source,
    required this.arabicText,
    required this.transliteration,
    required this.meaning,
    required this.benefit,
    this.isBookmarked = false,
  });
}

// Sample data
final List<Dua> duaList = [
  Dua(
    id: 1,
    title: "Du'a for Complete Purification & Divine Mercy",
    source: "Sahih Muslim",
    arabicText: "اللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَعَافِهِ وَاعْفُ عَنْهُ، وَأَكْرِمْ نُزُلَهُ، وَوَسِّعْ مُدْخَلَهُ، وَاغْسِلْهُ بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ، وَنَقِّهِ مِنَ الْخَطَايَا كَمَا نَقَّيْتَ الثَّوْبَ الْأَبْيَضَ مِنَ الدَّنَسِ",
    transliteration: "Allaahumma-ghfir lahu, warhamhu, wa 'aafihi, wa'fu 'anhu, wa akrim nuzulahu, wa wassi' mudkhalahu, waghsilhu bilmaa'i waththalji walbaradi, wa naqqihi mina l-khataayaa kamaa naqqayta aththawba l-'abyada mina d-danasi.",
    meaning: "O Allah, forgive him, have mercy on him, give him strength and pardon him. Make his reception generous and expand his entrance. Wash him with water, snow, and hail, and cleanse him of sin as You would cleanse a white garment of stains.",
    benefit: "This du'a is recommended to be recited during funeral prayers (Salat al-Janazah) or when visiting graves. The Prophet Muhammad ﷺ taught this prayer specifically for supplicating for the deceased. It asks for complete purification from sins and a generous welcome into the afterlife.",
  ),
  Dua(
    id: 2,
    title: "Du'a for Elevated Ranks & Family Protection",
    source: "Authenticated by Al-Albani",
    arabicText: "اللَّهُمَّ إِنْ كَانَ مُحْسِنًا فَزِدْ فِي إِحْسَانِهِ، وَإِنْ كَانَ مُسِيئًا فَتَجَاوَزْ عَنْهُ، اللَّهُمَّ اجْعَلْهُ عِنْدَكَ فِي أَعْلَى عِلِّيِّينَ، وَاخْلُفْهُ فِي أَهْلِهِ فِي الْغَابِرِينَ، وَاغْفِرْ لَنَا وَلَهُ يَا رَبَّ الْعَالَمِينَ",
    transliteration: "Allaahumma in kaana muhsinan fa-zid fee ihsaanihi, wa in kaana museean fa-tajaawaz 'anhu. Allahumma-j'alhu 'indaka fee a'laa 'illiyyeen, wakhlufhu fee ahlihi fil-ghaabireen, waghfir lanaa wa lahu yaa Rabbal-'aalameen.",
    meaning: "O Allah, if he was a doer of good, then increase his good deeds, and if he was a wrongdoer, then overlook his bad deeds. O Allah, place him with You in the highest ranks, and become a guardian for his family after him, and forgive us and him, O Lord of the worlds.",
    benefit: "This supplication is particularly valuable after burial when standing at the grave. It acknowledges that each person has a different spiritual state, asking Allah to enhance the good and forgive any shortcomings. It also includes a beautiful request for Allah to care for the deceased's family in their absence.",
  ),
  Dua(
    id: 3,
    title: "Universal Du'a for All Muslims",
    source: "Abu Dawud, Tirmidhi",
    arabicText: "اللَّهُمَّ اغْفِرْ لِحَيِّنَا وَمَيِّتِنَا، وَصَغِيرِنَا وَكَبِيرِنَا، وَذَكَرِنَا وَأُنْثَانَا، وَشَاهِدِنَا وَغَائِبِنَا. اللَّهُمَّ مَنْ أَحْيَيْتَهُ مِنَّا فَأَحْيِهِ عَلَى الْإِسْلامِ، وَمَنْ تَوَفَّيْتَهُ مِنَّا فَتَوَفَّهُ عَلَى الْإِيمَانِ. اللَّهُمَّ لا تَحْرِمْنَا أَجْرَهُ وَلا تُضِلَّنَا بَعْدَهُ",
    transliteration: "Allaahumma-ghfir lihayyinaa wa mayyitinaa, wa sagheerinaa wa kabeerinaa, wa dhakarinaa wa unthaanaa, wa shaahidinaa wa ghaa'ibinaa. Allaahumma man ahyaytahu minnaa fa-ahyihi 'alal-Islaam, wa man tawaffaytahu minnaa fa-tawaffahu 'alal-eemaan. Allaahumma laa tahrimnaa ajrahu wa laa tudillanaa ba'dahu.",
    meaning: "O Allah, forgive our living and our dead, our young and our old, our males and our females, those present and those absent. O Allah, whomever You keep alive among us, keep him alive in [accordance with] Islam, and whomever You cause to die among us, cause him to die in [a state of] faith. O Allah, do not deprive us of his reward and do not cause us to go astray after him.",
    benefit: "This comprehensive supplication was taught by the Prophet Muhammad ﷺ for funeral prayers. It is one of the most complete duas as it asks for forgiveness for all believers - living and deceased, young and old, male and female, present and absent. It also asks Allah to keep us steadfast on the path of Islam and faith, both in life and death.",
  ),
  Dua(
    id: 4,
    title: "Essential Du'a for Jannah & Protection",
    source: "Sahih Al-Bukhari",
    arabicText: "اللَّهُمَّ أَدْخِلْهُ الْجَنَّةَ، وَأَعِذْهُ مِنْ عَذَابِ الْقَبْرِ وَمِنْ عَذَابِ النَّارِ",
    transliteration: "Allaahumma adkhil-hul jannata, wa a'idh-hu min 'adhaabil qabri wa min 'adhabin-naar.",
    meaning: "O Allah, admit him into Paradise, and protect him from the punishment of the grave and the punishment of the Fire.",
    benefit: "This concise yet powerful supplication can be recited during funeral prayers or when visiting graves. It directly asks for what every believer ultimately hopes for: admission to Paradise and protection from punishment. Its simplicity makes it easy to memorize and recite frequently for deceased loved ones.",
  ),
  Dua(
    id: 5,
    title: "Special Du'a for Deceased Children",
    source: "Ibn Majah",
    arabicText: "اللَّهُمَّ اجْعَلْهُ فَرَطًا وَذُخْرًا لِوَالِدَيْهِ، وَشَفِيعًا مُجَابًا. اللَّهُمَّ ثَقِّلْ بِهِ مَوَازِينَهُمَا، وَأَعْظِمْ بِهِ أُجُورَهُمَا، وَأَلْحِقْهُ بِصَالِحِ الْمُؤْمِنِينَ، وَاجْعَلْهُ فِي كَفَالَةِ إِبْرَاهِيمَ، وَقِهِ بِرَحْمَتِكَ عَذَابَ الْجَحِيمِ",
    transliteration: "Allaahumma-j'alhu faratan wa dhukhran liwaalidayhi, wa shafee'an mujaaban. Allaahumma thaqqil bihi mawaazeenahuma, wa a'zim bihi ujoorahuma, wa alhiqhu bisaalihil-mu'mineen, waj'alhu fee kafaalati Ibraaheem, wa qihi birahmatika 'adhabal-jaheem.",
    meaning: "O Allah, make him a preceding reward and a stored treasure for his parents, and an answered intercessor. O Allah, through him, make heavy their scales (of good deeds) and magnify their reward. Join him with the righteous believers, place him under the care of Ibrahim, and protect him by Your mercy from the torment of Hell.",
    benefit: "This beautiful supplication is specifically for a deceased child. The Prophet Muhammad ﷺ taught that when a child passes away before their parents, they become an intercessor for them on the Day of Judgment. This du'a asks for the child to be placed under the care of Prophet Ibrahim (peace be upon him), who cares for the children in Paradise, and for the parents to receive great rewards for their patience.",
  ),
  Dua(
    id: 6,
    title: "Quranic Du'a for Those Who Preceded Us",
    source: "Quran 59:10",
    arabicText: "رَبَّنَا اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ وَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِّلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَءُوفٌ رَّحِيمٌ",
    transliteration: "Rabbana-ghfir lana wa li-ikhwanina alladhina sabaquna bil-iman wa la taj'al fi qulubina ghillan lilladhina amanu Rabbana innaka Ra'ufun Rahim.",
    meaning: "Our Lord, forgive us and our brothers who preceded us in faith and put not in our hearts [any] resentment toward those who have believed. Our Lord, indeed You are Kind and Merciful.",
    benefit: "This supplication comes directly from the Quran (Surah Al-Hashr, verse 10). It is a beautiful prayer that acknowledges the believers who have passed away before us. It asks for forgiveness both for ourselves and those who preceded us in faith. The prayer also asks that our hearts be kept free from resentment or ill feelings toward fellow believers, fostering unity and brotherhood even across the boundaries of life and death.",
  ),
  Dua(
    id: 7,
    title: "Powerful Du'a from the End of Al-Baqarah",
    source: "Quran 2:286",
    arabicText: "رَبَّنَا لاَ تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلاَ تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا رَبَّنَا وَلاَ تُحَمِّلْنَا مَا لاَ طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَآ أَنتَ مَوْلاَنَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ",
    transliteration: "Rabbana la tu'akhidhna in nasina aw akhta'na. Rabbana wa la tahmil 'alayna isran kama hamaltahu 'ala alladhina min qablina. Rabbana wa la tuhammilna ma la taqata lana bihi wa'fu 'anna waghfir lana warhamna. Anta mawlana fansurna 'ala al-qawmi al-kafireen.",
    meaning: "Our Lord, do not impose blame upon us if we have forgotten or erred. Our Lord, and lay not upon us a burden like that which You laid upon those before us. Our Lord, and burden us not with that which we have no ability to bear. And pardon us; and forgive us; and have mercy upon us. You are our protector, so give us victory over the disbelieving people.",
    benefit: "This powerful du'a is from the last verse of Surah Al-Baqarah. The Prophet Muhammad ﷺ said: \"Whoever recites the last two verses of Surah Al-Baqarah at night, they will suffice him.\" It is a comprehensive supplication asking for forgiveness, mercy, and ease. When recited for the deceased, it asks Allah to forgive their mistakes, lighten their burden, and have mercy on them in their final journey.",
  ),
  Dua(
    id: 8,
    title: "Comprehensive Du'a at Time of Burial",
    source: "Abu Dawud",
    arabicText: "بِسْمِ اللَّهِ وَعَلَى سُنَّةِ رَسُولِ اللَّهِ، اللَّهُمَّ افْسَحْ لَهُ فِي قَبْرِهِ، وَنَوِّرْ لَهُ فِيهِ، اللَّهُمَّ أَعِذْهُ مِنْ عَذَابِ الْقَبْرِ، وَمِنْ عَذَابِ النَّارِ، اللَّهُمَّ إِنَّهُ نَزَلَ بِكَ وَأَنْتَ خَيْرُ مَنْزُولٍ بِهِ، اللَّهُمَّ اجْعَلْ قَبْرَهُ رَوْضَةً مِنْ رِيَاضِ الْجَنَّةِ، وَلَا تَجْعَلْهُ حُفْرَةً مِنْ حُفَرِ النَّارِ، اللَّهُمَّ ثَبِّتْهُ، اللَّهُمَّ ثَبِّتْهُ",
    transliteration: "Bismillahi wa 'ala sunnati rasulillah. Allahumma-fsah lahu fi qabrihi, wa nawwir lahu fihi. Allahumma a'idhhu min 'adhabil-qabri, wa min 'adhabin-naar. Allahumma innahu nazala bika wa anta khayru manzulin bihi. Allahumma-j'al qabrahu rawdatan min riyadil jannah, wa la taj'alhu hufratan min hufarinnaar. Allahumma thabbithu, Allahumma thabbithu.",
    meaning: "In the name of Allah and upon the Sunnah of the Messenger of Allah. O Allah, make his grave spacious for him and illuminate it for him. O Allah, protect him from the punishment of the grave and from the punishment of the Fire. O Allah, he has come to You, and You are the Best to whom one can come. O Allah, make his grave a garden from the gardens of Paradise, and not a pit from the pits of Hellfire. O Allah, keep him firm. O Allah, keep him firm.",
    benefit: "This comprehensive du'a combines several authentic narrations to be recited at the time of burial. It begins with the words taught by the Prophet Muhammad ﷺ when placing the deceased in the grave. The phrase \"Bismillahi wa 'ala sunnati rasulillah\" establishes that the burial is being conducted according to Islamic tradition. The concluding words \"Allahumma thabbithu\" (O Allah, keep him firm) are especially significant as they provide spiritual support at a critical moment of transition.",
  ),
  Dua(
    id: 9,
    title: "Prophetic Words of Comfort for Mourners",
    source: "Sahih Muslim",
    arabicText: "إِنَّ لِلَّهِ مَا أَخَذَ، وَلَهُ مَا أَعْطَى، وَكُلُّ شَيْءٍ عِنْدَهُ بِأَجَلٍ مُسَمًّى، فَلْتَصْبِرْ وَلْتَحْتَسِبْ",
    transliteration: "Inna lillahi ma akhadha, wa lahu ma a'ta, wa kullu shay'in 'indahu bi-ajalin musamma, faltasbir wal-tahtasib.",
    meaning: "Indeed, to Allah belongs what He has taken, and to Him belongs what He has given, and everything with Him has an appointed time. So be patient and seek reward.",
    benefit: "This is a consolation that the Prophet Muhammad ﷺ offered to a grieving family. It reminds us that everything belongs to Allah, including our loved ones, and that He gives and takes according to His perfect wisdom. These words encourage patience in the face of loss and remind the bereaved to seek reward from Allah for their patience, which is a means of comfort and spiritual elevation during difficult times.",
  ),
  Dua(
    id: 10,
    title: "Beautiful Du'a for Heavenly Reunion",
    source: "Ibn Majah",
    arabicText: "اللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَأَدْخِلْهُ الْجَنَّةَ، اللَّهُمَّ اجْمَعْنَا وَإِيَّاهُ فِي مُسْتَقَرِّ رَحْمَتِكَ، وَفِي أَعْلَى عِلِّيِّينَ، اللَّهُمَّ لا تَحْرِمْنَا أَجْرَهُ وَلا تَفْتِنَّا بَعْدَهُ، وَاجْعَلْ جَنَّةَ الْفِرْدَوْسِ مَأْوَانَا وَمَأْوَاهُ",
    transliteration: "Allahumma-ghfir lahu warhamhu wa adkhilhul jannah, Allahumma-jma'na wa iyyahu fi mustaqarri rahmatika, wa fi a'la 'illiyyeen, Allahumma la tahrimna ajrahu wa la taftinna ba'dahu, waj'al jannatal firdawsi ma'wana wa ma'wah.",
    meaning: "O Allah, forgive him, have mercy on him, and admit him into Paradise. O Allah, gather us and him in the dwelling place of Your mercy, in the highest of the high. O Allah, do not deprive us of his reward and do not test us after him, and make the Garden of Paradise our abode and his abode.",
    benefit: "This beautiful du'a combines several authentic supplications from hadith that express hope for reunion with loved ones in the Hereafter. It is particularly meaningful for those grieving as it focuses not just on the deceased's well-being, but on the hope of meeting them again in Paradise. The Prophet Muhammad ﷺ taught that believers will be reunited with their loved ones in the Hereafter, and this du'a asks specifically for that blessing.",
  ),
];

// Main screen
class DuaCollectionScreen extends StatefulWidget {
  @override
  _DuaCollectionScreenState createState() => _DuaCollectionScreenState();
}

class _DuaCollectionScreenState extends State<DuaCollectionScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: AppColor.bgPrimary(),
                pinned: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text:"Du'a",color: AppColor.darkGreen,fontFamily: 'ns',fontSize: 18,),
                    Text(
                      'أدعية للميت',
                      style: GoogleFonts.amiri(
                        fontSize: 14,
                        color: AppColor.grey(),
                      ),
                    ),
                  ],
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,color: AppColor.darkGreen,),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),
                // actions: [
                //   IconButton(
                //     icon: Icon(Icons.settings,color: AppColor.darkGreen,),
                //     onPressed: () {
                //       // Settings logic would go here
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Settings button pressed')),
                //       );
                //     },
                //   ),
                // ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IntroCard(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final dua = duaList[index];
                    return DuaCard(
                      dua: dua,
                      onBookmarkChanged: (value) {
                        setState(() {
                          dua.isBookmarked = value;
                        });
                      },
                    );
                  },
                  childCount: duaList.length,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 80),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.primary,
        //   shape: CircleBorder(),
        //   child: Icon(Icons.add, color: Colors.white),
        //   onPressed: () {
        //     // Add new Du'a logic would go here
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Add new Du\'a')),
        //     );
        //   },
        // ),
      ),
    );
  }
}

// Introduction card widget
class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(
              color: AppColors.secondary,
              width: 4,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -15,
              right: 0,
              child: Text(
                '❝',
                style: TextStyle(
                  fontSize: 100,
                  color: AppColors.secondary.withOpacity(0.1),
                  fontFamily: 'serif',
                ),
              ),
            ),
            AppText(
              text:
              'These authentic du\'a are collected from the Quran and Sunnah to provide comfort and guidance when making du\'a for the deceased. Each du\'a has been verified from reliable sources and includes its benefits and context to enhance your spiritual practice.',
              fontSize: 14,
              color: AppColor.grey(),
            ),
          ],
        ),
      ),
    );
  }
}

// Du'a card widget
class DuaCard extends StatelessWidget {
  final Dua dua;
  final ValueChanged<bool> onBookmarkChanged;

  const DuaCard({
    Key? key,
    required this.dua,
    required this.onBookmarkChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryLight,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    '${dua.id}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text:
                        dua.title,
                          fontSize: 17,
                        color: AppColor.greenText,
                      ),
                      Container(
                        height: 1,
                        width: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffd9a75f),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Source badge
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.primaryLighterDark : AppColors.primaryLighter,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        size: 14,
                        color: isDarkMode ? AppColors.textMediumDark : AppColors.textMedium,
                      ),
                      SizedBox(width: 6),
                      AppText(
                       text:dua.source,
                          fontSize: 13,
                        color: AppColor.grey(),
                      ),
                    ],
                  ),
                ),

                // Bookmark button
                IconButton(
                  icon: Icon(
                    dua.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: dua.isBookmarked
                        ? AppColors.secondary
                        : isDarkMode ? AppColors.textMediumDark : AppColors.textMedium,
                  ),
                  onPressed: () {
                    onBookmarkChanged(!dua.isBookmarked);
                  },
                ),
              ],
            ),
          ),

          Divider(height: 24),

          // Arabic text
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.primaryLighterDark : AppColors.primaryLighter,
                borderRadius: BorderRadius.circular(12),
                border: Border(right: BorderSide(width: 3,color: AppColor.yellowDark)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                dua.arabicText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.amiri(
                  fontSize: 24,
                  height: 1.8,
                  color: isDarkMode ? AppColors.textDarkDark : AppColors.primary,
                ),
              ),
            ),
          ),

          // Transliteration
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.yellowDark
                      ),
                    ),
                    SizedBox(width: 10,),
                    AppText(
                      text:'TRANSLITERATION',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      fontFamily: 'ns',
                      color: AppColor.grey(),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppColors.secondary.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                  ),
                  child: AppText(
                  text:  dua.transliteration,
                    color: AppColor.grey(),
                    fontFamily: 'ni',
                  ),
                ),
              ],
            ),
          ),

          // Meaning
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.yellowDark
                      ),
                    ),
                    SizedBox(width: 10,),
                    AppText(
                      text:'MEANING',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ns',
                      color: AppColor.grey(),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppColors.primary.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                  ),
                  child: AppText(text:
                    dua.meaning,
                    color: AppColor.black(),
                  ),
                ),
              ],
            ),
          ),

          // Benefits
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.secondaryLightDark : AppColors.secondaryLight,
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
                        color: AppColors.secondary,
                      ),
                      SizedBox(width: 8),
                      AppText(text:
                        'When to Recite',

                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        fontFamily: 'ns',
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  AppText(text:
                    dua.benefit,
                    color: AppColor.grey(),
                  ),
                ],
              ),
            ),
          ),

          // Action buttons
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
                    icon: Icon(Icons.copy,color: AppColor.darkGreen,),
                    label: AppText(text:'Copy',color: AppColor.darkGreen,fontFamily: 'cb',),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      final textToCopy = "${dua.arabicText}\n\n${dua.transliteration}\n\n${dua.meaning}";
                      Clipboard.setData(ClipboardData(text: textToCopy));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Du\'a copied to clipboard')),
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
                //     ),
                //     onPressed: () {
                //       // Save functionality would go here
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Du\'a saved')),
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
                //     ),
                //     onPressed: () {
                //       final textToShare = "${dua.title}\n\n${dua.arabicText}\n\n${dua.transliteration}\n\n${dua.meaning}";
                //       Share.share(textToShare);
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