import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class DubaiDashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String supervisorName;
  final String initials;
  final int notificationCount;

  const DubaiDashboardHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.supervisorName,
    required this.initials,
    this.notificationCount = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A6FA5), Color(0xFF5B7FB8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Logo Container
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'BZ',
                      style: TextStyle(
                        color: Color(0xFF4A6FA5),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Icons
                Row(
                  children: [
                    // Calendar Icon
                    _buildIconButton(context, Icons.calendar_today),
                    const SizedBox(width: 8),

                    // Chart Icon
                    _buildIconButton(context, Icons.bar_chart),
                    const SizedBox(width: 8),

                    // Document Icon
                    _buildIconButton(context, Icons.description),
                    const SizedBox(width: 8),

                    // Notification Icon with Badge
                    Stack(
                      children: [
                        _buildIconButton(context, Icons.notifications),
                        if (notificationCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '$notificationCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.mh * 0.008,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    0.02.pw(context),

                    // Supervisor Info
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.015,
                        vertical: context.mh * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            supervisorName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.mh * 0.012,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Cemetery Supervisor',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: context.mh * 0.010,
                            ),
                          ),
                        ],
                      ),
                    ),
                    0.015.pw(context),

                    // Profile Circle
                    Container(
                      width: context.mw * 0.08,
                      height: context.mw * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: TextStyle(
                            color: Color(0xFF4A6FA5),
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon) {
    return Container(
      width: context.mw * 0.07,
      height: context.mw * 0.07,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: context.mh * 0.014,
      ),
    );
  }
}