import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/Model/AdminModels/MorticianModel/mortician_model.dart';
import 'package:flutter/material.dart';

class MorticiansStatusWidget extends StatelessWidget {
  final MorticianModel morticians;
  final Function(MorticiansListData)? onStatusTap;

  const MorticiansStatusWidget({
    super.key,
    required this.morticians,
    this.onStatusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mw,
      padding: EdgeInsets.all(context.mh * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // This makes the column take minimum space
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.people,
                color: Colors.grey[600],
                size: context.mh * 0.025,
              ),
              SizedBox(width: context.mw * 0.02),
              Text(
                'Morticians Status',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: context.mh * 0.02),

          // Morticians List
          ListView.builder(
            shrinkWrap: true, // This makes ListView take only the space it needs
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling since parent will handle it
            itemCount: morticians.morticians?.length ?? 0,
            itemBuilder: (context, index) {
              return _buildMorticianItem(
                  context,
                  morticians.morticians?[index] ?? MorticiansListData(),
                  index);
            },
          )
        ],
      ),
    );
  }

  Widget _buildMorticianItem(
      BuildContext context, MorticiansListData mortician, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: context.mh * 0.015),
      child: Row(
        children: [
          // Left purple bar
          Container(
            width: context.mw * 0.01,
            height: context.mh * 0.08,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff596e84),
                  Color(0xff617890),
                  Color(0xff2d4159),
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          SizedBox(width: context.mw * 0.03),

          // Mortician Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mortician.name ?? '',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.mh * 0.005),
                Text(
                  'Specialization: Male • ${mortician.caseName == null || mortician.caseName == '' ? 'No Case' : mortician.caseName}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: context.mh * 0.014,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Status Section
          Column(
            children: [
              // Status dot
              Container(
                width: context.mh * 0.012,
                height: context.mh * 0.012,
                decoration: BoxDecoration(
                  color: mortician.status == "busy"
                      ? Colors.green[400]
                      : mortician.status == "Active"
                          ? Colors.green[400]
                          : Colors.red[400],
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(height: context.mh * 0.01),

              // Status button
              GestureDetector(
                onTap: () => onStatusTap?.call(mortician),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.04,
                    vertical: context.mh * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: mortician.status == "busy"
                        ? Colors.green[300]
                        : mortician.status == "Active"
                            ? Colors.green[300]
                            : Colors.red[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    mortician.status == "busy"
                        ? 'ON DUTY'
                        : mortician.status == "Active"
                            ? 'Available'
                            : "OFF DUTY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.w600,
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
}