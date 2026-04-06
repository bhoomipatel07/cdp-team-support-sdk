import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket_detail/ticket_detail_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

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
        .add(OnSendMessage(message: text));
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: SdkColors.bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: SdkColors.homeBorder, width: 1),
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
                        hintText: 'Type a message...',
                        hintStyle: sdkRubikW400(isTablet: isTab).copyWith(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.text_format_rounded,
                            size: 20, color: SdkColors.homeSubtext),
                        SizedBox(width: 8),
                        Icon(Icons.attach_file_rounded,
                            size: 20, color: SdkColors.homeSubtext),
                      ],
                    ),
                  ),
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
                    color: SdkColors.splashDeep.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child:
                  const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
