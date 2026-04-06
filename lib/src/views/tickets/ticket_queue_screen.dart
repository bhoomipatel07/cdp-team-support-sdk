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

class TicketQueueScreen extends StatelessWidget {
  const TicketQueueScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TicketBloc>(
      create: (final BuildContext context) =>
          TicketBloc()..add(const OnLoadTickets()),
      child: const _TicketQueueBody(),
    );
  }
}

class _TicketQueueBody extends StatelessWidget {
  const _TicketQueueBody();

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: SdkColors.bgColor,
        appBar: const SdkAppBar(title: 'Ticket Queue'),
        body: BlocBuilder<TicketBloc, TicketState>(
          builder: (final BuildContext context, final TicketState state) {
            if (state.loadingState == CommonScreenState.loading ||
                state.loadingState == CommonScreenState.initial) {
              return const Padding(
                padding: EdgeInsets.only(top: 20),
                child: TicketShimmerWidget(),
              );
            }
            return Column(
              children: <Widget>[
                _buildFilterBar(context, state),
                if (isTab) _buildTabletHeader(),
                Expanded(
                  child: state.filteredTickets.isEmpty
                      ? _buildEmptyState()
                      : ListView.separated(
                          padding: isTab
                              ? const EdgeInsets.symmetric(horizontal: 16)
                              : const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                          itemCount: state.filteredTickets.length,
                          separatorBuilder:
                              (final BuildContext _, final int __) =>
                                  SizedBox(height: isTab ? 0 : 10),
                          itemBuilder:
                              (final BuildContext context, final int index) {
                            return TicketListItem(
                              ticket: state.filteredTickets[index],
                              index: index,
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterBar(final BuildContext context, final TicketState state) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: SdkColors.homeBorder, width: 1),
              ),
              child: Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.search_rounded,
                        size: 20, color: SdkColors.homeSubtext),
                  ),
                  Expanded(
                    child: TextField(
                      style: sdkRubikW400(isTablet: isTab).copyWith(
                          fontSize: 14, color: SdkColors.splashDeep),
                      cursorColor: SdkColors.splashDeep,
                      decoration: InputDecoration(
                        hintText: 'Search tickets...',
                        hintStyle: sdkRubikW400(isTablet: isTab).copyWith(
                            fontSize: 13, color: SdkColors.homeSubtext),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                    size: 18, color: SdkColors.homeSubtext),
                style: sdkRubikW500(isTablet: isTab)
                    .copyWith(fontSize: 12, color: SdkColors.splashDeep),
                items: <DropdownMenuItem<TicketStatus?>>[
                  DropdownMenuItem<TicketStatus?>(
                    value: null,
                    child: Text('All Status',
                        style: sdkRubikW500(isTablet: isTab).copyWith(
                            fontSize: 12, color: SdkColors.splashDeep)),
                  ),
                  ...TicketStatus.values.map(
                    (final TicketStatus status) =>
                        DropdownMenuItem<TicketStatus?>(
                      value: status,
                      child: Text(status.label,
                          style: sdkRubikW500(isTablet: isTab).copyWith(
                              fontSize: 12, color: status.color)),
                    ),
                  ),
                ],
                onChanged: (final TicketStatus? value) {
                  context
                      .read<TicketBloc>()
                      .add(OnFilterByStatus(status: value));
                },
              ),
            ),
          ),
        ],
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
    return Center(
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
          Text('Try adjusting your filter',
              style: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.homeSubtext)),
        ],
      ),
    );
  }
}
