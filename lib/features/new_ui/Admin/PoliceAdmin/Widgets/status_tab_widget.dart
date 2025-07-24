import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class StatusTabsWidget extends StatelessWidget {
  final List<TabItem> tabs;

  const StatusTabsWidget({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PoliceAdminController>();

    return Obx(() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.03,
          vertical: context.mh * 0.02,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = index == controller.selectedIndex.value;
            final tab = tabs[index];

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectTab(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: context.mh * 0.015,
                    horizontal: context.mw * 0.008,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? const Color(0xFF4A7C59)
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title with proper overflow handling
                      Text(
                        StringTranslateExtension("${tab.title}").tr(),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF4A7C59)
                              : Colors.grey[600],
                          fontSize: context.mh * 0.013,
                          fontWeight: isSelected 
                              ? FontWeight.w600 
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}

class TabItem {
  final String title;
  final int? count;

  const TabItem({
    required this.title,
    this.count,
  });
}