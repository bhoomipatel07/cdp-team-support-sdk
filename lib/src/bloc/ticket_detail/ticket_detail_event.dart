part of 'ticket_detail_bloc.dart';

@freezed
abstract class TicketDetailEvent with _$TicketDetailEvent {
  const factory TicketDetailEvent.onLoadDetail({
    required final int ticketId,
  }) = OnLoadDetail;

  const factory TicketDetailEvent.onSendMessage({
    required final String message,
  }) = OnSendMessage;

  const factory TicketDetailEvent.onDeleteMessage({
    required final int messageId,
  }) = OnDeleteMessage;

  const factory TicketDetailEvent.onUpdateTicket({
    required final String title,
    required final String description,
    required final String? clientNote,
    required final ProjectModel? project,
  }) = OnUpdateTicket;

  const factory TicketDetailEvent.onLikeMessage({
    required final int messageId,
  }) = OnLikeMessage;

  const factory TicketDetailEvent.onDislikeMessage({
    required final int messageId,
  }) = OnDislikeMessage;
}
