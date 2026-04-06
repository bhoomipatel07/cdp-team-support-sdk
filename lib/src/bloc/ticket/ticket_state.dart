part of 'ticket_bloc.dart';

@freezed
abstract class TicketState with _$TicketState {
  const factory TicketState({
    required final CommonScreenState loadingState,
    required final List<TicketModel> allTickets,
    required final List<TicketModel> filteredTickets,
    required final TicketStatus? selectedFilter,
    required final int totalCount,
    required final int openCount,
    required final int inProgressCount,
    required final int resolvedCount,
    required final int closedCount,
    required final String title,
    required final String description,
    required final ProjectModel? selectedProject,
    required final String clientNote,
    required final List<ProjectModel> projects,
    required final bool isTicketCreated,
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
        selectedProject: null,
        clientNote: '',
        projects: <ProjectModel>[],
        isTicketCreated: false,
      );
}
