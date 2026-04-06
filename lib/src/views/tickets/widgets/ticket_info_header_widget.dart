import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class TicketInfoHeader extends StatelessWidget {
  final TicketModel ticket;

  const TicketInfoHeader({super.key, required this.ticket});

  @override
  Widget build(final BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: _InfoCard(
              label: 'PROJECT',
              value: ticket.project?.name ?? 'Unassigned',
              accentColor: const Color(0xFF14B8A6),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _InfoCard(
              label: 'CREATED',
              value: DateFormat('MMM d, yyyy').format(ticket.createdAt),
              subValue: DateFormat('h:mm a').format(ticket.createdAt),
              accentColor: const Color(0xFF3B82F6),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _InfoCard(
              label: 'UPDATED',
              value: DateFormat('MMM d, yyyy').format(ticket.updatedAt),
              subValue: DateFormat('h:mm a').format(ticket.updatedAt),
              accentColor: const Color(0xFFF59E0B),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subValue;
  final Color accentColor;

  const _InfoCard({
    required this.label,
    required this.value,
    this.subValue,
    required this.accentColor,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: EdgeInsets.all(isTab ? 16 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: SdkColors.homeShadow,
            blurRadius: 8,
            spreadRadius: -2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: sdkRubikW600(isTablet: isTab).copyWith(
              fontSize: 10,
              color: accentColor,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(height: isTab ? 8 : 6),
          Text(
            value,
            style: sdkRubikW600(isTablet: isTab).copyWith(
              fontSize: isTab ? 14 : 13,
              color: SdkColors.splashDeep,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subValue != null) ...<Widget>[
            const SizedBox(height: 2),
            Text(
              subValue!,
              style: sdkRubikW400(isTablet: isTab).copyWith(
                fontSize: 11,
                color: SdkColors.homeSubtext,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
