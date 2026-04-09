import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/common_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_attachment_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_list_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_status_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/ticket_dashboard_counts_model.dart';
import 'package:cdp_team_support_sdk/src/data/repository/attachment_repo.dart';
import 'package:cdp_team_support_sdk/src/data/repository/ticket_repo.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';

part 'ticket_event.dart';

part 'ticket_state.dart';

part 'ticket_bloc.freezed.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TicketRepo ticketRepo;
  final AttachmentRepo attachmentRepo;

  TicketBloc({
    required this.ticketRepo,
    required this.attachmentRepo,
  }) : super(TicketState.initial()) {
    on<OnLoadTickets>(_onLoadTickets);
    on<OnLoadMoreTickets>(_onLoadMoreTickets);
    on<OnFilterByStatus>(_onFilterByStatus);
    on<OnChangeTitle>(_onChangeTitle);
    on<OnChangeDescription>(_onChangeDescription);
    on<OnChangeNote>(_onChangeNote);
    on<OnSubmitTicket>(_onSubmitTicket);
    on<OnDeleteTicket>(_onDeleteTicket);
    on<OnResetForm>(_onResetForm);
  }

  Future<void> _onLoadTickets(
    final OnLoadTickets event,
    final Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(loadingState: CommonScreenState.loading));

    // Fetch counts + statuses + first page of tickets in parallel.
    // Counts feed the stat cards. Statuses are a separate dynamic list
    // (NOT used by the count UI). Tickets populate the paginated list,
    // optionally filtered server-side by the currently-selected status.
    final List<dynamic> results = await Future.wait<dynamic>(<Future<dynamic>>[
      ticketRepo.getDashboardCounts(),
      ticketRepo.getTicketStatuses(),
      ticketRepo.getMyTickets(
        pageNumber: 1,
        pageSize: state.pageSize,
        statusCode: state.selectedFilter?.statusCode,
      ),
    ]);

    final Either<Failure, TicketDashboardCountsModel> countsResult =
        results[0] as Either<Failure, TicketDashboardCountsModel>;
    final Either<Failure, List<HelpdeskTicketStatusModel>> statusesResult =
        results[1] as Either<Failure, List<HelpdeskTicketStatusModel>>;
    final Either<Failure, HelpdeskTicketListResponseModel> ticketsResult =
        results[2] as Either<Failure, HelpdeskTicketListResponseModel>;

    final TicketDashboardCountsModel counts = countsResult.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] getDashboardCounts failed: ${error.message}');
        return TicketDashboardCountsModel.empty;
      },
      (final TicketDashboardCountsModel data) => data,
    );

    final List<HelpdeskTicketStatusModel> statuses = statusesResult.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] getTicketStatuses failed: ${error.message}');
        return const <HelpdeskTicketStatusModel>[];
      },
      (final List<HelpdeskTicketStatusModel> data) => data,
    );

    final HelpdeskTicketListResponseModel ticketPage = ticketsResult.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] getMyTickets failed: ${error.message}');
        return const HelpdeskTicketListResponseModel(
          items: <TicketModel>[],
          totalCount: 0,
          pageNumber: 1,
          pageSize: 0,
        );
      },
      (final HelpdeskTicketListResponseModel data) => data,
    );

    // Server already applied the status filter — list is authoritative.
    final List<TicketModel> tickets = ticketPage.items;

    emit(state.copyWith(
      loadingState: CommonScreenState.loaded,
      allTickets: tickets,
      filteredTickets: tickets,
      statuses: statuses,
      totalCount: counts.totalCount,
      openCount: counts.openCount,
      inProgressCount: counts.inProgressCount,
      resolvedCount: counts.resolvedCount,
      closedCount: counts.closedCount,
      currentPage: 1,
      totalTickets: ticketPage.totalCount,
      hasMore: ticketPage.hasMore,
      isLoadingMore: false,
    ));
  }

  Future<void> _onLoadMoreTickets(
    final OnLoadMoreTickets event,
    final Emitter<TicketState> emit,
  ) async {
    // Guard: no more pages, or already fetching the next page.
    if (!state.hasMore || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final int nextPage = state.currentPage + 1;
    final Either<Failure, HelpdeskTicketListResponseModel> result =
        await ticketRepo.getMyTickets(
      pageNumber: nextPage,
      pageSize: state.pageSize,
      statusCode: state.selectedFilter?.statusCode,
    );

    result.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] loadMore failed: ${error.message}');
        emit(state.copyWith(isLoadingMore: false));
      },
      (final HelpdeskTicketListResponseModel page) {
        final List<TicketModel> merged = <TicketModel>[
          ...state.allTickets,
          ...page.items,
        ];
        emit(state.copyWith(
          allTickets: merged,
          filteredTickets: merged,
          currentPage: nextPage,
          totalTickets: page.totalCount,
          hasMore: merged.length < page.totalCount,
          isLoadingMore: false,
        ));
      },
    );
  }

  Future<void> _onFilterByStatus(
    final OnFilterByStatus event,
    final Emitter<TicketState> emit,
  ) async {
    // Changing the status filter re-fetches page 1 from the server but
    // only the list section should show a loading indicator — leave
    // `loadingState` alone so the stat cards / header stay rendered.
    emit(state.copyWith(
      selectedFilter: event.status,
      isRefreshingList: true,
      currentPage: 1,
    ));

    final Either<Failure, HelpdeskTicketListResponseModel> result =
        await ticketRepo.getMyTickets(
      pageNumber: 1,
      pageSize: state.pageSize,
      statusCode: event.status?.statusCode,
    );

    result.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] filter load failed: ${error.message}');
        emit(state.copyWith(
          allTickets: const <TicketModel>[],
          filteredTickets: const <TicketModel>[],
          totalTickets: 0,
          hasMore: false,
          isRefreshingList: false,
        ));
      },
      (final HelpdeskTicketListResponseModel page) {
        emit(state.copyWith(
          allTickets: page.items,
          filteredTickets: page.items,
          currentPage: 1,
          totalTickets: page.totalCount,
          hasMore: page.hasMore,
          isRefreshingList: false,
        ));
      },
    );
  }

  void _onChangeTitle(
    final OnChangeTitle event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onChangeDescription(
    final OnChangeDescription event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onChangeNote(
    final OnChangeNote event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(clientNote: event.note));
  }

  Future<void> _onSubmitTicket(
    final OnSubmitTicket event,
    final Emitter<TicketState> emit,
  ) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(state.copyWith(loadingState: CommonScreenState.loading));

    // 1. Create or update the ticket itself.
    // The project is fixed by the host app via SupportSdkConfig.project,
    // so we inject it here and never expose a picker to the user.
    final SupportProject configuredProject = SupportSdkConfig.instance.project;

    final Either<Failure, CommonResponseModel> result =
        await ticketRepo.addOrUpdateTicket(
      helpdeskTicketId: event.helpdeskTicketId,
      helpdeskProjectId: configuredProject.id,
      title: state.title,
      description: state.description,
      projectName: configuredProject.displayName,
      clientNote: state.clientNote,
    );

    final CommonResponseModel? response = result.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] addOrUpdateTicket failed: ${error.message}');
        return null;
      },
      (final CommonResponseModel data) => data,
    );

    if (response == null || !response.success) {
      if (response != null) {
        debugPrint('[TicketBloc] addOrUpdateTicket non-success: '
            '${response.message}');
      }
      emit(state.copyWith(loadingState: CommonScreenState.error));
      return;
    }

    // 2. Resolve the ticket id: for edit we already have it; for create
    //    we rely on the server returning it in the response envelope.
    final int? ticketId = event.helpdeskTicketId ?? response.id;

    // 3. Upload attachments if any were picked AND we know the ticket id.
    if (event.attachmentPaths.isNotEmpty) {
      if (ticketId == null || ticketId == 0) {
        debugPrint('[TicketBloc] skipping attachment upload: server did '
            'not return a ticket id on create');
      } else {
        emit(state.copyWith(isUploadingAttachments: true));

        final List<File> files = event.attachmentPaths
            .map((final String p) => File(p))
            .where((final File f) => f.existsSync())
            .toList();

        if (files.isNotEmpty) {
          final Either<Failure, List<HelpdeskAttachmentModel>> uploadResult =
              await attachmentRepo.uploadAttachments(
            ticketId: ticketId,
            files: files,
          );

          uploadResult.fold(
            (final Failure error) {
              debugPrint('[TicketBloc] uploadAttachments failed: '
                  '${error.message}');
              // Ticket was saved OK — don't flip back to error for
              // attachment failure. The user will see the ticket and
              // can retry uploads from edit mode.
            },
            (final List<HelpdeskAttachmentModel> _) {},
          );
        }

        emit(state.copyWith(isUploadingAttachments: false));
      }
    }

    emit(state.copyWith(
      loadingState: CommonScreenState.success,
      isTicketCreated: true,
    ));

    // 4. Refresh counts + list.
    add(const TicketEvent.onLoadTickets());
  }

  Future<void> _onDeleteTicket(
    final OnDeleteTicket event,
    final Emitter<TicketState> emit,
  ) async {
    // Optimistic removal so the UI reacts immediately.
    final List<TicketModel> optimistic = state.allTickets
        .where((final TicketModel t) => t.id != event.ticketId)
        .toList();
    emit(state.copyWith(
      allTickets: optimistic,
      filteredTickets: optimistic,
    ));

    final Either<Failure, CommonResponseModel> result =
        await ticketRepo.deleteTicket(ticketId: event.ticketId);

    result.fold(
      (final Failure error) {
        debugPrint('[TicketBloc] deleteTicket failed: ${error.message}');
        // Server rejected — reload from source of truth.
        add(const TicketEvent.onLoadTickets());
      },
      (final CommonResponseModel data) {
        if (!data.success) {
          debugPrint('[TicketBloc] deleteTicket non-success: ${data.message}');
        }
        // Always refresh counts + list after a delete to stay in sync.
        add(const TicketEvent.onLoadTickets());
      },
    );
  }

  void _onResetForm(
    final OnResetForm event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(
      title: '',
      description: '',
      clientNote: '',
      isTicketCreated: false,
    ));
  }
}
