import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket_detail/ticket_detail_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/api/endpoints.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_attachment_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_detail_model.dart';
import 'package:cdp_team_support_sdk/src/data/repository/comment_repo.dart';
import 'package:cdp_team_support_sdk/src/data/repository/ticket_repo.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/components/sdk_app_bar.dart';
import 'package:cdp_team_support_sdk/src/views/create_ticket/create_ticket_screen.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/conversation_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/message_input_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/ticket_attachment_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/ticket_info_header_widget.dart';
import 'package:cdp_team_support_sdk/src/views/ticket_detail/widget/ticket_timeline_widget.dart';

class TicketDetailScreen extends StatelessWidget {
  final int ticketId;

  const TicketDetailScreen({super.key, required this.ticketId});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TicketDetailBloc>(
      create: (final BuildContext context) => TicketDetailBloc(
        ticketRepo: TicketRepoImp(),
        commentRepo: CommentRepoImp(),
      )..add(TicketDetailEvent.onLoadDetail(ticketId: ticketId)),
      child: _TicketDetailBody(ticketId: ticketId),
    );
  }
}

/// Converts the rich [HelpdeskTicketDetailModel] into the simpler
/// [TicketModel] shape that the downstream render widgets (header,
/// attachments, timeline) still consume.
TicketModel _detailToTicketModel(final HelpdeskTicketDetailModel d) {
  return TicketModel(
    id: d.id,
    ticketNumber: d.ticketNumber,
    title: d.title,
    description: d.description,
    status: TicketStatus.fromName(d.statusName),
    project: d.projectName != null
        ? ProjectModel(id: d.projectId ?? 0, name: d.projectName!)
        : null,
    clientNote: d.clientNote,
    createdAt: d.createdOn,
    updatedAt: d.updatedOn ?? d.createdOn,
    attachments: d.attachments
        .map(
          (final HelpdeskAttachmentModel a) => TicketAttachment(
            id: a.id,
            fileName: a.fileName,
            fileExtension: a.fileExtension,
            fileSizeBytes: a.fileSizeBytes,
            // Prefer a URL returned inline by the API; otherwise build
            // one against the preview endpoint so the UI can stream it.
            remoteUrl: a.url ??
                '${SupportSdkConfig.instance.baseUrl}'
                    '${SupportEndpoints.previewHelpdeskAttachment(attachmentId: a.id)}',
          ),
        )
        .toList(),
    timeline: d.timeline
        .map(
          (final HelpdeskActivityLogModel e) => TicketTimelineEntry(
            title: e.description,
            timestamp: e.createdOn,
            dotColor: const Color(0xFF3B82F6),
          ),
        )
        .toList(),
  );
}

class _TicketDetailBody extends StatefulWidget {
  final int ticketId;

  const _TicketDetailBody({required this.ticketId});

  @override
  State<_TicketDetailBody> createState() => _TicketDetailBodyState();
}

class _TicketDetailBodyState extends State<_TicketDetailBody> {
  /// True after a successful edit (or any state change that the list
  /// would want to reflect). Forwarded as the result when the screen
  /// pops, so the parent list can decide whether to refetch.
  bool _didChange = false;

  void _popWithResult() {
    Navigator.of(context).pop(_didChange);
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult:
          (final bool didPop, final Object? result) {
        if (didPop) return;
        _popWithResult();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: BlocConsumer<TicketDetailBloc, TicketDetailState>(
          listenWhen: (final TicketDetailState prev,
                  final TicketDetailState curr) =>
              !prev.isDeleted && curr.isDeleted,
          listener:
              (final BuildContext context, final TicketDetailState state) {
            // Delete succeeded — pop back to the list with `true` so
            // the list refreshes regardless of any prior edit state.
            Navigator.of(context).pop(true);
          },
          builder:
              (final BuildContext context, final TicketDetailState state) {
            if (state.loadingState == CommonScreenState.loading ||
                state.loadingState == CommonScreenState.initial) {
              return Scaffold(
                backgroundColor: SdkColors.bgColor,
                appBar: SdkAppBar(
                  title: 'Ticket Details',
                  onBack: _popWithResult,
                ),
                body: const Center(
                  child:
                      CircularProgressIndicator(color: SdkColors.splashDeep),
                ),
              );
            }
            if (state.detail == null) {
              return Scaffold(
                backgroundColor: SdkColors.bgColor,
                appBar: SdkAppBar(
                  title: 'Ticket Details',
                  onBack: _popWithResult,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.error_outline_rounded,
                          color: SdkColors.homeSubtext, size: 48),
                      const SizedBox(height: 12),
                      Text('Ticket not found',
                          style: sdkRubikW600(isTablet: isTab).copyWith(
                              fontSize: 16, color: SdkColors.splashDeep)),
                    ],
                  ),
                ),
              );
            }

            final TicketModel ticket = _detailToTicketModel(state.detail!);
            final bool canEdit = ticket.status == TicketStatus.open;

            return Scaffold(
              backgroundColor: SdkColors.bgColor,
              appBar: SdkAppBar(
                title: ticket.ticketNumber,
                onBack: _popWithResult,
                actionWidget: canEdit
                    ? GestureDetector(
                        onTap: () => _showActionsSheet(context, ticket),
                        child: Container(
                          width: isTab ? 40 : 34,
                          height: isTab ? 40 : 34,
                          decoration: BoxDecoration(
                            color:
                                SdkColors.splashDeep.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: isTab ? 22 : 18,
                            color: SdkColors.splashDeep,
                          ),
                        ),
                      )
                    : SizedBox(width: isTab ? 48 : 42),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: isTab
                        ? _buildTabletLayout(context, state)
                        : _buildMobileLayout(context, state),
                  ),
                  const MessageInputWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showActionsSheet(
      final BuildContext context, final TicketModel ticket) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (final BuildContext sheetContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border.all(
                color: SdkColors.splashDeep.withValues(alpha: 0.08),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: SdkColors.splashDeep.withValues(alpha: 0.12),
                  blurRadius: 30,
                  offset: const Offset(0, -8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 12),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: SdkColors.homeBorder,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
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
                        'Ticket Actions',
                        style: sdkRubikW700(isTablet: isTab).copyWith(
                          fontSize: isTab ? 18 : 16,
                          color: SdkColors.splashDeep,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ticket.ticketNumber,
                      style: sdkRubikW400(isTablet: isTab).copyWith(
                        fontSize: 12,
                        color: SdkColors.homeSubtext,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(height: 1, color: SdkColors.homeBorder),
                _buildSheetOption(
                  icon: Icons.edit_outlined,
                  label: 'Edit Ticket',
                  subtitle: 'Update title, description, or attachments',
                  iconBgColor: SdkColors.splashGlow.withValues(alpha: 0.08),
                  iconColor: SdkColors.splashGlow,
                  onTap: () async {
                    Navigator.pop(sheetContext);
                    // Capture the bloc before the await so we don't use
                    // `context` across an async gap. CreateTicketScreen
                    // pops `true` on a successful submit; when that
                    // happens, reload the detail to pick up server
                    // changes and remember that the list will need to
                    // refresh too when this screen is popped.
                    final TicketDetailBloc detailBloc =
                        context.read<TicketDetailBloc>();
                    final bool? updated = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute<bool>(
                        builder: (final BuildContext _) => CreateTicketScreen(
                          isEditMode: true,
                          ticketData: ticket,
                        ),
                      ),
                    );
                    if (updated == true && mounted) {
                      setState(() => _didChange = true);
                      detailBloc.add(
                        TicketDetailEvent.onLoadDetail(
                          ticketId: widget.ticketId,
                        ),
                      );
                    }
                  },
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: SdkColors.homeBorder,
                ),
                _buildSheetOption(
                  icon: Icons.delete_outline_rounded,
                  label: 'Delete Ticket',
                  subtitle: 'Permanently remove this ticket',
                  iconBgColor:
                      SdkColors.colorError500.withValues(alpha: 0.06),
                  iconColor: SdkColors.colorError500,
                  labelColor: SdkColors.colorError500,
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _showDeleteConfirmation(context, ticket);
                  },
                ),
                SizedBox(
                    height: MediaQuery.of(sheetContext).padding.bottom),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSheetOption({
    required final IconData icon,
    required final String label,
    required final String subtitle,
    required final Color iconBgColor,
    required final Color iconColor,
    final Color? labelColor,
    required final VoidCallback onTap,
  }) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: <Widget>[
            Container(
              width: isTab ? 46 : 42,
              height: isTab ? 46 : 42,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: sdkRubikW600(isTablet: isTab).copyWith(
                      fontSize: isTab ? 16 : 15,
                      color: labelColor ?? SdkColors.splashDeep,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: 12,
                      color: SdkColors.homeSubtext,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                size: 20, color: SdkColors.homeSubtext),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(
      final BuildContext context, final TicketModel ticket) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    // Grab the bloc from the outer context so the dialog (which is
    // built outside the BlocProvider subtree) can still read it.
    final TicketDetailBloc bloc = context.read<TicketDetailBloc>();
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      barrierDismissible: false,
      builder: (final BuildContext dialogContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: BlocProvider<TicketDetailBloc>.value(
            value: bloc,
            child: BlocConsumer<TicketDetailBloc, TicketDetailState>(
              listenWhen: (final TicketDetailState prev,
                      final TicketDetailState curr) =>
                  !prev.isDeleted && curr.isDeleted,
              listener: (final BuildContext ctx, final TicketDetailState _) {
                Navigator.pop(dialogContext);
              },
              builder: (final BuildContext ctx, final TicketDetailState state) {
                final bool isDeleting = state.isDeleting;
                return Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Container(
              padding: EdgeInsets.all(isTab ? 32 : 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: SdkColors.splashDeep.withValues(alpha: 0.1),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: SdkColors.splashDeep.withValues(alpha: 0.15),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: isTab ? 72 : 60,
                    height: isTab ? 72 : 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          SdkColors.colorError500.withValues(alpha: 0.06),
                      border: Border.all(
                        color: SdkColors.colorError500
                            .withValues(alpha: 0.15),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: SdkColors.colorError500,
                      size: isTab ? 36 : 28,
                    ),
                  ),
                  SizedBox(height: isTab ? 18 : 14),
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: SdkColors.splashGold,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: isTab ? 16 : 12),
                  Text(
                    'Delete Ticket?',
                    style: sdkRubikW700(isTablet: isTab).copyWith(
                      fontSize: isTab ? 22 : 18,
                      color: SdkColors.splashDeep,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This action cannot be undone. The ticket and all its data will be permanently removed.',
                    textAlign: TextAlign.center,
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: isTab ? 14 : 12,
                      color: SdkColors.homeSubtext,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: isTab ? 28 : 22),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: isDeleting
                              ? null
                              : () => Navigator.pop(dialogContext),
                          child: Opacity(
                            opacity: isDeleting ? 0.5 : 1,
                            child: Container(
                              height: isTab ? 48 : 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: SdkColors.splashDeep
                                      .withValues(alpha: 0.2),
                                ),
                              ),
                              child: Center(
                                child: Text('Cancel',
                                    style: sdkRubikW600(isTablet: isTab)
                                        .copyWith(
                                            fontSize: isTab ? 15 : 13,
                                            color: SdkColors.splashDeep)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: isTab ? 14 : 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: isDeleting
                              ? null
                              : () {
                                  ctx.read<TicketDetailBloc>().add(
                                        const TicketDetailEvent.onDeleteTicket(),
                                      );
                                },
                          child: Container(
                            height: isTab ? 48 : 44,
                            decoration: BoxDecoration(
                              color: SdkColors.colorError500,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: SdkColors.colorError500
                                      .withValues(alpha: 0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: isDeleting
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Delete',
                                      style: sdkRubikW600(isTablet: isTab)
                                          .copyWith(
                                        fontSize: isTab ? 15 : 13,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(
      final BuildContext context, final TicketDetailState state) {
    final TicketModel ticket = _detailToTicketModel(state.detail!);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        TicketInfoHeader(ticket: ticket),
        const SizedBox(height: 16),
        _buildDescriptionCard(ticket),
        if (ticket.clientNote != null &&
            ticket.clientNote!.isNotEmpty) ...<Widget>[
          const SizedBox(height: 12),
          _buildNoteCard(ticket),
        ],
        if (ticket.attachments.isNotEmpty) ...<Widget>[
          const SizedBox(height: 16),
          TicketAttachmentWidget(attachments: ticket.attachments),
        ],
        const SizedBox(height: 16),
        TicketTimelineWidget(ticket: ticket),
        const SizedBox(height: 20),
        const ConversationWidget(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTabletLayout(
      final BuildContext context, final TicketDetailState state) {
    final TicketModel ticket = _detailToTicketModel(state.detail!);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 65,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              TicketInfoHeader(ticket: ticket),
              const SizedBox(height: 16),
              _buildDescriptionCard(ticket),
              if (ticket.clientNote != null &&
                  ticket.clientNote!.isNotEmpty) ...<Widget>[
                const SizedBox(height: 12),
                _buildNoteCard(ticket),
              ],
              if (ticket.attachments.isNotEmpty) ...<Widget>[
                const SizedBox(height: 16),
                TicketAttachmentWidget(attachments: ticket.attachments),
              ],
              const SizedBox(height: 20),
              const ConversationWidget(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        Container(width: 1, color: SdkColors.homeBorder),
        Expanded(
          flex: 35,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[TicketTimelineWidget(ticket: ticket)],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionCard(final TicketModel ticket) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTab ? 18 : 14),
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
          Text('DESCRIPTION',
              style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 11,
                  color: SdkColors.homeSubtext,
                  letterSpacing: 0.6)),
          const SizedBox(height: 10),
          Text(
            ticket.description,
            style: sdkRubikW400(isTablet: isTab).copyWith(
              fontSize: isTab ? 14 : 13,
              color: SdkColors.splashDeep.withValues(alpha: 0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard(final TicketModel ticket) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTab ? 18 : 14),
      decoration: BoxDecoration(
        color: SdkColors.splashGold.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: SdkColors.splashGold.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            height: 40,
            decoration: BoxDecoration(
              color: SdkColors.splashGold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.sticky_note_2_outlined,
                        size: 16, color: SdkColors.splashGold),
                    const SizedBox(width: 6),
                    Text('NOTE',
                        style: sdkRubikW700(isTablet: isTab).copyWith(
                            fontSize: 12,
                            color: SdkColors.splashGold,
                            letterSpacing: 0.5)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  ticket.clientNote!,
                  style: sdkRubikW400(isTablet: isTab).copyWith(
                    fontSize: isTab ? 14 : 13,
                    color: SdkColors.splashDeep.withValues(alpha: 0.8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
