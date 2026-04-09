import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/common_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_comment_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_detail_model.dart';
import 'package:cdp_team_support_sdk/src/data/repository/comment_repo.dart';
import 'package:cdp_team_support_sdk/src/data/repository/ticket_repo.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_detail_event.dart';
part 'ticket_detail_state.dart';
part 'ticket_detail_bloc.freezed.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailBloc({
    required this.ticketRepo,
    required this.commentRepo,
  }) : super(TicketDetailState.initial()) {
    on<OnLoadDetail>(_onLoadDetail);
    on<OnSendMessage>(_onSendMessage);
    on<OnDeleteMessage>(_onDeleteMessage);
    on<OnUpdateTicket>(_onUpdateTicket);
    on<OnDeleteTicket>(_onDeleteTicket);
    on<OnStartReply>(
      (final OnStartReply e, final Emitter<TicketDetailState> emit) {
        emit(state.copyWith(replyingTo: e.comment));
      },
    );
    on<OnCancelReply>(
      (final OnCancelReply _, final Emitter<TicketDetailState> emit) {
        emit(state.copyWith(replyingTo: null));
      },
    );
  }

  final TicketRepo ticketRepo;
  final CommentRepo commentRepo;

  Future<void> _onLoadDetail(
    final OnLoadDetail event,
    final Emitter<TicketDetailState> emit,
  ) async {
    emit(state.copyWith(loadingState: CommonScreenState.loading));

    // Fetch ticket detail + comments in parallel.
    final List<dynamic> results = await Future.wait<dynamic>(<Future<dynamic>>[
      ticketRepo.getTicketDetail(ticketId: event.ticketId),
      commentRepo.getComments(ticketId: event.ticketId),
    ]);

    final Either<Failure, HelpdeskTicketDetailModel> detailResult =
        results[0] as Either<Failure, HelpdeskTicketDetailModel>;
    final Either<Failure, List<HelpdeskCommentModel>> commentsResult =
        results[1] as Either<Failure, List<HelpdeskCommentModel>>;

    final HelpdeskTicketDetailModel? detail = detailResult.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] getTicketDetail failed: '
            '${error.message}');
        return null;
      },
      (final HelpdeskTicketDetailModel data) => data,
    );

    if (detail == null) {
      emit(state.copyWith(loadingState: CommonScreenState.error));
      return;
    }

    final List<HelpdeskCommentModel> comments = commentsResult.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] getComments failed: ${error.message}');
        return const <HelpdeskCommentModel>[];
      },
      (final List<HelpdeskCommentModel> data) => data,
    );

    emit(state.copyWith(
      loadingState: CommonScreenState.loaded,
      detail: detail,
      comments: comments,
    ));
  }

  Future<void> _onSendMessage(
    final OnSendMessage event,
    final Emitter<TicketDetailState> emit,
  ) async {
    final String text = event.message.trim();
    if (text.isEmpty || state.detail == null) return;

    emit(state.copyWith(isSendingComment: true));

    final Either<Failure, CommonResponseModel> result =
        await commentRepo.addOrUpdateComment(
      ticketId: state.detail!.id,
      commentText: text,
      parentCommentId: state.replyingTo?.id,
    );

    final CommonResponseModel? response = result.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] addComment failed: ${error.message}');
        return null;
      },
      (final CommonResponseModel data) => data,
    );

    if (response == null) {
      emit(state.copyWith(isSendingComment: false));
      return;
    }

    // Reload ONLY the comments list (not the whole ticket detail) so the
    // screen doesn't flash its loading spinner on every send.
    final Either<Failure, List<HelpdeskCommentModel>> refreshed =
        await commentRepo.getComments(ticketId: state.detail!.id);

    emit(state.copyWith(
      isSendingComment: false,
      replyingTo: null,
      comments: refreshed.fold(
        (final Failure _) => state.comments,
        (final List<HelpdeskCommentModel> list) => list,
      ),
    ));
  }

  Future<void> _onDeleteMessage(
    final OnDeleteMessage event,
    final Emitter<TicketDetailState> emit,
  ) async {
    final int ticketId = state.detail?.id ?? 0;

    // Optimistic removal.
    final List<HelpdeskCommentModel> optimistic = state.comments
        .where((final HelpdeskCommentModel c) => c.id != event.messageId)
        .toList();
    emit(state.copyWith(comments: optimistic));

    final Either<Failure, CommonResponseModel> result =
        await commentRepo.deleteComment(commentId: event.messageId);

    if (ticketId == 0) return;

    // Re-sync comments list only — no full-screen reload.
    final Either<Failure, List<HelpdeskCommentModel>> refreshed =
        await commentRepo.getComments(ticketId: ticketId);

    refreshed.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] refresh after delete failed: '
            '${error.message}');
      },
      (final List<HelpdeskCommentModel> list) {
        emit(state.copyWith(comments: list));
      },
    );

    // Surface the original delete failure after sync, if any.
    result.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] deleteComment failed: '
            '${error.message}');
      },
      (final CommonResponseModel _) {},
    );
  }

  Future<void> _onDeleteTicket(
    final OnDeleteTicket event,
    final Emitter<TicketDetailState> emit,
  ) async {
    if (state.detail == null) return;

    emit(state.copyWith(isDeleting: true));

    final Either<Failure, CommonResponseModel> result =
        await ticketRepo.deleteTicket(ticketId: state.detail!.id);

    result.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] deleteTicket failed: ${error.message}');
        emit(state.copyWith(isDeleting: false));
      },
      (final CommonResponseModel _) {
        emit(state.copyWith(isDeleting: false, isDeleted: true));
      },
    );
  }

  Future<void> _onUpdateTicket(
    final OnUpdateTicket event,
    final Emitter<TicketDetailState> emit,
  ) async {
    if (state.detail == null) return;

    emit(state.copyWith(loadingState: CommonScreenState.loading));

    final Either<Failure, CommonResponseModel> result =
        await ticketRepo.addOrUpdateTicket(
      helpdeskTicketId: state.detail!.id,
      helpdeskProjectId: event.project?.id ?? state.detail!.projectId ?? 0,
      title: event.title,
      description: event.description,
      projectName: event.project?.name ?? state.detail!.projectName ?? '',
      clientNote: event.clientNote ?? '',
    );

    result.fold(
      (final Failure error) {
        debugPrint('[TicketDetailBloc] updateTicket failed: '
            '${error.message}');
        emit(state.copyWith(loadingState: CommonScreenState.error));
      },
      (final CommonResponseModel data) {
        if (!data.success) {
          emit(state.copyWith(loadingState: CommonScreenState.error));
          return;
        }
        // Reload detail to pick up server-side changes.
        add(TicketDetailEvent.onLoadDetail(ticketId: state.detail!.id));
      },
    );
  }
}
