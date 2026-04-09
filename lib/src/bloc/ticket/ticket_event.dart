part of 'ticket_bloc.dart';

@freezed
abstract class TicketEvent with _$TicketEvent {
  const factory TicketEvent.onLoadTickets() = OnLoadTickets;

  const factory TicketEvent.onLoadMoreTickets() = OnLoadMoreTickets;

  const factory TicketEvent.onFilterByStatus({
    required final HelpdeskTicketStatusModel? status,
  }) = OnFilterByStatus;

  const factory TicketEvent.onChangeTitle({
    required final String title,
  }) = OnChangeTitle;

  const factory TicketEvent.onChangeDescription({
    required final String description,
  }) = OnChangeDescription;

  const factory TicketEvent.onChangeNote({
    required final String note,
  }) = OnChangeNote;

  const factory TicketEvent.onSubmitTicket({
    /// Non-null when editing an existing ticket.
    final int? helpdeskTicketId,

    /// Absolute paths of any newly-picked files to upload after the
    /// ticket is successfully created/updated.
    @Default(<String>[]) final List<String> attachmentPaths,
  }) = OnSubmitTicket;

  const factory TicketEvent.onDeleteTicket({
    required final int ticketId,
  }) = OnDeleteTicket;

  const factory TicketEvent.onResetForm() = OnResetForm;
}
