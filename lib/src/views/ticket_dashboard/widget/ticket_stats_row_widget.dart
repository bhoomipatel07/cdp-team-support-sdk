import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket/ticket_bloc.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_dashboard/widget/ticket_stat_card_widget.dart';

class TicketStatsRow extends StatelessWidget {
  const TicketStatsRow({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TicketBloc, TicketState>(
      builder: (final BuildContext context, final TicketState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TicketStatCard(
                  icon: Icons.confirmation_number_outlined,
                  count: state.totalCount,
                  label: 'Total',
                  accentColor: const Color(0xFF3B82F6),
                  index: 0,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TicketStatCard(
                  icon: TicketStatus.open.icon,
                  count: state.openCount,
                  label: 'Open',
                  accentColor: TicketStatus.open.color,
                  index: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TicketStatCard(
                  icon: TicketStatus.inProgress.icon,
                  count: state.inProgressCount,
                  label: 'In Progress',
                  accentColor: TicketStatus.inProgress.color,
                  index: 2,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TicketStatCard(
                  icon: TicketStatus.resolved.icon,
                  count: state.resolvedCount,
                  label: 'Resolved',
                  accentColor: TicketStatus.resolved.color,
                  index: 3,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TicketStatCard(
                  icon: TicketStatus.closed.icon,
                  count: state.closedCount,
                  label: 'Closed',
                  accentColor: TicketStatus.closed.color,
                  index: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
