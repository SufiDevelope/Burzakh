import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        tab.title,
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
                      
                      // // Badge with count
                      // if (tab.count != null) ...[
                      //   SizedBox(height: context.mh * 0.006),
                      //   Container(
                      //     constraints: BoxConstraints(
                      //       minWidth: context.mw * 0.05,
                      //       maxWidth: context.mw * 0.1,
                      //     ),
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: context.mw * 0.015,
                      //       vertical: context.mh * 0.003,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: isSelected
                      //           ? const Color(0xFF4A7C59)
                      //           : Colors.grey[400],
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Text(
                      //       '${tab.count}',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: context.mh * 0.012,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ],
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