part of 'ticket_detail_bloc.dart';

@freezed
abstract class TicketDetailState with _$TicketDetailState {
  const factory TicketDetailState({
    required final CommonScreenState loadingState,
    required final HelpdeskTicketDetailModel? detail,
    required final List<HelpdeskCommentModel> comments,
    required final bool isSendingComment,
    required final bool isDeleting,
    required final bool isDeleted,

    /// Comment the user has tapped "Reply" on. When non-null the
    /// message input shows a reply banner and the send handler prefixes
    /// the message with the replied-to user's name.
    required final HelpdeskCommentModel? replyingTo,
  }) = _TicketDetailState;

  factory TicketDetailState.initial() => const TicketDetailState(
        loadingState: CommonScreenState.initial,
        detail: null,
        comments: <HelpdeskCommentModel>[],
        isSendingComment: false,
        isDeleting: false,
        isDeleted: false,
        replyingTo: null,
      );
}
