import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class RtaRequestDetailsWidget extends StatelessWidget {
  final String name;
  final String caseId;
  final String submittedDate;
  final String statusBadgeText;
  final Color? statusBadgeColor;
  final String signText;
  final String location;
  final String email;
  final String phoneNumber;
  final String signPreviewText;
  final String signPreviewSubtext;
  final String signCount;
  final String mapPreviewText;

  // New case detail fields
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

  final VoidCallback? onApprove;
  final VoidCallback? onReject;
  final VoidCallback? onEdit;
  final VoidCallback? onOpenChat;
  final VoidCallback? onMapTap;
  final VoidCallback? onCallUser;
  final VoidCallback? onEmailUser;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String? mourningStartDate;
  final String? mourningEndDate;
  final String? passportDocumentUrl;
  final dynamic lat;
  final dynamic long;

  const RtaRequestDetailsWidget({
    super.key,
    required this.name,
    required this.caseId,
    required this.submittedDate,
    this.statusBadgeText = 'Missing required documents',
    this.statusBadgeColor,
    required this.signText,
    required this.location,
    required this.email,
    required this.phoneNumber,
    this.signPreviewText = 'Sign Preview',
    this.signPreviewSubtext = '',
    this.signCount = "",
    this.mapPreviewText = 'Map Preview (Google Maps)',

    // New case detail parameters
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
    this.onApprove,
    this.onReject,
    this.onEdit,
    this.onOpenChat,
    this.onMapTap,
    this.onCallUser,
    this.onEmailUser,
    this.primaryColor,
    this.backgroundColor,
    this.mourningStartDate,
    this.mourningEndDate,
    this.passportDocumentUrl,
    this.lat,
    this.long,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = primaryColor ?? const Color(0xFFbd4753);
    final Color bgColor = backgroundColor ?? Colors.white;
    final Color badgeColor = statusBadgeColor ?? Colors.orange[100]!;
    final controller = Get.find<RtaController>();

    log(policeClassificationUrl ?? "");

    String _getLocalizedStatus(String key) {
      switch (key.toLowerCase()) {
        case 'All':
          return StringTranslateExtension('All').tr();
        case 'pending':
          return StringTranslateExtension('Pending').tr();
        case 'approved':
          return StringTranslateExtension('Approved').tr();
        case 'rejected':
          return StringTranslateExtension('Rejected').tr();
        default:
          return key;
      }
    }

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
                    Row(
                      children: [
                        Text(
                          StringTranslateExtension('Submitted on ').tr(),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '$submittedDate',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        StringTranslateExtension('Case ID:').tr(),
                        style: TextStyle(
                          color: mainColor,
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        caseId,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                      _getLocalizedStatus(statusBadgeText),
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
            StringTranslateExtension('Contact Information').tr(),
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
              StringTranslateExtension('Case Details').tr(),
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
                Icons.date_range_outlined,
                'Mourning Start Date',
                mourningStartDate!,
              ),
              0.015.ph(context),
            ],
            if (mourningEndDate != null) ...[
              _buildDetailRow(
                context,
                Icons.date_range_outlined,
                'Mourning End Date',
                mourningEndDate!,
              ),
              0.015.ph(context),
            ],
            0.03.ph(context),
          ],

          // Request Details Section
          Text(
            StringTranslateExtension('Request Details').tr(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.02.ph(context),

          // Sign Text
          _buildDetailRow(
            context,
            Icons.text_fields,
            'Sign Text',
            '$signText',
            isMultiline: true,
          ),

          0.015.ph(context),

          // Location
          _buildDetailRow(
            context,
            Icons.location_on_outlined,
            'Location',
            location,
          ),

          0.03.ph(context),

          // Documents Section
          if (_hasDocuments()) ...[
            Text(
              StringTranslateExtension('Documents').tr(),
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
            if (passportDocumentUrl != null) ...[
              _buildDocumentRow(
                context,
                Icons.attach_file_outlined,
                'Passport Document',
                passportDocumentUrl!,
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

          // Sign Preview Section
          Text(
            StringTranslateExtension('Sign Preview').tr(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.015.ph(context),

          // Sign Preview Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                Text(
                  signText,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                0.01.ph(context),
                Text(
                  StringTranslateExtension(signPreviewText).tr(),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: context.mh * 0.014,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                0.02.ph(context),
              ],
            ),
          ),

          0.03.ph(context),
          // Location Preview Section
          Text(
            StringTranslateExtension('Location Preview').tr(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),

          0.015.ph(context),

          // Map Preview Container
          lat != null
              ? GestureDetector(
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
                        Positioned.fill(
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(double.tryParse(lat) ?? 31.5204,
                                  double.tryParse(long) ?? 74.3587),
                              zoom: 14,
                            ),
                            markers: Set.of(
                              [
                                Marker(
                                  markerId: MarkerId('1'),
                                  position: LatLng(
                                      double.tryParse(lat) ?? 31.5204,
                                      double.tryParse(long) ?? 74.3587),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              0.05.ph(context),
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
                                      StringTranslateExtension(mapPreviewText)
                                          .tr(),
                                      style: TextStyle(
                                        color: Colors.blue[700],
                                        fontSize: context.mh * 0.014,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    0.01.pw(context),
                                    Icon(
                                      Icons.open_in_new,
                                      color: Color(0xFF1E88E5),
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
                )
              : Container(
                  child: Text(
                      StringTranslateExtension('No Preview Available').tr()),
                ),

          0.04.ph(context),

          // Action Buttons
          Row(
            children: [
              // Approve Button
              Obx(() {
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
                                  StringTranslateExtension('Approve Request')
                                      .tr(),
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
              }),

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
                                    StringTranslateExtension('Reject Request')
                                        .tr(),
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
                          StringTranslateExtension('Open Chat').tr(),
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

  bool _hasDocuments() {
    return policeClassificationUrl != null ||
        deathNotificationFileUrl != null ||
        hospitalCertificateUrl != null ||
        passportOrEmirateIdFrontUrl != null ||
        passportOrEmirateIdBackUrl != null ||
        additionalDocumentUploadUserUrl != null ||
        releaseFormUrl != null ||
        passportDocumentUrl != null;
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
                color: Color(0xFFbd4753).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Color(0xFFbd4753),
                size: context.mh * 0.022,
              ),
            ),
            0.025.pw(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringTranslateExtension(title).tr(),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  0.005.ph(context),
                  Text(
                    StringTranslateExtension('Tap to view document').tr(),
                    style: TextStyle(
                      color: Color(0xFFbd4753),
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
                  color: Color(0xFFbd4753),
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
                StringTranslateExtension(title).tr(),
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
