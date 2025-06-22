import 'package:flutter/material.dart';

import 'package:burzakh/Extenshion/extenshion.dart';

class CdaChatWidget extends StatelessWidget {
  final String message;
  final String timestamp;
  final bool isCurrentUser;
  final String? senderName;
  final String? senderAvatar;
  final MessageStatus? status;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? primaryColor;
  final Color? backgroundColor;

  const CdaChatWidget({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isCurrentUser,
    this.senderName,
    this.senderAvatar,
    this.status,
    this.onTap,
    this.onLongPress,
    this.primaryColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = primaryColor ?? const Color(0xFF1e40af);
    final Color bgColor = backgroundColor ?? Colors.grey[50]!;
    
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.04,
          vertical: context.mh * 0.01,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: isCurrentUser 
              ? MainAxisAlignment.end 
              : MainAxisAlignment.start,
          children: [
            if (!isCurrentUser) ...[
              // Avatar for other users
              Container(
                width: context.mw * 0.08,
                height: context.mw * 0.08,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: senderAvatar != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          senderAvatar!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.person,
                            color: mainColor,
                            size: context.mh * 0.02,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        color: mainColor,
                        size: context.mh * 0.02,
                      ),
              ),
              0.02.pw(context),
            ],
            
            // Message bubble
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: context.mw * 0.7,
                ),
                padding: EdgeInsets.all(context.mw * 0.03),
                decoration: BoxDecoration(
                  color: isCurrentUser ? mainColor : bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: isCurrentUser 
                        ? const Radius.circular(12) 
                        : const Radius.circular(2),
                    bottomRight: isCurrentUser 
                        ? const Radius.circular(2) 
                        : const Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sender name for group chats
                    if (!isCurrentUser && senderName != null) ...[
                      Text(
                        senderName!,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: context.mh * 0.012,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      0.005.ph(context),
                    ],
                    
                    // Message text
                    Text(
                      message,
                      style: TextStyle(
                        color: isCurrentUser ? Colors.white : Colors.black87,
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    
                    0.01.ph(context),
                    
                    // Timestamp and status
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          timestamp,
                          style: TextStyle(
                            color: isCurrentUser 
                                ? Colors.white.withOpacity(0.7)
                                : Colors.grey[600],
                            fontSize: context.mh * 0.011,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        
                        if (isCurrentUser && status != null) ...[
                          0.01.pw(context),
                          Icon(
                            _getStatusIcon(status!),
                            color: Colors.white.withOpacity(0.7),
                            size: context.mh * 0.015,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            if (isCurrentUser) ...[
              0.02.pw(context),
              // Current user avatar
              Container(
                width: context.mw * 0.08,
                height: context.mw * 0.08,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: senderAvatar != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          senderAvatar!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.account_circle,
                            color: mainColor,
                            size: context.mh * 0.02,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.account_circle,
                        color: mainColor,
                        size: context.mh * 0.02,
                      ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.delivered:
        return Icons.done_all;
      case MessageStatus.read:
        return Icons.done_all;
      case MessageStatus.sending:
        return Icons.schedule;
      case MessageStatus.failed:
        return Icons.error_outline;
    }
  }
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}