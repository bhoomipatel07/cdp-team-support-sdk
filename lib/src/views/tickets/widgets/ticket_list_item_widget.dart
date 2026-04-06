import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/ticket_status_badge_widget.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/ticket_detail_screen.dart';

class TicketListItem extends StatelessWidget {
  final TicketModel ticket;
  final int index;

  const TicketListItem({
    super.key,
    required this.ticket,
    this.index = 0,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 60)),
      curve: Curves.easeOutCubic,
      builder: (final BuildContext context, final double value,
          final Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 16 * (1 - value)),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (final BuildContext _) =>
                  TicketDetailScreen(ticketId: ticket.id),
            ),
          );
        },
        child: isTab ? _buildTabletRow() : _buildMobileCard(),
      ),
    );
  }

  Widget _buildMobileCard() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: const EdgeInsets.all(16),
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
              Text(
                ticket.ticketNumber,
                style: sdkRubikW700(isTablet: isTab).copyWith(
                  fontSize: 14,
                  color: SdkColors.splashGlow,
                  letterSpacing: 0.3,
                ),
              ),
              const Spacer(),
              TicketStatusBadge(status: ticket.status),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            ticket.title,
            style: sdkRubikW500(isTablet: isTab).copyWith(
              fontSize: 14,
              color: SdkColors.splashDeep,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              if (ticket.project != null) ...<Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: SdkColors.splashGlow.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    ticket.project!.name,
                    style: sdkRubikW500(isTablet: isTab).copyWith(
                      fontSize: 11,
                      color: SdkColors.splashGlow,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Text(
                DateFormat('MMM d, yyyy').format(ticket.createdAt),
                style: sdkRubikW400(isTablet: isTab).copyWith(
                  fontSize: 11,
                  color: SdkColors.homeSubtext,
                ),
              ),
              const Spacer(),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: SdkColors.splashDeep.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: SdkColors.splashDeep,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabletRow() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: SdkColors.homeBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 110,
            child: Text(
              ticket.ticketNumber,
              style: sdkRubikW700(isTablet: isTab).copyWith(
                fontSize: 14,
                color: SdkColors.splashGlow,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ticket.title,
              style: sdkRubikW500(isTablet: isTab).copyWith(
                fontSize: 14,
                color: SdkColors.splashDeep,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 120,
            child: TicketStatusBadge(status: ticket.status),
          ),
          Expanded(
            flex: 2,
            child: ticket.project != null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: SdkColors.splashGlow.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ticket.project!.name,
                      style: sdkRubikW500(isTablet: isTab).copyWith(
                        fontSize: 12,
                        color: SdkColors.splashGlow,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          SizedBox(
            width: 110,
            child: Text(
              DateFormat('MMM d, yyyy').format(ticket.createdAt),
              style: sdkRubikW400(isTablet: isTab).copyWith(
                fontSize: 13,
                color: SdkColors.homeSubtext,
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: SdkColors.splashDeep.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              size: 18,
              color: SdkColors.splashDeep,
            ),
          ),
        ],
      ),
    );
  }
}
