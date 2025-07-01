import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/cda_controller.dart';

class MapPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double gridSize = 20;
    for (double i = 0; i < size.width; i += gridSize) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }
    for (double i = 0; i < size.height; i += gridSize) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }

    final roadPaint = Paint()
      ..color = Colors.green.withOpacity(0.2)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.7),
      roadPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.6, size.height * 0.2),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CdaRequestDetailsWidget extends StatelessWidget {
  final String name;
  final String caseId;
  final String submittedDate;
  final String statusBadgeText;
  final Color? statusBadgeColor;
  final String signText;
  final String location;
  final String mapPreviewText;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;
  final VoidCallback? onEdit;
  final VoidCallback? onOpenChat;
  final VoidCallback? onMapTap;
  final Color? primaryColor;
  final Color? backgroundColor;
  final VoidCallback? onCallUser;
  final VoidCallback? onEmailUser;
  final String email;
  final String phoneNumber;
  final String? restingPlace;
  final String? policeClassificationUrl;
  final String? deathNotificationFileUrl;
  final String? deathNotificationFileStatus;
  final String? hospitalCertificateUrl;
  final String? hospitalCertificateStatus;
  final String? passportOrEmirateIdFrontUrl;
  final String? passportOrEmirateIdFrontStatus;
  final String? passportOrEmirateIdBackUrl;
  final String? passportOrEmirateIdBackStatus;
  final String? releaseFormUrl;
  final String? additionalDocument;
  final String? additionalDocumentUploadUserUrl;
  final String? nameOfDeceased;
  final String? dateOfDeath;
  final String? causeOfDeath;
  final String? sendNotificationMessage;
  final String? mourningStartDate;
  final String? mourningEndDate;

  const CdaRequestDetailsWidget({
    super.key,
    required this.name,
    required this.caseId,
    required this.submittedDate,
    this.statusBadgeText = 'Missing required documents',
    this.statusBadgeColor,
    required this.signText,
    required this.location,
    this.mapPreviewText = 'Map Preview (Google Maps)',
    this.onApprove,
    this.onReject,
    this.onEdit,
    this.onOpenChat,
    this.onMapTap,
    this.primaryColor,
    this.backgroundColor,
    this.onCallUser,
    this.onEmailUser,
    required this.email,
    required this.phoneNumber,
    this.restingPlace,
    this.policeClassificationUrl,
    this.deathNotificationFileUrl,
    this.deathNotificationFileStatus,
    this.hospitalCertificateUrl,
    this.hospitalCertificateStatus,
    this.passportOrEmirateIdFrontUrl,
    this.passportOrEmirateIdFrontStatus,
    this.passportOrEmirateIdBackUrl,
    this.passportOrEmirateIdBackStatus,
    this.releaseFormUrl,
    this.additionalDocument,
    this.additionalDocumentUploadUserUrl,
    this.nameOfDeceased,
    this.dateOfDeath,
    this.causeOfDeath,
    this.sendNotificationMessage,
    this.mourningStartDate,
    this.mourningEndDate,
  });

  @override
  Widget build(BuildContext context) {
    bool _hasDocuments() {
      return policeClassificationUrl != null ||
          deathNotificationFileUrl != null ||
          hospitalCertificateUrl != null ||
          passportOrEmirateIdFrontUrl != null ||
          passportOrEmirateIdBackUrl != null ||
          additionalDocumentUploadUserUrl != null ||
          releaseFormUrl != null;
    }

    final Color mainColor = primaryColor ?? const Color(0xFF1e40af);
    final Color bgColor = backgroundColor ?? Colors.white;
    final Color badgeColor = statusBadgeColor ?? Colors.orange[100]!;
    final controller = Get.find<CdaController>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.mw * 0.04),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with name, case ID and status badge
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    0.005.ph(context),
                    Text(
                      'Submitted on $submittedDate',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    caseId,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  0.01.ph(context),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.025,
                      vertical: context.mh * 0.006,
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusBadgeText,
                      style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: context.mh * 0.011,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          0.03.ph(context),
          // User Contact Information Section
          Text(
            'Contact Information',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.02.ph(context),

          // Email
          _buildDetailRow(
            context,
            Icons.email_outlined,
            'Email',
            email,
            isClickable: true,
            onTap: onEmailUser,
          ),

          0.015.ph(context),

          // Phone Number
          _buildDetailRow(
            context,
            Icons.phone_outlined,
            'Phone Number',
            phoneNumber,
            isClickable: true,
            onTap: onCallUser,
          ),

          0.03.ph(context),

          // Case Details Section
          if (nameOfDeceased != null ||
              dateOfDeath != null ||
              causeOfDeath != null ||
              restingPlace != null ||
              mourningStartDate != null ||
              mourningEndDate != null) ...[
            Text(
              'Case Details',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
              ),
            ),
            0.02.ph(context),
            if (nameOfDeceased != null) ...[
              _buildDetailRow(
                context,
                Icons.person_outline,
                'Name of Deceased',
                nameOfDeceased!,
              ),
              0.015.ph(context),
            ],
            if (dateOfDeath != null) ...[
              _buildDetailRow(
                context,
                Icons.calendar_today_outlined,
                'Date of Death',
                dateOfDeath!,
              ),
              0.015.ph(context),
            ],
            if (causeOfDeath != null) ...[
              _buildDetailRow(
                context,
                Icons.medical_services_outlined,
                'Cause of Death',
                causeOfDeath!,
                isMultiline: true,
              ),
              0.015.ph(context),
            ],
            if (restingPlace != null) ...[
              _buildDetailRow(
                context,
                Icons.location_on_outlined,
                'Resting Place',
                restingPlace!,
              ),
              0.015.ph(context),
            ],
            if (additionalDocument != null) ...[
              _buildDetailRow(
                context,
                Icons.description_outlined,
                'Additional Document',
                additionalDocument!,
              ),
              0.015.ph(context),
            ],
            if (sendNotificationMessage != null) ...[
              _buildDetailRow(
                context,
                Icons.message_outlined,
                'Notification Message',
                sendNotificationMessage!,
                isMultiline: true,
              ),
              0.015.ph(context),
            ],
            if (mourningStartDate != null) ...[
              _buildDetailRow(
                context,
                Icons.calendar_today_outlined,
                'Mourning Start Date',
                mourningStartDate!,
              ),
              0.015.ph(context),
            ],
            if (mourningEndDate != null) ...[
              _buildDetailRow(
                context,
                Icons.calendar_today_outlined,
                'Mourning End Date',
                mourningEndDate!,
              ),
              0.015.ph(context),
            ],
            0.03.ph(context),
          ],

          if (_hasDocuments()) ...[
            Text(
              'Documents',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
              ),
            ),

            0.02.ph(context),

            // Police Clearance
            if (policeClassificationUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.security_outlined,
                'Police Clearance',
                policeClassificationUrl!,
                null,
              ),
              0.015.ph(context),
            ],

            // Death Notification File
            if (deathNotificationFileUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.description_outlined,
                'Death Notification File',
                deathNotificationFileUrl!,
                deathNotificationFileStatus,
              ),
              0.015.ph(context),
            ],

            // Hospital Certificate
            if (hospitalCertificateUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.local_hospital_outlined,
                'Hospital Certificate',
                hospitalCertificateUrl!,
                hospitalCertificateStatus,
              ),
              0.015.ph(context),
            ],

            // Passport/Emirates ID Front
            if (passportOrEmirateIdFrontUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.credit_card_outlined,
                'Emirates ID (Front)',
                passportOrEmirateIdFrontUrl!,
                passportOrEmirateIdFrontStatus,
              ),
              0.015.ph(context),
            ],

            // Passport/Emirates ID Back
            if (passportOrEmirateIdBackUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.credit_card_outlined,
                'Emirates ID (Back)',
                passportOrEmirateIdBackUrl!,
                passportOrEmirateIdBackStatus,
              ),
              0.015.ph(context),
            ],

            // Additional Document Upload
            if (additionalDocumentUploadUserUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.attach_file_outlined,
                'Additional Document Upload',
                additionalDocumentUploadUserUrl!,
                null,
              ),
              0.015.ph(context),
            ],

            // Release Form
            if (releaseFormUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.assignment_outlined,
                'Release Form',
                releaseFormUrl!,
                null,
              ),
              0.015.ph(context),
            ],

            0.03.ph(context),
          ],

          0.01.ph(context),

          // Request Details Section
          Text(
            'Request Details',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.02.ph(context),

          // Location
          _buildDetailRow(
            context,
            Icons.location_on_outlined,
            'Location',
            location,
          ),

          // Documents Section

          0.03.ph(context),
          // Location Preview Section
          Text(
            'Location Preview',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.015.ph(context),

          // Map Preview Container
          GestureDetector(
            onTap: onMapTap,
            child: Container(
              width: double.infinity,
              height: context.mh * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue[50]!,
                    Colors.green[50]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background pattern
                  Positioned.fill(
                    child: CustomPaint(
                      painter: MapPatternPainter(),
                    ),
                  ),
                  // Content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(context.mw * 0.025),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: context.mh * 0.025,
                          ),
                        ),
                        0.015.ph(context),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.04,
                            vertical: context.mh * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.map,
                                color: Colors.blue[700],
                                size: context.mh * 0.016,
                              ),
                              0.01.pw(context),
                              Text(
                                mapPreviewText,
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: context.mh * 0.014,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              0.01.pw(context),
                              Icon(
                                Icons.open_in_new,
                                color: Colors.blue[700],
                                size: context.mh * 0.014,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          0.04.ph(context),

          // Action Buttons
          Row(
            children: [
              // Approve Button
              Obx(
                () {
                  return Visibility(
                    visible: statusBadgeText == "Approved" ? false : true,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: onApprove,
                        child: Container(
                          height: context.mh * 0.055,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: controller.approvedloading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Approve Request',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.mh * 0.014,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              0.02.pw(context),

              // Reject Button
              Obx(
                () {
                  return Visibility(
                    visible: statusBadgeText == "Approved" ? false : true,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: onReject,
                        child: Container(
                          height: context.mh * 0.055,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: controller.rejectloading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Reject Request',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: context.mh * 0.014,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              0.02.pw(context),

              // Chat Button
              Expanded(
                child: GestureDetector(
                  onTap: onOpenChat,
                  child: Container(
                    height: context.mh * 0.055,
                    width: context.mw * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Open Chat',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentRow(
    BuildContext context,
    IconData icon,
    String title,
    String documentUrl,
    String? status,
  ) {
    Color statusColor = Colors.grey[600]!;
    Color statusBgColor = Colors.grey[100]!;

    if (status != null) {
      switch (status.toLowerCase()) {
        case 'approved':
          statusColor = Colors.green[700]!;
          statusBgColor = Colors.green[50]!;
          break;
        case 'rejected':
          statusColor = Colors.red[700]!;
          statusBgColor = Colors.red[50]!;
          break;
        case 'pending':
          statusColor = Colors.orange[700]!;
          statusBgColor = Colors.orange[50]!;
          break;
      }
    }

    return GestureDetector(
      onTap: () {
        _openDocument(documentUrl);
      },
      child: Container(
        padding: EdgeInsets.all(context.mw * 0.035),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(context.mw * 0.025),
              decoration: BoxDecoration(
                color: Color(0xFF1e40af).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Color(0xFF1e40af),
                size: context.mh * 0.022,
              ),
            ),
            0.025.pw(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  0.005.ph(context),
                  Text(
                    'Tap to view document',
                    style: TextStyle(
                      color: Color(0xFF1e40af),
                      fontSize: context.mh * 0.012,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (status != null) ...[
                    0.008.ph(context),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.02,
                        vertical: context.mh * 0.004,
                      ),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: context.mh * 0.01,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle document view/download
                _openDocument(documentUrl);
              },
              child: Container(
                padding: EdgeInsets.all(context.mw * 0.02),
                decoration: BoxDecoration(
                  color: Color(0xFF1e40af),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.visibility_outlined,
                  color: Colors.white,
                  size: context.mh * 0.018,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDocument(String url) {
    if (url.isNotEmpty) {
      launchUrl(Uri.parse(url));
    }
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String title,
    String content, {
    bool isMultiline = false,
    bool isDocuments = false,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.grey[600],
          size: context.mh * 0.02,
        ),
        0.015.pw(context),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: context.mh * 0.015,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (!isDocuments) ...[
                0.005.ph(context),
                GestureDetector(
                  onTap: isClickable ? onTap : null,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: isClickable ? Colors.blue[600] : Colors.grey[600],
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.w400,
                      height: isMultiline ? 1.3 : 1.0,
                      // decoration: isClickable ? TextDecoration.underline : null,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        if (isClickable && onTap != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(context.mw * 0.015),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                title.toLowerCase().contains('email')
                    ? Icons.mail_outline
                    : Icons.phone,
                color: Colors.blue[600],
                size: context.mh * 0.018,
              ),
            ),
          ),
      ],
    );
  }
}
