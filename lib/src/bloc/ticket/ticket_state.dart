part of 'ticket_bloc.dart';

@freezed
abstract class TicketState with _$TicketState {
  const factory TicketState({
    required final CommonScreenState loadingState,
    required final List<TicketModel> allTickets,
    required final List<TicketModel> filteredTickets,
    required final HelpdeskTicketStatusModel? selectedFilter,
    required final int totalCount,
    required final int openCount,
    required final int inProgressCount,
    required final int resolvedCount,
    required final int closedCount,
    required final String title,
    required final String description,
    required final String clientNote,

    /// Dynamic ticket statuses fetched from the API. Used for filter
    /// dropdowns / create forms — NOT for the dashboard count cards.
    required final List<HelpdeskTicketStatusModel> statuses,
    required final bool isTicketCreated,
    required final bool isUploadingAttachments,

    // ── Pagination (GetMyHelpdeskTickets) ──────────────────────────
    required final int currentPage,
    required final int pageSize,
    required final int totalTickets,
    required final bool hasMore,
    required final bool isLoadingMore,

    /// True while the list-only refresh (filter change / inline reload)
    /// is running — drives a small spinner inside the list without
    /// replacing the whole dashboard with the shimmer.
    required final bool isRefreshingList,
  }) = _TicketState;

  factory TicketState.initial() => const TicketState(
        loadingState: CommonScreenState.initial,
        allTickets: <TicketModel>[],
        filteredTickets: <TicketModel>[],
        selectedFilter: null,
        totalCount: 0,
        openCount: 0,
        inProgressCount: 0,
        resolvedCount: 0,
        closedCount: 0,
        title: '',
        description: '',
        clientNote: '',
        statuses: <HelpdeskTicketStatusModel>[],
        isTicketCreated: false,
        isUploadingAttachments: false,
        currentPage: 1,
        pageSize: 20,
        totalTickets: 0,
        hasMore: false,
        isLoadingMore: false,
        isRefreshingList: false,
      );
}
