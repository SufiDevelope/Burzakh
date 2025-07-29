import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class DubaiRequestDetailWidget extends StatelessWidget {
  final String name;
  final String relative;
  final String caseId;
  final String status;
  final String burialDate;
  final String prayerTime;
  final String cemetery;
  final String requesterName;
  final VoidCallback? onApprove;
  final VoidCallback? onAssignGrave;
  final VoidCallback? onOpenChat;
  final String? phoneNo;
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
  final String graveStatus;
  const DubaiRequestDetailWidget({
    super.key,
    required this.name,
    required this.relative,
    required this.caseId,
    required this.status,
    required this.burialDate,
    required this.prayerTime,
    required this.cemetery,
    required this.requesterName,
    this.onApprove,
    this.onAssignGrave,
    this.onOpenChat,
    this.phoneNo, this.policeClassificationUrl, this.deathNotificationFileUrl, this.deathNotificationFileStatus, this.hospitalCertificateUrl, this.hospitalCertificateStatus, this.passportOrEmirateIdFrontUrl, this.passportOrEmirateIdFrontStatus, this.passportOrEmirateIdBackUrl, this.passportOrEmirateIdBackStatus, this.releaseFormUrl, required this.graveStatus,
  });

  @override
  Widget build(BuildContext context) {
    bool _hasDocuments() {
      return policeClassificationUrl != null ||
          deathNotificationFileUrl != null ||
          hospitalCertificateUrl != null ||
          passportOrEmirateIdFrontUrl != null ||
          passportOrEmirateIdBackUrl != null ||
          releaseFormUrl != null;
    }

    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.mw * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    0.01.ph(context),
                    Text(
                      relative,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    0.015.ph(context),
                    Text(
                      caseId,
                      style: TextStyle(
                        fontSize: context.mh * 0.014,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(context),
            ],
          ),
          0.04.ph(context),
          Text(
            StringTranslateExtension('Burial Details').tr(),
            style: TextStyle(
              fontSize: context.mh * 0.018,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          0.025.ph(context),
          _buildDetailRow(
            context,
            Icons.calendar_today_outlined,
            'Burial Date',
            burialDate,
          ),
          0.025.ph(context),
          _buildDetailRow(
            context,
            Icons.access_time,
            'Prayer Time',
            prayerTime,
          ),
          0.025.ph(context),
          _buildDetailRow(
            context,
            Icons.location_on_outlined,
            'Cemetery',
            cemetery,
          ),
          0.04.ph(context),
          Text(
            'Requester Information'.tr(),
            style: TextStyle(
              fontSize: context.mh * 0.018,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          0.025.ph(context),
          _buildDetailRow(
            context,
            Icons.person_outline,
            'Name:',
            requesterName,
          ),
          0.01.ph(context),
          _buildDetailRow(
            context,
            Icons.person_outline,
            'Phone No',
            phoneNo ?? '',
          ),
          if (_hasDocuments()) ...[
            Text(
              'Documents'.tr(),
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
          0.02.ph(context),
          Row(
            children: [
              Visibility(
                visible: graveStatus == 'Pending' ? true : false,
                child: Expanded(
                  child: _buildActionButton(
                    context,
                    'Assign Grave'.tr(),
                    Colors.deepOrange,
                    Colors.white,
                    onAssignGrave,
                  ),
                ),
              ),
              // 0.02.pw(context),
              Visibility(
                visible: status == 'Pending' || status == 'grave-number-assigned' ? true : false,
                child: Expanded(
                  child: _buildActionButton(
                    context,
                    'Approve'.tr(),
                    Colors.green,
                    Colors.white,
                    onApprove,
                  ),
                ),
              ),
              // 0.02.pw(context),
              Expanded(
                child: _buildActionButton(
                  context,
                  'Open Chat'.tr(),
                  Colors.white,
                  Colors.black87,
                  onOpenChat,
                  hasBorder: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    String _getLocalizedStatus(String key) {
      switch (key.toLowerCase()) {
        case 'All':
          return StringTranslateExtension('All').tr();
        case 'pending':
          return StringTranslateExtension('Pending').tr();
        case 'approve':
          return StringTranslateExtension('Approved').tr();
        case 'rejected':
          return StringTranslateExtension('Rejected').tr();
        default:
          return key;
      }
    }
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.01,
      ),
      decoration: BoxDecoration(
        color: Color(0xfffff3cd),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _getLocalizedStatus(status),
        style: TextStyle(
          fontSize: context.mh * 0.014,
          color: Color(0xff856404),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Container(
      padding: EdgeInsets.all(context.mw * 0.04),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.mw * 0.02),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: context.mh * 0.022,
              color: Colors.grey.shade600,
            ),
          ),
          0.04.pw(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringTranslateExtension(label).tr(),
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                0.005.ph(context),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback? onTap, {
    bool hasBorder = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.mh * 0.018,
          horizontal: context.mw * 0.03,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02,
          vertical: context.mh * 0.01,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: hasBorder
              ? Border.all(color: Colors.grey.shade300, width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: context.mh * 0.016,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
                color: dashboardcolor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: dashboardcolor,
                size: context.mh * 0.022,
              ),
            ),
            0.025.pw(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr(),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  0.005.ph(context),
                  Text(
                    'Tap to view document'.tr(),
                    style: TextStyle(
                      color: dashboardcolor,
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
                  color: dashboardcolor,
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

}
