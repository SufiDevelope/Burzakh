// Key point item builder
// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildKeyPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 6, right: 8),
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: Color(0xFFAD8442),
          shape: BoxShape.circle,
        ),
      ),
      Expanded(
        child: RichText(
          text: TextSpan(
            text: '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF1A1914),
            ),
            children: _formatKeyPointText(text),
          ),
        ),
      ),
    ],
  );
}

// Format key point text to handle emphasized parts
List<TextSpan> _formatKeyPointText(String text) {
  if (text.contains('Keep graves simple')) {
    return [
      TextSpan(text: 'Keep graves simple', style: TextStyle(fontWeight: FontWeight.w600)),
      TextSpan(text: ' without structures or plantings'),
    ];
  } else if (text.contains('quiet, respectful behavior')) {
    return [
      TextSpan(text: 'Maintain '),
      TextSpan(text: 'quiet, respectful behavior', style: TextStyle(fontWeight: FontWeight.w600)),
      TextSpan(text: ' during visits'),
    ];
  } else if (text.contains('prayers and charity')) {
    return [
      TextSpan(text: 'Benefit the deceased with '),
      TextSpan(text: 'prayers and charity', style: TextStyle(fontWeight: FontWeight.w600)),
      TextSpan(text: ', not decorations'),
    ];
  }
  return [TextSpan(text: text)];
}

// Introduction card builder
Widget buildIntroductionCard() {
  return Container(
    margin: EdgeInsets.only(top: 12),
    decoration: BoxDecoration(
      color: Color(0xFFFFFDFA).withOpacity(0.95),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 8,
          color: Colors.black.withOpacity(0.03),
        ),
      ],
      border: Border.all(color: Color(0xFFD9C9A8)),
    ),
    child: Row(
      children: [
        Container(
          width: 4,
          decoration: BoxDecoration(
            color: Color(0xFF053B30),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: -30,
                left: -10,
                child: Text(
                  '"',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 120,
                    color: Color(0xFF053B30).withOpacity(0.04),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.65,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF1A1914),
                          letterSpacing: 0.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Visiting a cemetery'.tr(),
                            style: TextStyle(
                              color: Color(0xFF053B30),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4,
                            ),
                          ),
                          TextSpan(
                            text: ' '.tr(),
                            style: TextStyle(
                              color: Color(0xFF053B30),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4,
                            ),
                          ),
                          TextSpan(text: 'is a solemn occasion that requires appropriate behavior out of respect for the '.tr()),
                          TextSpan(
                            text: 'deceased'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Color(0xFFAD8442).withOpacity(0.5),
                              decorationThickness: 1,
                            ),
                          ),
                          TextSpan(text: ', their '.tr()),
                          TextSpan(
                            text: 'families'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Color(0xFFAD8442).withOpacity(0.5),
                              decorationThickness: 1,
                            ),
                          ),
                          TextSpan(text: ', and the '.tr()),
                          TextSpan(
                            text: 'sacred nature'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Color(0xFFAD8442).withOpacity(0.5),
                              decorationThickness: 1,
                            ),
                          ),
                          TextSpan(text: ' of the grounds. These guidelines help ensure your visit is conducted with proper etiquette.'.tr()),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFAD8442).withOpacity(0.25),
                            Color(0xFFD9C9A8).withOpacity(0),
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
      ],
    ),
  );
}

// Collapsible section card builder
Widget buildSectionCard(
    String id,
    String title,
    IconData icon,
    bool isWarning,
    List items,
    Color primaryColor,
    Color richGold,
    Color lightGold,
    Color mainText,
    Color subtleText,
    Color cardBackground,
    VoidCallback onTap,
    double height,
    double turns,
    ) {
  final iconColor = isWarning ? richGold : primaryColor;
  final iconBgColor = isWarning
      ? richGold.withOpacity(0.12)
      : primaryColor.withOpacity(0.08);
  final borderColor = isWarning ? richGold : primaryColor.withOpacity(0.7);

  return GestureDetector(
    onTap:onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.03),
          ),
        ],
        border: Border(
          top: BorderSide(color: lightGold, width: 1),
          right: BorderSide(color: lightGold, width: 1),
          bottom: BorderSide(color: lightGold, width: 1),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(color: borderColor, width: 3),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon container
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isWarning
                            ? richGold.withOpacity(0.25)
                            : primaryColor.withOpacity(0.15),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 12),

                  // Title
                  Expanded(
                    child: Text(
                      title.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        color: mainText,
                      ),
                    ),
                  ),

                  // Expand/collapse arrow
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: AnimatedRotation(
                      turns:turns,
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: richGold,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Collapsible content
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height:height,
              curve: Curves.easeInOut,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...items.map((item) {
                        final String itemText = item is Map ? item['text'] : item;
                        final bool isImportant = item is Map && item['important'] == true;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: richGold.withOpacity(0.12),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: richGold.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  itemText.tr(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: isImportant ? FontWeight.w500 : FontWeight.w300,
                                    color: isImportant ? mainText : subtleText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


// Grave prohibitions card builder
Widget buildGraveProhibitionsCard(
    Color primaryColor,
    Color richGold,
    Color lightGold,
    Color mainText,
    Color subtleText,
    Color cardBackground,
    ) {
  return Container(
    decoration: BoxDecoration(
      color: cardBackground,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 8,
          color: Colors.black.withOpacity(0.03),
        ),
      ],
      border: Border(
        top: BorderSide(color: lightGold, width: 1),
        right: BorderSide(color: lightGold, width: 1),
        bottom: BorderSide(color: lightGold, width: 1),
      ),
    ),
    margin: EdgeInsets.only(bottom: 16),
    child: Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),

        border: Border(
          left: BorderSide(color: richGold, width: 3),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon container
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: richGold.withOpacity(0.12),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: richGold.withOpacity(0.25),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: richGold,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),

                // Title
                Expanded(
                  child: Text(
                    'Important Grave Prohibitions'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                      color: mainText,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Leading paragraph
            Text(
              'Do not build structures on graves or plant trees on them. Keep graves simple and unadorned as practiced by the Prophet Muhammad (PBUH).'.tr(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: mainText,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),

            // Prophetic Example section
            _buildInfoSection(
              'Prophetic Example',
              'When the Prophet Muhammad\'s (PBUH) beloved son Ibrahim died, he demonstrated perfect adherence to Islamic burial practices. The grave was simple, marked only with a small stone, without any elaborate structure, decorations, or plantings. Despite his deep love for his son, the Prophet followed the divine guidance with complete submission.',
              primaryColor,
              richGold,
              lightGold,
              subtleText,
            ),
            SizedBox(height: 12),

            // What Benefits the Deceased section
            _buildInfoSection(
              'What Truly Benefits the Deceased'.tr(),
              'If you wish to benefit your loved ones who have passed away, know that building structures on graves or placing flowers on them will not help them in their afterlife. Instead, what truly reaches and benefits them are your sincere prayers (dua) for them and charitable acts (sadaqah) performed on their behalf. These practices are authenticated in the Sunnah and have spiritual impact, unlike physical adornments of the grave which are prohibited.',
              primaryColor,
              richGold,
              lightGold,
              subtleText,
              leadingTextImportant: true,
            ),
            SizedBox(height: 12),

            // Hadith section
            _buildInfoSection(
              'Hadith on Grave Construction',
              '"The Messenger of Allah (PBUH) prohibited plastering of graves, sitting on them and building over them." (Sahih Muslim)\n\n"Jabir said: The Messenger of Allah (PBUH) forbade that graves should be plastered, or that they should be used as sitting places, or that a building should be built over them." (Sahih Muslim 970)',
              primaryColor,
              richGold,
              lightGold,
              subtleText,
            ),
            SizedBox(height: 16),

            // Closing text
            Text(
              'These teachings emphasize simplicity and humility in burial practices, avoiding extravagance and preventing graves from becoming places of veneration beyond appropriate remembrance and respect.'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: subtleText,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Info section builder for the grave prohibitions card
Widget _buildInfoSection(
    String title,
    String content,
    Color primaryColor,
    Color richGold,
    Color lightGold,
    Color textColor, {
      bool leadingTextImportant = false,
    }) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          richGold.withOpacity(0.15),
          richGold.withOpacity(0.08),
        ],
      ),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: richGold.withOpacity(0.2),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 1,
          color: Colors.white.withOpacity(0.8),
          spreadRadius: 0,
          blurStyle: BlurStyle.inner,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: primaryColor,
            height: 1.5,
          ),
        ),
        SizedBox(height: 6),
        if (leadingTextImportant && content.contains('If you wish'))
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: textColor,
                height: 1.5,
                fontFamily: 'Arial',
              ),
              children: [
                TextSpan(
                  text: 'If you wish to benefit your loved ones who have passed away, know that building structures on graves or placing flowers on them will not help them in their afterlife.'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    // color: mainText,
                  ),
                ),
                TextSpan(
                  text: ' Instead, what truly reaches and benefits them are your sincere prayers (dua) for them and charitable acts (sadaqah) performed on their behalf. These practices are authenticated in the Sunnah and have spiritual impact, unlike physical adornments of the grave which are prohibited.'.tr(),
                ),
              ],
            ),
          )
        else
          Text(
            content.tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: textColor,
              height: 1.5,
              fontFamily: 'Arial',
            ),
          ),
      ],
    ),
  );
}