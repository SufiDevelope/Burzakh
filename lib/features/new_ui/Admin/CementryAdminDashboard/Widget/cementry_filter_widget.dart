import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class CementryFilterWidget extends StatefulWidget {
  final String searchHint;
  final String dropdownValue;
  final List<String> dropdownItems;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onDropdownChanged;
  final TextEditingController? searchController;

  const CementryFilterWidget({
    super.key,
    this.searchHint = "Search by name or case ID...",
    this.dropdownValue = "All Cases",
    required this.dropdownItems,
    this.onSearchChanged,
    this.onDropdownChanged,
    this.searchController,
  });

  @override
  State<CementryFilterWidget> createState() => _CementryFilterWidgetState();
}

class _CementryFilterWidgetState extends State<CementryFilterWidget> {
  late TextEditingController _searchController;
  late String _selectedDropdownValue;

  @override
  void initState() {
    super.initState();
    _searchController = widget.searchController ?? TextEditingController();
    _selectedDropdownValue = widget.dropdownValue;
  }

  @override
  void dispose() {
    if (widget.searchController == null) {
      _searchController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.02,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 2.0,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFE2E8F0),
              Color(0xFFCBD5E1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Column(
        children: [
          // Search TextField
          Container(
            height: context.mh * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: context.mw * 0.02,
                  offset: Offset(0, context.mh * 0.004),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: widget.onSearchChanged,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: context.mw * 0.06,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.04,
                  vertical: 0,
                ),
              ),
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ),

          0.02.ph(context),

          // Dropdown
          Container(
            height: context.mh * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: context.mw * 0.02,
                  offset: Offset(0, context.mh * 0.004),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedDropdownValue,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey[600],
                  size: context.mw * 0.07,
                ),
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                elevation: 8,
                items: widget.dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.04,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDropdownValue = newValue;
                    });
                    widget.onDropdownChanged?.call(newValue);
                  }
                },
                selectedItemBuilder: (BuildContext context) {
                  return widget.dropdownItems.map((String item) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.04,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}