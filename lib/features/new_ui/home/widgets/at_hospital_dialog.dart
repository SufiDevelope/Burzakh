import 'package:burzakh/features/new_ui/home/ui/creat_case_screen.dart';
import 'package:burzakh/features/new_ui/home/widgets/resting_dialog_widget.dart';
import 'package:flutter/material.dart';

class AtHospitalDialogWidget extends StatelessWidget {
  const AtHospitalDialogWidget({super.key});

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
        height: screenHeight * 0.8,
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
                // Header with green gradient
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF388559),
                        Color(0xff2b7250),
                        Color(0xFF145140)
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
                      // Check mark icon in circle
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: screenHeight * 0.03,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      // Main title
                      Text(
                        'Guidance for Your Journey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.01),

                      // Subtitle
                      Text(
                        'Your path has been prepared',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: screenHeight * 0.013,
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
                      // Streamlined process info card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFecf0e8),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF059669).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              decoration: BoxDecoration(
                                color: const Color(0xFF059669).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.check,
                                color: const Color(0xFF059669),
                                size: screenHeight * 0.02,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Streamlined Process Available',
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.018,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF3c8a5c),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'Hospital documentation is already available, which helps expedite the verification process with Dubai authorities. We can guide you through the next steps with care.',
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

                      // What this means for you title
                      Text(
                        'What this means for you:',
                        style: TextStyle(
                          fontSize: screenHeight * 0.020,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.015),

                      // Point 1
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFF059669),
                            size: screenHeight * 0.022,
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Medical documentation is complete',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'All necessary medical records are available',
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

                      SizedBox(height: screenHeight * 0.01),

                      // Point 2
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFF059669),
                            size: screenHeight * 0.022,
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Police verification will be expedited',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'The process will move more quickly',
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

                      SizedBox(height: screenHeight * 0.01),

                      // Point 3
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFF059669),
                            size: screenHeight * 0.022,
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You may proceed with the application',
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.015,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'We can begin the burial arrangements',
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

                      SizedBox(height: screenHeight * 0.02),

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
                                  'Back',
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
                                    Color(0xff327e56),
                                    Color(0xff155241),
                                  ]),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'I Understand',
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
                          'May Allah ease this journey for you and your family',
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

void showAtHospitalDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const AtHospitalDialogWidget(),
  ).then((value) {
    if (value == 'back') {
      showRestingDialog(context);
    } else if (value == 'understand') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreatCaseScreen(
            restingPlaceIndex: 1,
          ),
        ),
      );
    }
  });
}
