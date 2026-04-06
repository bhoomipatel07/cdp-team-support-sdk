part of 'ticket_bloc.dart';

@freezed
abstract class TicketEvent with _$TicketEvent {
  const factory TicketEvent.onLoadTickets() = OnLoadTickets;

  const factory TicketEvent.onFilterByStatus({
    required final TicketStatus? status,
  }) = OnFilterByStatus;

  const factory TicketEvent.onChangeTitle({
    required final String title,
  }) = OnChangeTitle;

  const factory TicketEvent.onChangeDescription({
    required final String description,
  }) = OnChangeDescription;

  const factory TicketEvent.onSelectProject({
    required final ProjectModel? project,
  }) = OnSelectProject;

  const factory TicketEvent.onChangeNote({
    required final String note,
  }) = OnChangeNote;

  const factory TicketEvent.onSubmitTicket() = OnSubmitTicket;

  const factory TicketEvent.onDeleteTicket({
    required final int ticketId,
  }) = OnDeleteTicket;

  const factory TicketEvent.onResetForm() = OnResetForm;
}
