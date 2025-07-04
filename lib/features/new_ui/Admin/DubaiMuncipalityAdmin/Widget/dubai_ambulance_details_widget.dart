import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class DubaiAmbulanceDetailsWidget extends StatelessWidget {
  final String? name;
  final String? relative;
  final String? caseId;
  final String? status;
  const DubaiAmbulanceDetailsWidget(
      {super.key, this.name, this.relative, this.caseId, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.mw * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
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
                      name ?? "",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    0.01.ph(context),
                    Text(
                      relative ?? "",
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    0.015.ph(context),
                    Text(
                      caseId ?? "",
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
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
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
        status ?? "",
        style: TextStyle(
          fontSize: context.mh * 0.014,
          color: Color(0xff856404),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
