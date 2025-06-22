// Timeline Modal Widget
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TimelineModal extends StatelessWidget {
  final VoidCallback onClose;
  final int activeSection;
  final Function(int) onSectionSelected;

  const TimelineModal({
    Key? key,
    required this.onClose,
    required this.activeSection,
    required this.onSectionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 100 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: GestureDetector(
              onTap: () {}, // Prevent closing when tapping on modal content
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Journey Timeline'.tr(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade800,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: onClose,
                            icon: const Icon(Icons.close),
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),

                    // Timeline Content
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 500,
                        ),
                        child: Stack(
                          children: [
                            // Timeline Line
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: MediaQuery.of(context).size.width * 0.45 - 12,
                              width: 1,
                              child: Container(color: Colors.grey.shade200),
                            ),

                            // Timeline Nodes
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildTimelineNode(
                                  step: 1,
                                  title: 'Moment of Death',
                                  time: '0 hours',
                                  isActive: activeSection == 1,
                                  onTap: () => onSectionSelected(1),
                                ),
                                const SizedBox(height: 48),
                                _buildTimelineNode(
                                  step: 2,
                                  title: 'Preparation for Burial',
                                  time: '0-24 hours',
                                  isActive: activeSection == 2,
                                  onTap: () => onSectionSelected(2),
                                ),
                                const SizedBox(height: 48),
                                _buildTimelineNode(
                                  step: 3,
                                  title: 'Soul\'s Ascension',
                                  time: 'After death',
                                  isActive: activeSection == 3,
                                  onTap: () => onSectionSelected(3),
                                ),
                                const SizedBox(height: 48),
                                _buildTimelineNode(
                                  step: 4,
                                  title: 'Questioning in the Grave',
                                  time: 'After burial',
                                  isActive: activeSection == 4,
                                  onTap: () => onSectionSelected(4),
                                ),
                                const SizedBox(height: 48),
                                _buildTimelineNode(
                                  step: 5,
                                  title: 'Life in Barzakh',
                                  time: 'Until Resurrection',
                                  isActive: activeSection == 5,
                                  onTap: () => onSectionSelected(5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineNode({
    required int step,
    required String title,
    required String time,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.tr(),
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? Colors.teal.shade800 : Colors.grey.shade600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: isActive?20:20),
                padding: EdgeInsets.all(isActive?20:0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Colors.white : Colors.white,
                  border: Border.all(
                    color: isActive ? Colors.teal.shade700: Colors.transparent,
                  ),
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.teal.shade700 : Colors.white,
                    border: Border.all(
                      color: isActive ? Colors.teal.shade700 : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      step.toString().tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isActive ? Colors.white : Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
              // if (isActive)
              //   SizedBox(
              //     width: 32,
              //     height: 32,
              //     child: TweenAnimationBuilder<double>(
              //       tween: Tween(begin: 0.8, end: 1.8),
              //       duration: const Duration(seconds: 2),
              //       curve: Curves.easeInOut,
              //       builder: (context, value, child) {
              //         return Opacity(
              //           opacity: 2 - value,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               border: Border.all(
              //                 color: Colors.teal.shade700,
              //                 width: 2,
              //               ),
              //               color: Colors.transparent,
              //             ),
              //             transform: Matrix4.diagonal3Values(value, value, 1.0),
              //           ),
              //         );
              //       },
              //       child: Container(),
              //     ),
              //   ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            time.tr(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}

