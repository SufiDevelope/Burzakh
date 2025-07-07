import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class VisitorPortalDialog extends StatelessWidget {
  const VisitorPortalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.2,
      ),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.construction_outlined,
                      color: Colors.white,
                      size: screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Visitor Portal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'Under Construction',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: screenHeight * 0.014,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: screenHeight * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: Column(
                children: [
                  // Construction Icon
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.08),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.construction,
                      color: const Color(0xFFF59E0B),
                      size: screenHeight * 0.06,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  // Main Message
                  Text(
                    'Under Construction',
                    style: TextStyle(
                      fontSize: screenHeight * 0.024,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF374151),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Description
                  Text(
                    'The Visitor Portal is currently under development. This feature will be available soon with enhanced visitor management capabilities.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      color: const Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),

                  0.01.ph(context),

                  // OK Button
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.016,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.005),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.015,
            height: screenWidth * 0.015,
            decoration: const BoxDecoration(
              color: Color(0xFF7C3AED),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Text(
            text,
            style: TextStyle(
              fontSize: screenHeight * 0.014,
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}

void showVisitorPortalDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const VisitorPortalDialog(),
  );
}
