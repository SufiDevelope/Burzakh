import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class CurrentlyAssignedWidget extends StatelessWidget {
  final String name;
  final String status;
  final VoidCallback? onEditTap;
  final VoidCallback? onRemoveTap;
  final Color? backgroundColor;
  final Color? textColor;
  
  const CurrentlyAssignedWidget({
    super.key,
    required this.name,
    this.status = "Currently assigned",
    this.onEditTap,
    this.onRemoveTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mw,
      padding: EdgeInsets.all(context.mh * 0.02),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Name and status section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.mh * 0.005),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: context.mh * 0.014,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          // Action buttons section
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Edit button
              GestureDetector(
                onTap: onEditTap,
                child: Container(
                  height: context.mh * 0.04,
                  width: context.mh * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue[600],
                    size: context.mh * 0.02,
                  ),
                ),
              ),
              
              SizedBox(width: context.mw * 0.02),
              
              // Remove button
              GestureDetector(
                onTap: onRemoveTap,
                child: Container(
                  height: context.mh * 0.04,
                  width: context.mh * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: Colors.red[600],
                    size: context.mh * 0.02,
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