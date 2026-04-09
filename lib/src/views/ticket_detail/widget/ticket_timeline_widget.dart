import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class TicketTimelineWidget extends StatelessWidget {
  final TicketModel ticket;

  const TicketTimelineWidget({super.key, required this.ticket});

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: EdgeInsets.all(isTab ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: SdkColors.homeShadow,
            blurRadius: 12,
            spreadRadius: -2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 3,
                height: 16,
                decoration: BoxDecoration(
                  color: SdkColors.splashGold,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Status Timeline',
                style: sdkRubikW700(isTablet: isTab).copyWith(
                  fontSize: isTab ? 16 : 14,
                  color: SdkColors.splashDeep,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List<Widget>.generate(
            ticket.timeline.length,
            (final int index) {
              final TicketTimelineEntry entry = ticket.timeline[index];
              final bool isLast = index == ticket.timeline.length - 1;
              return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 300 + (index * 100)),
                curve: Curves.easeOut,
                builder: (final BuildContext context, final double value,
                    final Widget? child) {
                  return Opacity(opacity: value, child: child);
                },
                child: _TimelineEntry(entry: entry, isLast: isLast),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final TicketTimelineEntry entry;
  final bool isLast;

  const _TimelineEntry({required this.entry, required this.isLast});

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: entry.dotColor,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: entry.dotColor.withValues(alpha: 0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: SdkColors.homeBorder,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    entry.title,
                    style: sdkRubikW500(isTablet: isTab)
                        .copyWith(fontSize: 13, color: SdkColors.splashDeep),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    DateFormat('MMM d, yyyy, h:mm:ss a')
                        .format(entry.timestamp),
                    style: sdkRubikW400(isTablet: isTab)
                        .copyWith(fontSize: 11, color: SdkColors.homeSubtext),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
