import 'package:cdp_team_support_sdk/src/bloc/ticket/ticket_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/components/ticket_status_badge_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/ticket_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 350 + (index * 50)),
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
      child: GestureDetector(
        onTap: () async {
          final bool? didChange = await Navigator.push<bool>(
            context,
            MaterialPageRoute<bool>(
              builder: (final BuildContext _) =>
                  TicketDetailScreen(ticketId: ticket.id),
            ),
          );
          if (didChange == true && context.mounted) {
            context
                .read<TicketBloc>()
                .add(const TicketEvent.onLoadTickets());
          }
        },
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
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
          // ── Row 1: Ticket number + status ──────────────────
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

          // ── Row 2: Title ───────────────────────────────────
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

          // ── Row 3: Project + date + arrow ──────────────────
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
}
