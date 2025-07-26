import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelectionBottomSheet extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? selectedColor;
  final Color? borderColor;
  final double? borderRadius;
  final VoidCallback? onLanguageChanged;

  const LanguageSelectionBottomSheet({
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.selectedColor,
    this.borderColor,
    this.borderRadius,
    this.onLanguageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final LocalizationGetx controller = Get.find<LocalizationGetx>();
    
    // Dynamic color scheme based on theme
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultBackgroundColor = backgroundColor ?? 
        (isDark ? Colors.grey[900] : Colors.white);
    final defaultTextColor = textColor ?? 
        (isDark ? Colors.white : Colors.black87);
    final defaultSelectedColor = selectedColor ?? 
        (isDark ? Colors.blue[400] : Colors.blue[600]);
    final defaultBorderColor = borderColor ?? 
        (isDark ? Colors.grey[700] : Colors.grey[300]);

    return GetBuilder<LocalizationGetx>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: defaultBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(borderRadius ?? 20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 12),
                width: context.mw * 0.15,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  StringTranslateExtension('Select Language').tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: defaultTextColor,
                  ),
                ),
              ),
              
              // Language Options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // English Option
                    _buildLanguageOption(
                      context: context,
                      title: 'English',
                      subtitle: 'English',
                      locale: Locale('en'),
                      controller: controller,
                      textColor: defaultTextColor,
                      selectedColor: defaultSelectedColor!,
                      borderColor: defaultBorderColor!,
                    ),
                    
                    SizedBox(height: 12),
                    
                    // Arabic Option
                    _buildLanguageOption(
                      context: context,
                      title: 'العربية',
                      subtitle: 'Arabic',
                      locale: Locale('ar'),
                      controller: controller,
                      textColor: defaultTextColor,
                      selectedColor: defaultSelectedColor,
                      borderColor: defaultBorderColor,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Locale locale,
    required LocalizationGetx controller,
    required Color textColor,
    required Color selectedColor,
    required Color borderColor,
  }) {
    final isSelected = controller.lang.value.languageCode == locale.languageCode;
    
    return GestureDetector(
      onTap: () {
        controller.updateUi(locale, context);
        if (onLanguageChanged != null) {
          onLanguageChanged!();
        }
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? selectedColor : borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? selectedColor.withOpacity(0.1) : Colors.transparent,
        ),
        child: Row(
          children: [
            // Language Icon/Flag (you can replace with actual flag icons)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? selectedColor : borderColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  locale.languageCode == 'en' ? '🇺🇸' : '🇸🇦',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            
            SizedBox(width: 16),
            
            // Language Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? selectedColor : textColor,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: (isSelected ? selectedColor : textColor).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            
            // Selection Indicator
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: selectedColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  // Static method to show the bottom sheet
  static void show(
    BuildContext context, {
    Color? backgroundColor,
    Color? textColor,
    Color? selectedColor,
    Color? borderColor,
    double? borderRadius,
    VoidCallback? onLanguageChanged,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LanguageSelectionBottomSheet(
        backgroundColor: backgroundColor,
        textColor: textColor,
        selectedColor: selectedColor,
        borderColor: borderColor,
        borderRadius: borderRadius,
        onLanguageChanged: onLanguageChanged,
      ),
    );
  }
}