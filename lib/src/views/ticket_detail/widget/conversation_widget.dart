import 'package:cdp_team_support_sdk/src/bloc/ticket_detail/ticket_detail_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_comment_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/message_bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationWidget extends StatefulWidget {
  const ConversationWidget({super.key});

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  /// Parent comment ids whose reply thread is currently expanded.
  final Set<int> _expandedParents = <int>{};

  void _toggleExpanded(final int parentId) {
    setState(() {
      if (_expandedParents.contains(parentId)) {
        _expandedParents.remove(parentId);
      } else {
        _expandedParents.add(parentId);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(
      builder: (final BuildContext context, final TicketDetailState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionHeader(isTab, state.comments.length),
            const SizedBox(height: 14),
            if (state.comments.isEmpty)
              _buildEmptyState(isTab)
            else
              ..._buildTree(context, state.comments),
          ],
        );
      },
    );
  }

  // ── Section header ───────────────────────────────────────────────
  Widget _buildSectionHeader(final bool isTab, final int count) {
    return Row(
      children: <Widget>[
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: sdkLinearGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Conversation',
          style: sdkRubikW700(isTablet: isTab).copyWith(
            fontSize: isTab ? 16 : 15,
            color: SdkColors.splashDeep,
            letterSpacing: 0.2,
          ),
        ),
        if (count > 0) ...<Widget>[
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  SdkColors.splashDeep,
                  SdkColors.splashGlowBright,
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: sdkRubikW700(isTablet: isTab).copyWith(
                fontSize: 10,
                color: Colors.white,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ── Empty state ──────────────────────────────────────────────────
  Widget _buildEmptyState(final bool isTab) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  SdkColors.splashDeep.withValues(alpha: 0.05),
                  SdkColors.splashGlowBright.withValues(alpha: 0.08),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              color: SdkColors.splashGlowBright.withValues(alpha: 0.7),
              size: 26,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'No messages yet',
            style: sdkRubikW600(isTablet: isTab).copyWith(
              fontSize: 13,
              color: SdkColors.splashDeep,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Start the conversation below',
            style: sdkRubikW400(isTablet: isTab).copyWith(
              fontSize: 11,
              color: SdkColors.homeSubtext,
            ),
          ),
        ],
      ),
    );
  }

  // ── Tree with collapsible reply threads ──────────────────────────
  List<Widget> _buildTree(
    final BuildContext context,
    final List<HelpdeskCommentModel> all,
  ) {
    // Group replies under their parent id (single-level threads).
    final Map<int, List<HelpdeskCommentModel>> repliesByParent =
        <int, List<HelpdeskCommentModel>>{};
    for (final HelpdeskCommentModel c in all) {
      if (c.parentCommentId != null) {
        repliesByParent
            .putIfAbsent(c.parentCommentId!, () => <HelpdeskCommentModel>[])
            .add(c);
      }
    }

    final List<HelpdeskCommentModel> parents = all
        .where((final HelpdeskCommentModel c) => c.parentCommentId == null)
        .toList();

    final List<Widget> out = <Widget>[];
    for (final HelpdeskCommentModel parent in parents) {
      out.add(
        MessageBubble(
          message: parent,
          onDelete: () {
            context.read<TicketDetailBloc>().add(
                  TicketDetailEvent.onDeleteMessage(messageId: parent.id),
                );
          },
          onReply: () {
            context.read<TicketDetailBloc>().add(
                  TicketDetailEvent.onStartReply(comment: parent),
                );
          },
        ),
      );

      final List<HelpdeskCommentModel> replies =
          repliesByParent[parent.id] ?? const <HelpdeskCommentModel>[];
      if (replies.isEmpty) continue;

      final bool expanded = _expandedParents.contains(parent.id);
      out.add(
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: _buildRepliesToggle(
            count: replies.length,
            expanded: expanded,
            onTap: () => _toggleExpanded(parent.id),
          ),
        ),
      );

      out.add(
        AnimatedSize(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeInOutCubic,
          alignment: Alignment.topCenter,
          child: ClipRect(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (
                final Widget child,
                final Animation<double> anim,
              ) =>
                  FadeTransition(
                opacity: anim,
                child: SizeTransition(
                  sizeFactor: anim,
                  axisAlignment: -1,
                  child: child,
                ),
              ),
              child: expanded
                  ? Column(
                      key: ValueKey<String>('replies-${parent.id}'),
                      children: replies
                          .map(
                            (final HelpdeskCommentModel reply) =>
                                _buildNestedReply(context, reply, parent),
                          )
                          .toList(),
                    )
                  : const SizedBox.shrink(key: ValueKey<String>('empty')),
            ),
          ),
        ),
      );
    }

    return out;
  }

  Widget _buildRepliesToggle({
    required final int count,
    required final bool expanded,
    required final VoidCallback onTap,
  }) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 18,
                height: 1.2,
                color: SdkColors.splashGlowBright.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 8),
              AnimatedRotation(
                duration: const Duration(milliseconds: 220),
                turns: expanded ? 0.5 : 0,
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 14,
                  color: SdkColors.splashGlowBright,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                expanded
                    ? 'Hide replies'
                    : 'View ${count == 1 ? '1 reply' : '$count replies'}',
                style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 11,
                  color: SdkColors.splashGlowBright,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNestedReply(
    final BuildContext context,
    final HelpdeskCommentModel reply,
    final HelpdeskCommentModel parent,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      SdkColors.splashGlowBright.withValues(alpha: 0.4),
                      SdkColors.splashGlowBright.withValues(alpha: 0.08),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: MessageBubble(
                message: reply,
                parent: parent,
                // Replies are not re-repliable.
                onReply: null,
                onDelete: () {
                  context.read<TicketDetailBloc>().add(
                        TicketDetailEvent.onDeleteMessage(
                          messageId: reply.id,
                        ),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
