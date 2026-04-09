import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_comment_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final HelpdeskCommentModel message;

  /// The comment this message replies to, when applicable. Used to
  /// render the "Replying to @userName" preview above the body.
  final HelpdeskCommentModel? parent;

  final VoidCallback? onDelete;
  final VoidCallback? onReply;

  const MessageBubble({
    super.key,
    required this.message,
    this.parent,
    this.onDelete,
    this.onReply,
  });

  String get _initials {
    final String name = message.userName.trim();
    if (name.isEmpty) return '?';
    final List<String> parts = name.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  bool get _isAdmin {
    final String? role = message.userRole?.toLowerCase();
    return role == 'admin' || role == 'support';
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    final bool isAdmin = _isAdmin;

    return TweenAnimationBuilder<double>(
      key: ValueKey<int>(message.id),
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      builder: (final BuildContext context, final double value,
          final Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 14 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.fromLTRB(
          isTab ? 14 : 12,
          isTab ? 12 : 10,
          isTab ? 14 : 12,
          isTab ? 12 : 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isAdmin
                ? SdkColors.splashGlowBright.withValues(alpha: 0.25)
                : SdkColors.homeBorder,
            width: 1,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: SdkColors.splashDeep.withValues(alpha: 0.04),
              blurRadius: 10,
              spreadRadius: -3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context, isTab, isAdmin),
            if (parent != null) ...<Widget>[
              const SizedBox(height: 8),
              _buildReplyContext(context, isTab),
            ],
            const SizedBox(height: 8),
            Text(
              message.commentText,
              style: sdkRubikW400(isTablet: isTab).copyWith(
                fontSize: isTab ? 13.5 : 13,
                color: SdkColors.splashDeep.withValues(alpha: 0.88),
                height: 1.4,
              ),
            ),
            if (onReply != null || message.isOwn) ...<Widget>[
              const SizedBox(height: 8),
              _buildActions(context, isTab),
            ],
          ],
        ),
      ),
    );
  }

  // ── Header: avatar + name + role + time ──────────────────────────
  Widget _buildHeader(
    final BuildContext context,
    final bool isTab,
    final bool isAdmin,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildAvatar(isTab, isAdmin),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      message.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: sdkRubikW700(isTablet: isTab).copyWith(
                        fontSize: isTab ? 13 : 12.5,
                        color: SdkColors.splashDeep,
                      ),
                    ),
                  ),
                  if (message.userRole != null &&
                      message.userRole!.isNotEmpty) ...<Widget>[
                    const SizedBox(width: 6),
                    _buildRoleBadge(isAdmin, isTab),
                  ],
                ],
              ),
              const SizedBox(height: 1),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.schedule_rounded,
                    size: 10,
                    color: SdkColors.homeSubtext.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    _formatTimestamp(message.createdOn),
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: 10,
                      color: SdkColors.homeSubtext,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(final bool isTab, final bool isAdmin) {
    final double size = isTab ? 34 : 30;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isAdmin
            ? LinearGradient(
                colors: <Color>[
                  SdkColors.splashDeep,
                  SdkColors.splashGlowBright,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: <Color>[
                  SdkColors.splashGold.withValues(alpha: 0.85),
                  const Color(0xFFE8B341),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: (isAdmin ? SdkColors.splashGlowBright : SdkColors.splashGold)
                .withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          _initials,
          style: sdkRubikW700(isTablet: isTab).copyWith(
            fontSize: isTab ? 12 : 11,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildRoleBadge(final bool isAdmin, final bool isTab) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        gradient: isAdmin
            ? LinearGradient(
                colors: <Color>[
                  SdkColors.splashGlow.withValues(alpha: 0.12),
                  SdkColors.splashGlowBright.withValues(alpha: 0.12),
                ],
              )
            : null,
        color: isAdmin ? null : SdkColors.splashGold.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: (isAdmin ? SdkColors.splashGlowBright : SdkColors.splashGold)
              .withValues(alpha: 0.3),
          width: 0.8,
        ),
      ),
      child: Text(
        message.userRole!.toUpperCase(),
        style: sdkRubikW700(isTablet: isTab).copyWith(
          fontSize: 9,
          color: isAdmin ? SdkColors.splashGlow : SdkColors.splashGold,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  // ── Parent "Replying to …" preview ───────────────────────────────
  Widget _buildReplyContext(final BuildContext context, final bool isTab) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: SdkColors.splashGlowBright,
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.reply_rounded,
                size: 12,
                color: SdkColors.splashGlowBright,
              ),
              const SizedBox(width: 4),
              Text(
                'Replying to ${parent!.userName}',
                style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 10.5,
                  color: SdkColors.splashGlowBright,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            parent!.commentText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: sdkRubikW400(isTablet: isTab).copyWith(
              fontSize: 11.5,
              color: SdkColors.homeSubtext,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  // ── Footer actions (Reply / Delete) ──────────────────────────────
  Widget _buildActions(final BuildContext context, final bool isTab) {
    return Row(
      children: <Widget>[
        if (onReply != null)
          _ActionChip(
            icon: Icons.reply_rounded,
            label: 'Reply',
            color: SdkColors.splashGlowBright,
            onTap: onReply!,
          ),
        if (onReply != null && message.isOwn) const SizedBox(width: 8),
        if (message.isOwn)
          _ActionChip(
            icon: Icons.delete_outline_rounded,
            label: 'Delete',
            color: SdkColors.colorError500,
            onTap: onDelete ?? () {},
          ),
      ],
    );
  }

  String _formatTimestamp(final DateTime dt) {
    final Duration diff = DateTime.now().difference(dt);
    if (diff.inDays > 7) return DateFormat('MMM d, yyyy').format(dt);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }
}

/// Small pill-style action button used in the bubble footer.
class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: color.withValues(alpha: 0.18),
              width: 0.6,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 11, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 10,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
