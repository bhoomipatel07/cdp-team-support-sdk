part of 'ticket_detail_bloc.dart';

@freezed
abstract class TicketDetailState with _$TicketDetailState {
  const factory TicketDetailState({
    required final CommonScreenState loadingState,
    required final TicketModel? ticket,
    required final List<ConversationMessage> conversations,
  }) = _TicketDetailState;

  factory TicketDetailState.initial() => const TicketDetailState(
        loadingState: CommonScreenState.initial,
        ticket: null,
        conversations: <ConversationMessage>[],
      );
}
