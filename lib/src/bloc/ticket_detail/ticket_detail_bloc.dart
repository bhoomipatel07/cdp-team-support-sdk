import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_conversation_model.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_dummy_data.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';

part 'ticket_detail_event.dart';

part 'ticket_detail_state.dart';

part 'ticket_detail_bloc.freezed.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailBloc() : super(TicketDetailState.initial()) {
    on<OnLoadDetail>(_onLoadDetail);
    on<OnSendMessage>(_onSendMessage);
    on<OnDeleteMessage>(_onDeleteMessage);
    on<OnUpdateTicket>(_onUpdateTicket);
    on<OnLikeMessage>(_onLikeMessage);
    on<OnDislikeMessage>(_onDislikeMessage);
  }

  Future<void> _onLoadDetail(
    final OnLoadDetail event,
    final Emitter<TicketDetailState> emit,
  ) async {
    emit(state.copyWith(loadingState: CommonScreenState.loading));
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final List<TicketModel> tickets = TicketDummyData.tickets;
    final TicketModel? ticket = tickets.cast<TicketModel?>().firstWhere(
          (final TicketModel? t) => t?.id == event.ticketId,
          orElse: () => null,
        );

    if (ticket != null) {
      final List<ConversationMessage> conversations =
          TicketDummyData.getConversationsForTicket(event.ticketId);
      emit(state.copyWith(
        loadingState: CommonScreenState.loaded,
        ticket: ticket,
        conversations: conversations,
      ));
    } else {
      emit(state.copyWith(loadingState: CommonScreenState.error));
    }
  }

  void _onSendMessage(
    final OnSendMessage event,
    final Emitter<TicketDetailState> emit,
  ) {
    if (event.message.trim().isEmpty) return;

    final SupportSdkConfig config = SupportSdkConfig.instance;
    final ConversationMessage newMessage = ConversationMessage(
      id: DateTime.now().millisecondsSinceEpoch,
      senderName: config.currentUserName,
      senderInitials: config.currentUserInitials,
      senderRole: MessageUserRole.user,
      message: event.message.trim(),
      timestamp: DateTime.now(),
      isOwnMessage: true,
    );

    emit(state.copyWith(
      conversations: <ConversationMessage>[...state.conversations, newMessage],
    ));
  }

  void _onDeleteMessage(
    final OnDeleteMessage event,
    final Emitter<TicketDetailState> emit,
  ) {
    final List<ConversationMessage> updated = state.conversations
        .where((final ConversationMessage m) => m.id != event.messageId)
        .toList();
    emit(state.copyWith(conversations: updated));
  }

  void _onUpdateTicket(
    final OnUpdateTicket event,
    final Emitter<TicketDetailState> emit,
  ) {
    if (state.ticket == null) return;

    final TicketModel updated = state.ticket!.copyWith(
      title: event.title,
      description: event.description,
      clientNote: event.clientNote,
      project: event.project,
      updatedAt: DateTime.now(),
    );

    emit(state.copyWith(ticket: updated));
  }

  void _onLikeMessage(
    final OnLikeMessage event,
    final Emitter<TicketDetailState> emit,
  ) {
    final List<ConversationMessage> updated = state.conversations.map(
      (final ConversationMessage m) {
        if (m.id == event.messageId) {
          return m.copyWith(likeCount: m.likeCount + 1);
        }
        return m;
      },
    ).toList();
    emit(state.copyWith(conversations: updated));
  }

  void _onDislikeMessage(
    final OnDislikeMessage event,
    final Emitter<TicketDetailState> emit,
  ) {
    final List<ConversationMessage> updated = state.conversations.map(
      (final ConversationMessage m) {
        if (m.id == event.messageId) {
          return m.copyWith(dislikeCount: m.dislikeCount + 1);
        }
        return m;
      },
    ).toList();
    emit(state.copyWith(conversations: updated));
  }
}
