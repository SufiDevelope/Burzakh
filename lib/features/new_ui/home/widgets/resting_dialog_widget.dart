import 'package:burzakh/features/new_ui/home/widgets/at_home_dialog.dart';
import 'package:burzakh/features/new_ui/home/widgets/at_hospital_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RestingDialogWidget extends StatelessWidget {
  const RestingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.15,
      ),
      child: Container(
        height: screenHeight * 0.7,
        decoration: BoxDecoration(
          color: Color(0xfffcf8f4),
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
                    colors: [Color(0xFF0d493b), Color(0xFF063d31)],
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
                    // Sparkle icon in circle
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: screenHeight * 0.025,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Main title
                    Text(
                      'May Allah grant them peace.'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Subtitle
                    Text(
                      'We are here to guide you through this process with care and compassion'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: screenHeight * 0.012,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              // Content section
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  children: [
                    // Guidance text
                    Text(
                      'To provide you with the most appropriate guidance'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.015,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF374151),
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    // Question
                    Text(
                      'Where did the passing occur?'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.012,
                        color: const Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.017),

                    // At Home option
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop('home');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.035),
                        margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              decoration: BoxDecoration(
                                color: const Color(0xFFeaeef5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.home_outlined,
                                color: const Color(0xFF4b6fa5),
                                size: screenHeight * 0.025,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'At Home'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.017,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF111827),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.003),
                                  Text(
                                    'Passed away at residence or private location'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.013,
                                      color: const Color(0xFF6B7280),
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: const Color(0xFF9CA3AF),
                              size: screenHeight * 0.022,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // At Hospital option
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop('hospital');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.025),
                              decoration: BoxDecoration(
                                color: const Color(0xFFe8f1ec),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.local_hospital_outlined,
                                color: const Color(0xFF3c8a5c),
                                size: screenHeight * 0.025,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'At Hospital'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.017,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF111827),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.003),
                                  Text(
                                    'Passed away at medical facility or clinic'.tr(),
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.012,
                                      color: const Color(0xFF6B7280),
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: const Color(0xFF9CA3AF),
                              size: screenHeight * 0.022,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Islamic quote
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Text(
                        "Indeed we belong to Allah, and indeed to Him we will return — Al-Baqarah 2:156".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHeight * 0.013,
                          color: const Color(0xFF9CA3AF),
                          fontStyle: FontStyle.italic,
                          height: 1.4,
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
    );
  }
}

void showRestingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const RestingDialogWidget(),
  ).then((value) {
    // Handle the selected option
    if (value == 'home') {
      showAtHomeDialog(context);
    } else if (value == 'hospital') {
      showAtHospitalDialog(context);
    }
  });
}
