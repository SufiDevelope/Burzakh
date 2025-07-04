import 'package:flutter/material.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';

class BurialSuccessDialog extends StatelessWidget {
  final VoidCallback? onContinue;
  
  const BurialSuccessDialog({
    Key? key,
    this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Green Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFF4A7C59),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Decorative circles
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppText(
                      text: "Government Compassionate Services",
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      text: "A gesture of care and support from the Dubai Government",
                      color: Colors.white,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              // Content Section
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppText(
                      text: "Complete Burial Services Provided",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    
                    // Description
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: AppText(
                        text: "The Dubai Government provides all burial services — including the sacred Kafan (shroud) — completely free of charge for Muslims, as an expression of respect, solidarity, and support for grieving families.",
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Services List
                    _buildServiceRow("Kafan (Shroud)", "Provided"),
                    _buildServiceRow("Burial Arrangements", "Included"),
                    _buildServiceRow("Administrative Support", "Complete"),
                    const SizedBox(height: 16),
                    
                    // Total Cost
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: "Total Cost to Family",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black(),
                          ),
                          AppText(
                            text: "AED 0.00",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4A7C59),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Footer Message
                    AppText(
                      text: "This service reflects our community's values of compassion and mutual support during times of loss. No family should bear financial burden during their time of grief.",
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    
                    // Continue Button
                    GestureDetector(
                      onTap: onContinue ?? () => Navigator.of(context).pop(),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A7C59),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AppText(
                          text: "I Understand - Continue",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
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

  Widget _buildServiceRow(String service, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: service,
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
          AppText(
            text: status,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF4A7C59),
          ),
        ],
      ),
    );
  }
}

// Helper function to show the dialog
void showBurialSuccessDialog(BuildContext context, {VoidCallback? onContinue}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BurialSuccessDialog(onContinue: onContinue);
    },
  );
}