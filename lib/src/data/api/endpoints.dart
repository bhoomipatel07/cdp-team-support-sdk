/// All relative endpoint paths used by the SDK.
///
/// The base URL is supplied by the host app via [SupportSdkConfig.baseUrl]
/// and prepended by [DioClient] — endpoints here are relative.
class SupportEndpoints {
  const SupportEndpoints._();

  // ── Helpdesk tickets ─────────────────────────────────────────────────
  static const String getHelpdeskTicketDashboardCounts =
      'HelpdeskTicket/GetHelpdeskTicketDashboardCounts';

  static const String getHelpdeskTicketStatuses =
      'HelpdeskTicket/GetHelpdeskTicketStatuses';

  static const String addOrUpdateHelpdeskTicket =
      'HelpdeskTicket/AddOrUpdateHelpdeskTicket';

  static String getHelpdeskTicketDetail({required final int ticketId}) =>
      'HelpdeskTicket/GetHelpdeskTicketDetail/$ticketId';

  static String deleteHelpdeskTicket({required final int ticketId}) =>
      'HelpdeskTicket/DeleteHelpdeskTicket/$ticketId';

  // ── Helpdesk comments ────────────────────────────────────────────────
  static String getHelpdeskComments({required final int ticketId}) =>
      'HelpdeskComment/GetHelpdeskComments/$ticketId';

  static const String addOrUpdateHelpdeskComment =
      'HelpdeskComment/AddOrUpdateHelpdeskComment';

  static String deleteHelpdeskComment({required final int commentId}) =>
      'HelpdeskComment/DeleteHelpdeskComment/$commentId';

  // ── Helpdesk attachments ─────────────────────────────────────────────
  static String uploadHelpdeskAttachments({
    required final int ticketId,
    final int? commentId,
  }) {
    final String base =
        'HelpdeskAttachment/UploadHelpdeskAttachments/$ticketId';
    return commentId == null ? base : '$base?commentId=$commentId';
  }

  static String downloadHelpdeskAttachment({required final int attachmentId}) =>
      'HelpdeskAttachment/DownloadHelpdeskAttachment/$attachmentId';

  static String previewHelpdeskAttachment({required final int attachmentId}) =>
      'HelpdeskAttachment/PreviewHelpdeskAttachment/$attachmentId';

  static String getHelpdeskAttachmentViewUrl({
    required final int attachmentId,
  }) =>
      'HelpdeskAttachment/GetHelpdeskAttachmentViewUrl/$attachmentId';

  static String deleteHelpdeskAttachment({required final int attachmentId}) =>
      'HelpdeskAttachment/DeleteHelpdeskAttachment/$attachmentId';

  static String getMyHelpdeskTickets({
    required final int pageNumber,
    required final int pageSize,
    final String? status,
    final String? search,
  }) {
    final StringBuffer buf = StringBuffer(
      'HelpdeskTicket/GetMyHelpdeskTickets?PageNumber=$pageNumber&PageSize=$pageSize',
    );
    if (status != null && status.isNotEmpty) {
      buf.write('&Status=${Uri.encodeQueryComponent(status)}');
    }
    if (search != null && search.isNotEmpty) {
      buf.write('&SearchText=${Uri.encodeQueryComponent(search)}');
    }
    return buf.toString();
  }
}
