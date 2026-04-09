import 'package:cdp_team_support_sdk/src/bloc/ticket_detail/ticket_detail_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_comment_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({super.key});

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final String text = _controller.text.trim();
    if (text.isEmpty) return;
    context
        .read<TicketDetailBloc>()
        .add(TicketDetailEvent.onSendMessage(message: text));
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return BlocConsumer<TicketDetailBloc, TicketDetailState>(
      // Auto-focus the input the moment the user taps Reply on a comment.
      listenWhen: (final TicketDetailState prev,
          final TicketDetailState curr) =>
      prev.replyingTo?.id != curr.replyingTo?.id && curr.replyingTo != null,
      listener: (final BuildContext context, final TicketDetailState _) {
        _focusNode.requestFocus();
      },
      builder: (final BuildContext context, final TicketDetailState state) {
        final HelpdeskCommentModel? replyingTo = state.replyingTo;
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery
                .of(context)
                .padding
                .bottom + 12,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: SdkColors.homeBorder, width: 1),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: SdkColors.homeShadow,
                blurRadius: 12,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (replyingTo != null) _buildReplyBanner(context, replyingTo),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: SdkColors.bgColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: SdkColors.homeBorder, width: 1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              focusNode: _focusNode,
                              style: sdkRubikW400(isTablet: isTab).copyWith(
                                fontSize: isTab ? 15 : 14,
                                color: SdkColors.splashDeep,
                              ),
                              cursorColor: SdkColors.splashDeep,
                              decoration: InputDecoration(
                                hintText: replyingTo == null
                                    ? 'Type a message...'
                                    : 'Reply to ${replyingTo.userName}...',
                                hintStyle:
                                sdkRubikW400(isTablet: isTab).copyWith(
                                  fontSize: 14,
                                  color: SdkColors.homeSubtext,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              maxLines: 3,
                              minLines: 1,
                              textInputAction: TextInputAction.send,
                              onSubmitted: (final String _) => _sendMessage(),
                            ),
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 8),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: <Widget>[
                          //       Icon(Icons.text_format_rounded,
                          //           size: 20, color: SdkColors.homeSubtext),
                          //       SizedBox(width: 8),
                          //       Icon(Icons.attach_file_rounded,
                          //           size: 20, color: SdkColors.homeSubtext),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      width: isTab ? 48 : 44,
                      height: isTab ? 48 : 44,
                      decoration: BoxDecoration(
                        color: SdkColors.splashDeep,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color:
                            SdkColors.splashDeep.withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.send_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReplyBanner(final BuildContext context,
      final HelpdeskCommentModel target,) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: SdkColors.splashGlow.withValues(alpha: 0.6),
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.reply_rounded,
              size: 16, color: SdkColors.splashGlow),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Replying to ${target.userName}',
                  style: sdkRubikW600(isTablet: isTab).copyWith(
                    fontSize: 11,
                    color: SdkColors.splashGlow,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  target.commentText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: sdkRubikW400(isTablet: isTab).copyWith(
                    fontSize: 12,
                    color: SdkColors.homeSubtext,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () =>
                context
                    .read<TicketDetailBloc>()
                    .add(const TicketDetailEvent.onCancelReply()),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close_rounded,
                  size: 16, color: SdkColors.homeSubtext),
            ),
          ),
        ],
      ),
    );
  }
}
