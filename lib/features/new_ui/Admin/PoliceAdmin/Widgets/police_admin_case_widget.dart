import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class PoliceAdminCaseWidget extends StatelessWidget {
  final String? searchHint;
  final String? dropdownValue;
  final List<String>? dropdownItems;
  final Function(String?)? onDropdownChanged;
  final Function(String)? onSearchChanged;
  final VoidCallback? onFilterTap;
  final TextEditingController? searchController;

  const PoliceAdminCaseWidget({
    super.key,
    this.searchHint = "Search by case number or name...",
    this.dropdownValue = "All Cases",
    this.dropdownItems,
    this.onDropdownChanged,
    this.onSearchChanged,
    this.onFilterTap,
    this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PoliceAdminController>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.mw * 0.04),
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mh * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search Field
          Container(
            height: context.mh * 0.055,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
            child: TextField(
              // controller: searchController,
              onChanged: onSearchChanged,
              style: TextStyle(
                fontSize: context.mh * 0.016,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: StringTranslateExtension(searchHint!).tr(),
                hintStyle: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: Colors.grey[500],
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: context.mh * 0.024,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.04,
                  vertical: context.mh * 0.015,
                ),
              ),
            ),
          ),

          0.02.ph(context),

          // Dropdown and Filter Row
          Row(
            children: [
              // Dropdown
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
                          fontSize: context.mh * 0.016,
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
                        },
                      ),
                    ),
                  ),
                );
              }),

              0.03.pw(context),

              // Filter Button
              InkWell(
                onTap: onFilterTap,
                child: Container(
                  height: context.mh * 0.055,
                  width: context.mw * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.tune,
                        color: Colors.grey[600],
                        size: context.mh * 0.02,
                      ),
                      0.02.pw(context),
                      Text(
                        StringTranslateExtension("Filter").tr(),
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
