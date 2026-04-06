import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket_detail/ticket_detail_bloc.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_conversation_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/message_bubble_widget.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(
      builder: (final BuildContext context, final TicketDetailState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Conversation',
                  style: sdkRubikW700(isTablet: isTab).copyWith(
                    fontSize: 15,
                    color: SdkColors.splashDeep,
                  ),
                ),
                if (state.conversations.isNotEmpty) ...<Widget>[
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: SdkColors.splashDeep.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${state.conversations.length}',
                      style: sdkRubikW600(isTablet: isTab).copyWith(
                        fontSize: 11,
                        color: SdkColors.splashDeep,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            if (state.conversations.isEmpty)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: SdkColors.homeSubtext.withValues(alpha: 0.4),
                      size: 36,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'No messages yet',
                      style: sdkRubikW400(isTablet: isTab).copyWith(
                        fontSize: 13,
                        color: SdkColors.homeSubtext,
                      ),
                    ),
                  ],
                ),
              )
            else
              ...state.conversations.map(
                (final ConversationMessage msg) => MessageBubble(
                  message: msg,
                  onDelete: () {
                    context.read<TicketDetailBloc>().add(
                          TicketDetailEvent.onDeleteMessage(messageId: msg.id),
                        );
                  },
                  onLike: () {
                    context.read<TicketDetailBloc>().add(
                          TicketDetailEvent.onLikeMessage(messageId: msg.id),
                        );
                  },
                  onDislike: () {
                    context.read<TicketDetailBloc>().add(
                          TicketDetailEvent.onDislikeMessage(messageId: msg.id),
                        );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
