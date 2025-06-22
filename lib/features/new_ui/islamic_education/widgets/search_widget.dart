// Search Modal Widget
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchModal extends StatelessWidget {
  final VoidCallback onClose;
  final String searchQuery;
  final Function(String) onSearchQueryChanged;
  final List<Map<String, dynamic>> searchResults;
  final Function(Map<String, dynamic>) onResultSelected;

  const SearchModal({
    Key? key,
    required this.onClose,
    required this.searchQuery,
    required this.onSearchQueryChanged,
    required this.searchResults,
    required this.onResultSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, -50 * (1 - value)),
                    child: Opacity(
                      opacity: value,
                      child: child,
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: () {}, // Prevent closing when tapping on modal content
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TextField(
                              autofocus: true,
                              controller: TextEditingController(text: searchQuery)
                                ..selection = TextSelection.fromPosition(
                                  TextPosition(offset: searchQuery.length),
                                ),
                              onChanged: onSearchQueryChanged,
                              decoration: InputDecoration(
                                hintText: 'Search for concepts, terms, or verses...'.tr(),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        // Search Results
                        searchResults.isNotEmpty
                            ? Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: searchResults.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey.shade200,
                              height: 1,
                            ),
                            itemBuilder: (context, index) {
                              final result = searchResults[index];
                              return InkWell(
                                onTap: () => onResultSelected(result),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${result['title']}".tr(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.teal.shade800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${result['snippet']}".tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                            : searchQuery.isNotEmpty
                            ? Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Icon(
                                Icons.sentiment_dissatisfied,
                                size: 48,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '${"No results found for".tr()} "$searchQuery"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}