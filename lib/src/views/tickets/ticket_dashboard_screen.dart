import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket/ticket_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/sdk_app_bar.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/ticket_list_item_widget.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/ticket_shimmer_widget.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/ticket_stats_row_widget.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/ticket_queue_screen.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/create_ticket_screen.dart';

class TicketDashboardScreen extends StatelessWidget {
  const TicketDashboardScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TicketBloc>(
      create: (final BuildContext context) =>
          TicketBloc()..add(const TicketEvent.onLoadTickets()),
      child: const _TicketDashboardBody(),
    );
  }
}

class _TicketDashboardBody extends StatelessWidget {
  const _TicketDashboardBody();

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: SdkColors.bgColor,
        appBar: const SdkAppBar(title: 'Support'),
        floatingActionButton: _buildFab(context),
        body: BlocBuilder<TicketBloc, TicketState>(
          builder: (final BuildContext context, final TicketState state) {
            if (state.loadingState == CommonScreenState.loading ||
                state.loadingState == CommonScreenState.initial) {
              return const TicketShimmerWidget();
            }
            return RefreshIndicator(
              color: SdkColors.splashDeep,
              onRefresh: () async {
                context.read<TicketBloc>().add(const TicketEvent.onLoadTickets());
              },
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: isTab ? 18 : 14),
                  const TicketStatsRow(),
                  SizedBox(height: isTab ? 20 : 14),
                  _buildSectionHeader(context, state),
                  const SizedBox(height: 10),
                  if (isTab) _buildTabletHeader(),
                  ...List<Widget>.generate(
                    state.filteredTickets.length,
                    (final int index) => Padding(
                      padding: isTab
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                      child: TicketListItem(
                        ticket: state.filteredTickets[index],
                        index: index,
                      ),
                    ),
                  ),
                  if (state.filteredTickets.isEmpty) _buildEmptyState(),
                  const SizedBox(height: 80),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFab(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      builder: (final BuildContext context, final double value,
          final Widget? child) {
        return Transform.scale(scale: value, child: child);
      },
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (final BuildContext _) => const CreateTicketScreen(),
            ),
          );
        },
        backgroundColor: SdkColors.splashDeep,
        elevation: 6,
        icon: const Icon(Icons.add_rounded, color: Colors.white, size: 22),
        label: Text(
          'New Ticket',
          style: sdkRubikW600(isTablet: isTab)
              .copyWith(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      final BuildContext context, final TicketState state) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Container(
            width: 3,
            height: 18,
            decoration: BoxDecoration(
              color: SdkColors.splashGold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'My Tickets',
            style: sdkRubikW600(isTablet: isTab).copyWith(
              fontSize: isTab ? 18 : 16,
              color: SdkColors.splashDeep,
              letterSpacing: 0.3,
            ),
          ),
          const Spacer(),
          _buildFilterDropdown(context, state),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (final BuildContext _) => const TicketQueueScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: SdkColors.splashDeep,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: SdkColors.splashDeep.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('View All',
                      style: sdkRubikW500(isTablet: isTab)
                          .copyWith(fontSize: 11, color: Colors.white)),
                  const SizedBox(width: 3),
                  const Icon(Icons.arrow_forward_rounded,
                      size: 13, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(
      final BuildContext context, final TicketState state) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TicketStatus?>(
          value: state.selectedFilter,
          isDense: true,
          dropdownColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              size: 16, color: SdkColors.homeSubtext),
          style: sdkRubikW500(isTablet: isTab)
              .copyWith(fontSize: 11, color: SdkColors.splashDeep),
          items: <DropdownMenuItem<TicketStatus?>>[
            DropdownMenuItem<TicketStatus?>(
              value: null,
              child: Text('All Status',
                  style: sdkRubikW500(isTablet: isTab)
                      .copyWith(fontSize: 11, color: SdkColors.splashDeep)),
            ),
            ...TicketStatus.values.map(
              (final TicketStatus status) => DropdownMenuItem<TicketStatus?>(
                value: status,
                child: Text(status.label,
                    style: sdkRubikW500(isTablet: isTab)
                        .copyWith(fontSize: 11, color: status.color)),
              ),
            ),
          ],
          onChanged: (final TicketStatus? value) {
            context.read<TicketBloc>().add(TicketEvent.onFilterByStatus(status: value));
          },
        ),
      ),
    );
  }

  Widget _buildTabletHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 110, child: Text('TICKET #', style: _hStyle())),
          Expanded(flex: 3, child: Text('TITLE', style: _hStyle())),
          SizedBox(width: 120, child: Text('STATUS', style: _hStyle())),
          Expanded(
              flex: 2,
              child: Text('PROJECT',
                  style: _hStyle(), textAlign: TextAlign.center)),
          SizedBox(width: 110, child: Text('CREATED', style: _hStyle())),
          const SizedBox(width: 36),
        ],
      ),
    );
  }

  TextStyle _hStyle() => sdkRubikW600().copyWith(
      fontSize: 11, color: SdkColors.homeSubtext, letterSpacing: 0.8);

  Widget _buildEmptyState() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: SdkColors.splashDeep.withValues(alpha: 0.06),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.confirmation_number_outlined,
                color: SdkColors.splashDeep, size: 30),
          ),
          const SizedBox(height: 16),
          Text('No tickets found',
              style: sdkRubikW600(isTablet: isTab)
                  .copyWith(fontSize: 16, color: SdkColors.splashDeep)),
          const SizedBox(height: 6),
          Text('Try adjusting your filter or create a new ticket',
              style: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.homeSubtext)),
        ],
      ),
    );
  }
}
