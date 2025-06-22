import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class ScheduleCallDialog extends StatefulWidget {
  final String? caseName;
  final String? caseNumber;
  final VoidCallback? onClose;
  final Function(
          DateTime selectedDate, TimeOfDay selectedTime, String meetingId)?
      onScheduleCall;

  const ScheduleCallDialog({
    super.key,
    this.caseName = "Sara Hassan Ali",
    this.caseNumber = "#2024-001",
    this.onClose,
    this.onScheduleCall,
  });

  @override
  State<ScheduleCallDialog> createState() => _ScheduleCallDialogState();
}

class _ScheduleCallDialogState extends State<ScheduleCallDialog> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController meetingIdController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Set default meeting ID
    meetingIdController.text = _generateMeetingId();
  }

  @override
  void dispose() {
    meetingIdController.dispose();
    super.dispose();
  }

  String _generateMeetingId() {
    final now = DateTime.now();
    return "${now.millisecondsSinceEpoch.toString().substring(8)}";
  }

  void _handleScheduleCall() {
    widget.onScheduleCall!(
      selectedDate ?? DateTime.now(),
      selectedTime ?? TimeOfDay.now(),
      meetingIdController.text,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.05,
        vertical: context.mh * 0.08,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule Video Call",
                        style: TextStyle(
                          fontSize: context.mh * 0.024,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        "${widget.caseNumber} • ${widget.caseName}",
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: widget.onClose ?? () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close,
                      size: context.mh * 0.028,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meeting ID Section
                    Text(
                      "Meeting Details",
                      style: TextStyle(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A7C59),
                      ),
                    ),

                    0.02.ph(context),

                    // Meeting ID Field
                    Text(
                      "Meeting ID",
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),

                    0.01.ph(context),

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
                        controller: meetingIdController,
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter meeting ID",
                          hintStyle: TextStyle(
                            fontSize: context.mh * 0.016,
                            color: Colors.grey[500],
                          ),
                          prefixIcon: Icon(
                            Icons.videocam,
                            color: Colors.grey[500],
                            size: context.mh * 0.024,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              meetingIdController.text = _generateMeetingId();
                            },
                            child: Icon(
                              Icons.refresh,
                              color: const Color(0xFF4A7C59),
                              size: context.mh * 0.024,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.04,
                            vertical: context.mh * 0.015,
                          ),
                        ),
                      ),
                    ),

                    0.03.ph(context),

                    // Info Note
                    Container(
                      padding: EdgeInsets.all(context.mw * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A7C59).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF4A7C59).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: const Color(0xFF4A7C59),
                            size: context.mh * 0.02,
                          ),
                          0.03.pw(context),
                          Expanded(
                            child: Text(
                              "The applicant will receive a notification with the meeting details and link.",
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: const Color(0xFF4A7C59),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    0.03.ph(context),
                  ],
                ),
              ),
            ),

            // Action Buttons
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: InkWell(
                      onTap: isLoading
                          ? null
                          : (widget.onClose ??
                              () => Navigator.of(context).pop()),
                      child: Container(
                        height: context.mh * 0.055,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: context.mh * 0.016,
                              fontWeight: FontWeight.w600,
                              color: isLoading
                                  ? Colors.grey[400]
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  0.03.pw(context),

                  // Schedule Button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _handleScheduleCall();
                      },
                      child: Container(
                        height: context.mh * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4A7C59),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: isLoading
                              ? SizedBox(
                                  width: context.mh * 0.02,
                                  height: context.mh * 0.02,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : Text(
                                  "Call",
                                  style: TextStyle(
                                    fontSize: context.mh * 0.016,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
