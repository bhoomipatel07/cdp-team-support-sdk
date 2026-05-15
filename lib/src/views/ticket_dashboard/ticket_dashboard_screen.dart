import 'package:cdp_team_support_sdk/src/bloc/ticket/ticket_bloc.dart';
import 'package:cdp_team_support_sdk/src/components/sdk_app_bar.dart';
import 'package:cdp_team_support_sdk/src/components/ticket_list_item_widget.dart';
import 'package:cdp_team_support_sdk/src/components/ticket_shimmer_widget.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_status_model.dart';
import 'package:cdp_team_support_sdk/src/data/repository/attachment_repo.dart';
import 'package:cdp_team_support_sdk/src/data/repository/ticket_repo.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/create_ticket/create_ticket_screen.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_dashboard/widget/ticket_stats_row_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_queue/ticket_queue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDashboardScreen extends StatelessWidget {
  const TicketDashboardScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TicketBloc>(
      create: (final BuildContext context) => TicketBloc(
        ticketRepo: TicketRepoImp(),
        attachmentRepo: AttachmentRepoImp(),
      )..add(const TicketEvent.onLoadTickets()),
      child: const _TicketDashboardBody(),
    );
  }
}

class _TicketDashboardBody extends StatefulWidget {
  const _TicketDashboardBody();

  @override
  State<_TicketDashboardBody> createState() => _TicketDashboardBodyState();
}

class _TicketDashboardBodyState extends State<_TicketDashboardBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    // Trigger next page fetch when within 300px of the bottom.
    final double threshold = _scrollController.position.maxScrollExtent - 300;
    if (_scrollController.position.pixels >= threshold) {
      context.read<TicketBloc>().add(const TicketEvent.onLoadMoreTickets());
    }
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: SdkColors.bgColor,
        appBar: const SdkAppBar(title: 'HelpDesk'),
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
                context.read<TicketBloc>().add(
                  const TicketEvent.onLoadTickets(),
                );
              },
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: isTab ? 18 : 14),
                  const TicketStatsRow(),
                  SizedBox(height: isTab ? 20 : 14),
                  _buildSectionHeader(context, state),
                  const SizedBox(height: 10),
                  if (state.isRefreshingList)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: SizedBox(
                          width: 26,
                          height: 26,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            color: SdkColors.splashDeep,
                          ),
                        ),
                      ),
                    )
                  else if (state.filteredTickets.isEmpty)
                    _buildEmptyState()
                  else if (isTab)
                    // ── Tablet: 2-column card grid ──────────────
                    _buildTabletGrid(state)
                  else ...<Widget>[
                    // ── Mobile: stacked cards ───────────────────
                    ...List<Widget>.generate(
                      state.filteredTickets.length,
                      (final int index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: TicketListItem(
                          ticket: state.filteredTickets[index],
                          index: index,
                        ),
                      ),
                    ),
                  ],
                  if (!state.isRefreshingList && state.isLoadingMore)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: SdkColors.splashDeep,
                          ),
                        ),
                      ),
                    ),
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
      builder:
          (
            final BuildContext context,
            final double value,
            final Widget? child,
          ) {
            return Transform.scale(scale: value, child: child);
          },
      child: FloatingActionButton.extended(
        onPressed: () async {
          final bool? created = await Navigator.push<bool>(
            context,
            MaterialPageRoute<bool>(
              builder: (final BuildContext _) => const CreateTicketScreen(),
            ),
          );
          // Create screen pops `true` on successful submit — refresh
          // the dashboard's own bloc so the new ticket shows up.
          if (created == true && context.mounted) {
            context.read<TicketBloc>().add(const TicketEvent.onLoadTickets());
          }
        },
        backgroundColor: SdkColors.splashDeep,
        elevation: 6,
        icon: const Icon(Icons.add_rounded, color: Colors.white, size: 22),
        label: Text(
          'New Ticket',
          style: sdkRubikW600(
            isTablet: isTab,
          ).copyWith(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    final BuildContext context,
    final TicketState state,
  ) {
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
          // "View All" is only meaningful when there are additional
          // pages of tickets on the server — hide it on single-page
          // result sets to avoid a dead navigation.
          if (state.hasMore) ...<Widget>[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (final BuildContext _) =>
                        const TicketQueueScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
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
                    Text(
                      'View All',
                      style: sdkRubikW500(
                        isTablet: isTab,
                      ).copyWith(fontSize: 11, color: Colors.white),
                    ),
                    const SizedBox(width: 3),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 13,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(
    final BuildContext context,
    final TicketState state,
  ) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<HelpdeskTicketStatusModel?>(
          value: state.selectedFilter,
          isDense: true,
          dropdownColor: Colors.white,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: SdkColors.homeSubtext,
          ),
          style: sdkRubikW500(
            isTablet: isTab,
          ).copyWith(fontSize: 11, color: SdkColors.splashDeep),
          items: <DropdownMenuItem<HelpdeskTicketStatusModel?>>[
            DropdownMenuItem<HelpdeskTicketStatusModel?>(
              value: null,
              child: Text(
                'All Status',
                style: sdkRubikW500(
                  isTablet: isTab,
                ).copyWith(fontSize: 11, color: SdkColors.splashDeep),
              ),
            ),
            ...state.statuses.map(
              (final HelpdeskTicketStatusModel s) =>
                  DropdownMenuItem<HelpdeskTicketStatusModel?>(
                    value: s,
                    child: Text(
                      s.statusName,
                      style: sdkRubikW500(
                        isTablet: isTab,
                      ).copyWith(fontSize: 11, color: SdkColors.splashDeep),
                    ),
                  ),
            ),
          ],
          onChanged: (final HelpdeskTicketStatusModel? value) {
            context.read<TicketBloc>().add(
              TicketEvent.onFilterByStatus(status: value),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabletGrid(final TicketState state) {
    final List<TicketModel> tickets = state.filteredTickets;
    // Build pairs for a 2-column layout.
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < tickets.length; i += 2) {
      final bool hasPair = i + 1 < tickets.length;
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TicketListItem(ticket: tickets[i], index: i),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: hasPair
                    ? TicketListItem(ticket: tickets[i + 1], index: i + 1)
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }

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
            child: const Icon(
              Icons.confirmation_number_outlined,
              color: SdkColors.splashDeep,
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No tickets found',
            style: sdkRubikW600(
              isTablet: isTab,
            ).copyWith(fontSize: 16, color: SdkColors.splashDeep),
          ),
          const SizedBox(height: 6),
          Text(
            'Try adjusting your filter or create a new ticket',
            style: sdkRubikW400(
              isTablet: isTab,
            ).copyWith(fontSize: 13, color: SdkColors.homeSubtext),
          ),
        ],
      ),
    );
  }
}
