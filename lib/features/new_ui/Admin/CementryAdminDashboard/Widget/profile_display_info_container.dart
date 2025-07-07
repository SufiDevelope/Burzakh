import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class ProfileDisplayInfoContainer extends StatelessWidget {
  final String dateOfDeath;
  final String burialTime;
  final String familyContact;
  final String preferredTime;

  const ProfileDisplayInfoContainer({
    Key? key,
    required this.dateOfDeath,
    required this.burialTime,
    required this.familyContact,
    required this.preferredTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mw,
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection(
            title: 'DATE OF DEATH',
            content: dateOfDeath,
            context: context,
          ),
          0.03.ph(context),
          _buildInfoSection(
            title: 'Case Status',
            content: burialTime,
            context: context,
          ),
          0.03.ph(context),
          _buildInfoSection(
            title: 'FAMILY CONTACT',
            content: familyContact,
            context: context,
          ),
          // 0.03.ph(context),
          // _buildInfoSection(
          //   title: '',
          //   content: preferredTime,
          //   context: context,
          // ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required String content,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.w500,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          content,
          style: TextStyle(
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
