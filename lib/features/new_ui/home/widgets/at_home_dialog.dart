import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/home/ui/creat_case_screen.dart';
import 'package:burzakh/features/new_ui/home/widgets/resting_dialog_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AtHomeDialogWidget extends StatelessWidget {
  const AtHomeDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.1,
      ),
      child: SizedBox(
        // width: screenWidth * 0.8,
        height: screenHeight * 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.02,
                      vertical: context.mh * 0.02),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFc59311),
                        Color(0xffb68a26),
                        Color(0xFF9e7d4b)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Warning icon in circle
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: screenHeight * 0.03,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.015),

                      // Main title
                      Text(
                        'Additional Steps Required'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      // Subtitle
                      Text(
                        'We will guide you through each step.'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: screenHeight * 0.012,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content section
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Police verification info card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf7f1e4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFD97706).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color(0xFFca9509),
                              size: screenHeight * 0.025,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Police Verification Required'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.016,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFca9509),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'Since the passing occurred at home, Dubai Police must first verify the case as part of the standard procedure. This is a compassionate service to ensure all documentation is properly completed.'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.014,
                                      color: const Color(0xFF6B7280),
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Your next steps title
                      Text(
                        'Your next steps:'.tr(),
                        style: TextStyle(
                          fontSize: screenHeight * 0.020,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Step 1
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                            decoration: BoxDecoration(
                              color: const Color(0xFFad8443),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Contact Dubai Police at '.tr(),
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.015,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF111827),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '999',
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.015,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFFca9509),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'They will provide immediate assistance'.tr(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.013,
                                    color: const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Step 2
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                            decoration: BoxDecoration(
                              color: const Color(0xFFad8443),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Follow their guidance for verification'.tr(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'This ensures all procedures are completed properly'.tr(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.013,
                                    color: const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Step 3
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.08,
                            height: screenWidth * 0.08,
                            decoration: BoxDecoration(
                              color: const Color(0xFFad8443),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.016,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Return to this app when ready'.tr(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'We will be here to continue assisting you'.tr(),
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.013,
                                    color: const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      // Action buttons
                      Row(
                        children: [
                          // Back button
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop('back'),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFdac9a8),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Back'.tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF78716C),
                                    fontSize: screenHeight * 0.016,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: screenWidth * 0.03),

                          // I Understand button
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pop('understand'),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    const Color(0xFFc39113),
                                    const Color(0xFFa07e46),
                                  ]),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'I Understand'.tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.016,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Bottom quote
                      Center(
                        child: Text(
                          'May Allah ease this journey for you and your family'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenHeight * 0.013,
                            color: const Color(0xFF9CA3AF),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAtHomeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const AtHomeDialogWidget(),
  ).then((value) {
    if (value == 'back') {
      showRestingDialog(context);
    } else if (value == 'understand') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreatCaseScreen(
            restingPlaceIndex: 0,
          ),
        ),
      );
    }
  });
}
