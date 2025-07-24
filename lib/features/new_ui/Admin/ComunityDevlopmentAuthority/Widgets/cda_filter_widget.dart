import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
class CdaFilterWidget extends StatelessWidget {
  final String searchHint;
  final String selectedFilter;
  final String exportButtonText;
  final Function(String)? onSearchChanged;
  final Function(String)? onFilterChanged;
  final VoidCallback? onExportPressed;
  final Color? primaryColor;
  final Color? backgroundColor;

  const CdaFilterWidget({
    super.key,
    this.searchHint = 'Search by name, location, or ID...',
    this.selectedFilter = 'All Requests',
    this.exportButtonText = 'Export Report',
    this.onSearchChanged,
    this.onFilterChanged,
    this.onExportPressed,
    this.primaryColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? Colors.white;
    final controller = Get.find<CdaController>();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.01,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: context.mw * 0.58,
                height: context.mh * 0.055,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: TextField(
                  onChanged: onSearchChanged,
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: Colors.grey[800],
                  ),
                  decoration: InputDecoration(
                    hintText: StringTranslateExtension(searchHint).tr(),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: context.mh * 0.016,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                      size: context.mh * 0.022,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.04,
                      vertical: context.mh * 0.015,
                    ),
                  ),
                ),
              ),
              0.02.pw(context),
              Obx(() {
                return Expanded(
                  child: Container(
                    height: context.mh * 0.055,
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[200]!,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.selectedFilter.value,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                          size: context.mh * 0.024,
                        ),
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        items: controller.filterLabels.map((label) {
                          return DropdownMenuItem<String>(
                            value: controller.filterOptions[label],
                            child: Text(StringTranslateExtension(label).tr()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedFilter.value = value ?? "";
                          controller.filterRtaRequestApi(value ?? "");
                        },
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),

          0.02.ph(context),

          // Filter and Export Row
          Row(
            children: [
              // Filter Dropdown
              

              // 0.03.pw(context),

              // // Export Button
              // GestureDetector(
              //   onTap: onExportPressed,
              //   child: Container(
              //     height: context.mh * 0.055,
              //     padding: EdgeInsets.symmetric(horizontal: context.mw * 0.06),
              //     decoration: BoxDecoration(
              //       color: Colors.grey[50],
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(
              //         color: Colors.grey[200]!,
              //         width: 1,
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(
              //           Icons.download,
              //           color: Colors.grey[700],
              //           size: context.mh * 0.02,
              //         ),
              //         0.02.pw(context),
              //         Text(
              //           exportButtonText,
              //           style: TextStyle(
              //             color: Colors.grey[700],
              //             fontSize: context.mh * 0.016,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}