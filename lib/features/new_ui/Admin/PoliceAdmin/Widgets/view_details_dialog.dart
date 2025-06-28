import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CaseDetailsDialog extends StatelessWidget {
  final String? submittedBy;
  final String? relationship;
  final String? contactNumber;
  final String? email;
  final String? deceasedName;
  final String? dateOfDeath;
  final String? causeOfDeath;
  final String? location;
  final List<String>? submittedDocuments;
  final VoidCallback? onClose;
  final VoidCallback? onApprove;
  final String status;
  final String? additionalDocument;
  final String? additionalDocumentUrl;
  final String? emiratesIdImageUrl;
  // New parameters for document URLs
  final Map<String, String>? documentUrls; // Map of document name to URL

  const CaseDetailsDialog({
    super.key,
    this.submittedBy = "Family Member",
    this.relationship = "Sister",
    this.contactNumber = "+971 55 987 6543",
    this.email = "fatima.hassan@email.com",
    this.deceasedName = "Fatima Abdullah Hassan",
    this.dateOfDeath = "17/05/2024",
    this.causeOfDeath = "Accident",
    this.location = "Dubai - Downtown",
    this.submittedDocuments,
    this.onClose,
    this.onApprove,
    required this.status,
    required this.additionalDocument,
    required this.additionalDocumentUrl,
    this.emiratesIdImageUrl,
    this.documentUrls, // New parameter for document URLs
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PoliceAdminController());
    log(additionalDocumentUrl ?? "");

    Future<void> _downloadFile(String url) async {
      try {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      } catch (e) {
        print('Error downloading file: $e');
      }
    }

    // Enhanced function to show document image/PDF in full screen
    void _showDocumentViewer(
        BuildContext context, String documentUrl, String documentName) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.black,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: documentUrl.toLowerCase().endsWith('.pdf')
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.picture_as_pdf,
                                  color: Colors.white, size: 80),
                              SizedBox(height: 20),
                              Text(
                                documentName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () => _downloadFile(documentUrl),
                                icon: Icon(Icons.download),
                                label: Text('Download PDF'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4A7C59),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Image.network(
                          documentUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.error,
                                      color: Colors.white, size: 50),
                                  SizedBox(height: 10),
                                  Text(
                                    'Failed to load document',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton.icon(
                                    onPressed: () => _downloadFile(documentUrl),
                                    icon: Icon(Icons.download),
                                    label: Text('Download Document'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF4A7C59),
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Loading $documentName...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              if (!documentUrl.toLowerCase().endsWith('.pdf'))
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _downloadFile(documentUrl),
                    icon: Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    final defaultDocuments = [
      "Emirates ID Front",
      "Emirates ID Back",
      "Death Notification",
      "Hospital Report",
      "Passport Copy",
    ];

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
                  Text(
                    "Case Details",
                    style: TextStyle(
                      fontSize: context.mh * 0.024,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  InkWell(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
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
                    // Applicant Information Section
                    Text(
                      "Applicant Information",
                      style: TextStyle(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A7C59),
                      ),
                    ),

                    0.02.ph(context),

                    _buildInfoRow(context, "Submitted By:", submittedBy!),
                    0.015.ph(context),
                    _buildInfoRow(context, "Contact Number:", contactNumber!),
                    0.015.ph(context),
                    _buildInfoRow(context, "Email:", email!),

                    0.03.ph(context),
                    Visibility(
                      visible: additionalDocument == null ||
                              additionalDocumentUrl == null
                          ? false
                          : true,
                      child: Text(
                        "Additional Document",
                        style: TextStyle(
                          fontSize: context.mh * 0.02,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4A7C59),
                        ),
                      ),
                    ),

                    0.02.ph(context),

                    Visibility(
                      visible: additionalDocument == null ||
                              additionalDocumentUrl == null
                          ? false
                          : true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            additionalDocument ?? "",
                            style: TextStyle(
                              fontSize: context.mh * 0.016,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _downloadFile(additionalDocumentUrl ?? "");
                            },
                            child: Text(
                              "Download",
                              style: TextStyle(
                                fontSize: context.mh * 0.016,
                                color: const Color(0xFF4A7C59),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          0.04.pw(context),
                        ],
                      ),
                    ),
                    0.03.ph(context),

                    // Deceased Information Section
                    Text(
                      "Deceased Information",
                      style: TextStyle(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A7C59),
                      ),
                    ),

                    0.02.ph(context),

                    _buildInfoRow(context, "Name:", deceasedName!),
                    0.015.ph(context),
                    _buildInfoRow(context, "Date of Death:", dateOfDeath!),
                    0.015.ph(context),
                    _buildInfoRow(context, "Location:", location!),

                    0.03.ph(context),

                    // Documents Submitted Section
                    Text(
                      "Documents Submitted",
                      style: TextStyle(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A7C59),
                      ),
                    ),

                    0.02.ph(context),

                    // Document List with enhanced viewing functionality
                    ...(submittedDocuments ?? defaultDocuments).map((document) {
                      String? documentUrl;
                      if (document == "Emirates ID Front") {
                        documentUrl = emiratesIdImageUrl;
                      } else {
                        documentUrl = documentUrls?[document];
                      }

                      bool hasUrl =
                          documentUrl != null && documentUrl.isNotEmpty;
                      bool isAvailable = document.isNotEmpty;

                      return Padding(
                        padding: EdgeInsets.only(bottom: context.mh * 0.015),
                        child: GestureDetector(
                          onTap: hasUrl
                              ? () => _showDocumentViewer(
                                  context, documentUrl!, document)
                              : null,
                          child: Container(
                            decoration: hasUrl
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[50],
                                  )
                                : null,
                            padding: hasUrl ? EdgeInsets.all(8) : null,
                            child: Row(
                              children: [
                                Icon(
                                  isAvailable ? Icons.check : Icons.close,
                                  color: isAvailable
                                      ? const Color(0xFF00734B)
                                      : Colors.red,
                                  size: context.mh * 0.02,
                                ),
                                0.03.pw(context),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          document,
                                          style: TextStyle(
                                            fontSize: context.mh * 0.016,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      if (hasUrl) ...[
                                        0.02.pw(context),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            "(Tap to view)",
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: context.mh * 0.012,
                                              color: const Color(0xFF4A7C59),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        // 0.01.pw(context),
                                        // Icon(
                                        //   Icons.visibility,
                                        //   color: const Color(0xFF4A7C59),
                                        //   size: context.mh * 0.018,
                                        // ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),

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
                  // Close Button
                  Expanded(
                    child: InkWell(
                      onTap: onClose ?? () => Navigator.of(context).pop(),
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
                            "Close",
                            style: TextStyle(
                              fontSize: context.mh * 0.016,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  0.03.pw(context),

                  // Approve Button
                  Obx(() {
                    return Visibility(
                      visible: status == "approved" ? false : true,
                      child: Expanded(
                        child: InkWell(
                          onTap: onApprove ??
                              () {
                                // Handle approve action
                                Navigator.of(context).pop();
                              },
                          child: Container(
                            height: context.mh * 0.055,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00734B),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: controller.isApprovedLoading.value
                                ? Center(
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "Approve",
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
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.mw * 0.35,
          child: Text(
            label,
            style: TextStyle(
              fontSize: context.mh * 0.016,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: context.mh * 0.016,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
