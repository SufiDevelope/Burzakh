import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class DubaiFilterWidget extends StatelessWidget {
  final String searchHint;
  final String selectedFilter;
  final String exportButtonText;
  final Function(String)? onSearchChanged;
  final Function(String)? onFilterChanged;
  final VoidCallback? onExportPressed;
  final Color? primaryColor;
  final Color? backgroundColor;

  const DubaiFilterWidget({
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
              Expanded(
                child: Container(
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
                      hintText: searchHint,
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
              ),
              // 0.02.pw(context),
              
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
