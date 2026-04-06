import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_dummy_data.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';

part 'ticket_event.dart';

part 'ticket_state.dart';

part 'ticket_bloc.freezed.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TicketBloc() : super(TicketState.initial()) {
    on<OnLoadTickets>(_onLoadTickets);
    on<OnFilterByStatus>(_onFilterByStatus);
    on<OnChangeTitle>(_onChangeTitle);
    on<OnChangeDescription>(_onChangeDescription);
    on<OnSelectProject>(_onSelectProject);
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
    await Future<void>.delayed(const Duration(milliseconds: 800));

    final List<TicketModel> tickets = TicketDummyData.tickets;
    final List<ProjectModel> projects = TicketDummyData.projects;

    emit(state.copyWith(
      loadingState: CommonScreenState.loaded,
      allTickets: tickets,
      filteredTickets: tickets,
      projects: projects,
      totalCount: tickets.length,
      openCount: tickets
          .where((final TicketModel t) => t.status == TicketStatus.open)
          .length,
      inProgressCount: tickets
          .where((final TicketModel t) => t.status == TicketStatus.inProgress)
          .length,
      resolvedCount: tickets
          .where((final TicketModel t) => t.status == TicketStatus.resolved)
          .length,
      closedCount: tickets
          .where((final TicketModel t) => t.status == TicketStatus.closed)
          .length,
    ));
  }

  void _onFilterByStatus(
    final OnFilterByStatus event,
    final Emitter<TicketState> emit,
  ) {
    final TicketStatus? filter = event.status;
    final List<TicketModel> filtered = filter == null
        ? state.allTickets
        : state.allTickets
            .where((final TicketModel t) => t.status == filter)
            .toList();

    emit(state.copyWith(
      selectedFilter: filter,
      filteredTickets: filtered,
    ));
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

  void _onSelectProject(
    final OnSelectProject event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(selectedProject: event.project));
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
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final int newId = state.allTickets.length + 1;
    final String ticketNumber = 'TKT-${newId.toString().padLeft(4, '0')}';
    final TicketModel newTicket = TicketModel(
      id: newId,
      ticketNumber: ticketNumber,
      title: state.title,
      description: state.description,
      status: TicketStatus.open,
      project: state.selectedProject,
      clientNote: state.clientNote.isEmpty ? null : state.clientNote,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      timeline: <TicketTimelineEntry>[
        TicketTimelineEntry(
          title: 'Ticket $ticketNumber created',
          timestamp: DateTime.now(),
          dotColor: const Color(0xFF3B82F6),
        ),
      ],
    );

    final List<TicketModel> updatedAll = <TicketModel>[
      newTicket,
      ...state.allTickets
    ];
    final List<TicketModel> updatedFiltered = state.selectedFilter == null
        ? updatedAll
        : updatedAll
            .where((final TicketModel t) => t.status == state.selectedFilter)
            .toList();

    emit(state.copyWith(
      loadingState: CommonScreenState.success,
      allTickets: updatedAll,
      filteredTickets: updatedFiltered,
      totalCount: updatedAll.length,
      openCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.open)
          .length,
      inProgressCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.inProgress)
          .length,
      resolvedCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.resolved)
          .length,
      closedCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.closed)
          .length,
      isTicketCreated: true,
    ));
  }

  void _onDeleteTicket(
    final OnDeleteTicket event,
    final Emitter<TicketState> emit,
  ) {
    final List<TicketModel> updatedAll = state.allTickets
        .where((final TicketModel t) => t.id != event.ticketId)
        .toList();
    final List<TicketModel> updatedFiltered = state.selectedFilter == null
        ? updatedAll
        : updatedAll
            .where((final TicketModel t) => t.status == state.selectedFilter)
            .toList();

    emit(state.copyWith(
      allTickets: updatedAll,
      filteredTickets: updatedFiltered,
      totalCount: updatedAll.length,
      openCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.open)
          .length,
      inProgressCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.inProgress)
          .length,
      resolvedCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.resolved)
          .length,
      closedCount: updatedAll
          .where((final TicketModel t) => t.status == TicketStatus.closed)
          .length,
    ));
  }

  void _onResetForm(
    final OnResetForm event,
    final Emitter<TicketState> emit,
  ) {
    emit(state.copyWith(
      title: '',
      description: '',
      selectedProject: null,
      clientNote: '',
      isTicketCreated: false,
    ));
  }
}
