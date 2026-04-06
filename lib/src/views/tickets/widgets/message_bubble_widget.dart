import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_conversation_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class MessageBubble extends StatelessWidget {
  final ConversationMessage message;
  final VoidCallback? onDelete;
  final VoidCallback? onLike;
  final VoidCallback? onDislike;

  const MessageBubble({
    super.key,
    required this.message,
    this.onDelete,
    this.onLike,
    this.onDislike,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return TweenAnimationBuilder<double>(
      key: ValueKey<int>(message.id),
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (final BuildContext context, final double value,
          final Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: isTab ? 44 : 38,
              height: isTab ? 44 : 38,
              decoration: BoxDecoration(
                color: message.senderRole == MessageUserRole.admin
                    ? SdkColors.splashDeep.withValues(alpha: 0.08)
                    : SdkColors.splashGold.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: message.senderRole == MessageUserRole.admin
                      ? SdkColors.splashDeep.withValues(alpha: 0.15)
                      : SdkColors.splashGold.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  message.senderInitials,
                  style: sdkRubikW600(isTablet: isTab).copyWith(
                    fontSize: isTab ? 14 : 12,
                    color: message.senderRole == MessageUserRole.admin
                        ? SdkColors.splashDeep
                        : SdkColors.splashGold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: <Widget>[
                      Text(
                        message.senderName,
                        style: sdkRubikW600(isTablet: isTab).copyWith(
                          fontSize: isTab ? 14 : 13,
                          color: SdkColors.splashDeep,
                        ),
                      ),
                      _buildRoleBadge(),
                      Text(
                        _formatTimestamp(message.timestamp),
                        style: sdkRubikW400(isTablet: isTab).copyWith(
                          fontSize: 11,
                          color: SdkColors.homeSubtext,
                        ),
                      ),
                      if (message.isEdited)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color:
                                SdkColors.homeSubtext.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Edited',
                            style: sdkRubikW400(isTablet: isTab).copyWith(
                              fontSize: 9,
                              color: SdkColors.homeSubtext,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message.message,
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: isTab ? 14 : 13,
                      color: SdkColors.splashDeep.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      _ActionIcon(
                        icon: Icons.thumb_up_outlined,
                        count: message.likeCount,
                        color: const Color(0xFFF59E0B),
                        onTap: onLike,
                      ),
                      const SizedBox(width: 12),
                      _ActionIcon(
                        icon: Icons.thumb_down_outlined,
                        count: message.dislikeCount,
                        color: SdkColors.homeSubtext,
                        onTap: onDislike,
                      ),
                      if (message.isOwnMessage) ...<Widget>[
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 14,
                          color: SdkColors.homeBorder,
                        ),
                        const SizedBox(width: 8),
                        _SmallAction(icon: Icons.edit_outlined, onTap: () {}),
                        const SizedBox(width: 6),
                        _SmallAction(icon: Icons.copy_outlined, onTap: () {}),
                        const SizedBox(width: 6),
                        _SmallAction(
                          icon: Icons.delete_outline,
                          onTap: onDelete ?? () {},
                          color: SdkColors.colorError500,
                        ),
                      ],
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.reply_rounded,
                                size: 14, color: SdkColors.splashGlow),
                            const SizedBox(width: 4),
                            Text(
                              'Reply',
                              style: sdkRubikW500(isTablet: isTab).copyWith(
                                fontSize: 11,
                                color: SdkColors.splashGlow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleBadge() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    final bool isAdmin = message.senderRole == MessageUserRole.admin;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isAdmin
            ? SdkColors.splashDeep.withValues(alpha: 0.08)
            : SdkColors.splashGold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isAdmin
              ? SdkColors.splashDeep.withValues(alpha: 0.15)
              : SdkColors.splashGold.withValues(alpha: 0.2),
          width: 0.5,
        ),
      ),
      child: Text(
        message.senderRole.label,
        style: sdkRubikW600(isTablet: isTab).copyWith(
          fontSize: 9,
          color: isAdmin ? SdkColors.splashDeep : SdkColors.splashGold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  String _formatTimestamp(final DateTime dt) {
    final Duration diff = DateTime.now().difference(dt);
    if (diff.inDays > 7) return DateFormat('MMM d, yyyy').format(dt);
    if (diff.inDays > 0) return '${diff.inDays} days ago';
    if (diff.inHours > 0) return '${diff.inHours} hours ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes} min ago';
    return 'Just now';
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color color;
  final VoidCallback? onTap;

  const _ActionIcon({
    required this.icon,
    required this.count,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 4),
          Text('$count',
              style: sdkRubikW500(isTablet: isTab)
                  .copyWith(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}

class _SmallAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _SmallAction({required this.icon, required this.onTap, this.color});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 15, color: color ?? SdkColors.homeSubtext),
    );
  }
}
