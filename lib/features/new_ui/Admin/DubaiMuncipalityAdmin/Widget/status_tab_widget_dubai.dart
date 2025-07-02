import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusBarWidgetDubai extends StatelessWidget {
  final List<TabItem> tabs;

  const StatusBarWidgetDubai({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DubaiController>();
    return Obx(() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02,
          vertical: context.mh * 0.015,
        ),
        decoration: const BoxDecoration(
          color: dashboardcolor,
        ),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = index == controller.selectedIndex.value;
            final tab = tabs[index];

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectTab(index, tab.title),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: context.mw * 0.005),
                  padding: EdgeInsets.symmetric(
                    vertical: context.mh * 0.012,
                    horizontal: context.mw * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: isSelected
                        ? Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1)
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Flexible(
                        child: Text(
                          tab.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.011,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),

                      // // Count badge
                      // if (tab.count != null) ...[
                      //   SizedBox(width: context.mw * 0.01),
                      //   Container(
                      //     constraints: BoxConstraints(
                      //       minWidth: context.mw * 0.05,
                      //       maxWidth: context.mw * 0.08,
                      //     ),
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: context.mw * 0.012,
                      //       vertical: context.mh * 0.004,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: Colors.white.withOpacity(0.9),
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     child: Text(
                      //       '${tab.count}',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         color: const Color(0xFF6B7280),
                      //         fontSize: context.mh * 0.011,
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
