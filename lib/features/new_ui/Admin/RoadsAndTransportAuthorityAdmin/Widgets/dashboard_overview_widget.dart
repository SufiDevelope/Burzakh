import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

enum TimeRange { day, week, month }

class GenericDashboardOverviewWidget extends StatelessWidget {
  final String title;
  final TimeRange selectedTimeRange;
  final Function(TimeRange) onTimeRangeChanged;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? textColor;

  const GenericDashboardOverviewWidget({
    super.key,
    required this.title,
    required this.selectedTimeRange,
    required this.onTimeRangeChanged,
    this.selectedColor,
    this.unselectedColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.05,
        vertical: context.mh * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: textColor ?? const Color(0xFF2C3E50),
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          0.02.pw(context),

          // Time Range Selector
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: _buildTimeRangeButton(
                        context,
                        'Day',
                        TimeRange.day,
                      ),
                    ),
                    Expanded(
                      child: _buildTimeRangeButton(
                        context,
                        'Week',
                        TimeRange.week,
                      ),
                    ),
                    Expanded(
                      child: _buildTimeRangeButton(
                        context,
                        'Month',
                        TimeRange.month,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRangeButton(
    BuildContext context,
    String label,
    TimeRange timeRange,
  ) {
    final bool isSelected = selectedTimeRange == timeRange;
    final Color activeColor = selectedColor ?? const Color(0xFFB85C6E);
    final Color inactiveColor = unselectedColor ?? Colors.grey[300]!;

    return GestureDetector(
      onTap: () => onTimeRangeChanged(timeRange),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.025,
          vertical: context.mh * 0.008,
        ),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontSize: context.mh * 0.014,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}