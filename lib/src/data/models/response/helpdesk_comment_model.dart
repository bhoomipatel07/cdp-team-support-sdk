import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_attachment_model.dart';

/// A single helpdesk comment (conversation message) returned by
/// `HelpdeskComment/GetHelpdeskComments/{ticketId}`.
class HelpdeskCommentModel {
  const HelpdeskCommentModel({
    required this.id,
    required this.ticketId,
    required this.commentText,
    required this.userName,
    required this.createdOn,
    this.userId,
    this.userRole,
    this.parentCommentId,
    this.isOwn = false,
    this.attachments = const <HelpdeskAttachmentModel>[],
  });

  final int id;
  final int ticketId;
  final String commentText;
  final String userName;
  final int? userId;
  final String? userRole;

  /// Non-null for replies — points at the parent comment's [id].
  final int? parentCommentId;

  final DateTime createdOn;
  final bool isOwn;
  final List<HelpdeskAttachmentModel> attachments;

  factory HelpdeskCommentModel.fromJson(final Map<String, dynamic> json) {
    return HelpdeskCommentModel(
      id: _readInt(json, const <String>[
        'helpdeskCommentId',
        'HelpdeskCommentId',
        'commentId',
        'CommentId',
        'id',
        'Id',
      ]),
      ticketId: _readInt(json, const <String>[
        'helpdeskTicketId',
        'HelpdeskTicketId',
        'ticketId',
        'TicketId',
      ]),
      commentText: _readString(json, const <String>[
        'commentText',
        'CommentText',
        'text',
        'Text',
        'message',
        'Message',
      ]),
      userName: _readString(json, const <String>[
        'userName',
        'UserName',
        'createdByName',
        'CreatedByName',
        'name',
        'Name',
      ]),
      userId: _readIntOrNull(json, const <String>[
        'userId',
        'UserId',
        'createdBy',
        'CreatedBy',
      ]),
      userRole: _readStringOrNull(json, const <String>[
        'userRole',
        'UserRole',
        'role',
        'Role',
      ]),
      parentCommentId: _readIntOrNull(json, const <String>[
        'parentCommentId',
        'ParentCommentId',
        'parentHelpdeskCommentId',
        'ParentHelpdeskCommentId',
        'parentId',
        'ParentId',
        'replyToCommentId',
        'ReplyToCommentId',
        'replyToId',
        'ReplyToId',
        'inReplyTo',
        'InReplyTo',
      ]),
      createdOn: _readDate(json, const <String>[
            'createdOn',
            'CreatedOn',
            'createdDate',
            'CreatedDate',
            'createdAt',
            'CreatedAt',
          ]) ??
          DateTime.now(),
      isOwn: _readBool(json, const <String>['isOwn', 'IsOwn']) ?? false,
      attachments: json['attachments'] is List
          ? HelpdeskAttachmentModel.fromJsonList(json['attachments'])
          : const <HelpdeskAttachmentModel>[],
    );
  }

  /// Parses a comment list response into a **flat** list, recursively
  /// walking each comment's `replies` / `Replies` array. The API returns
  /// a tree (top-level comments each with a nested `replies` array), but
  /// the UI renders flat + uses [parentCommentId] to link bubbles, so
  /// we collapse the tree at parse time.
  static List<HelpdeskCommentModel> fromJsonList(final dynamic data) {
    final List<dynamic>? list = data is List
        ? data
        : (data is Map<String, dynamic> && data['result'] is List
            ? data['result'] as List<dynamic>
            : null);
    if (list == null) return const <HelpdeskCommentModel>[];

    final List<HelpdeskCommentModel> flat = <HelpdeskCommentModel>[];
    void walk(final List<dynamic> items) {
      for (final dynamic item in items) {
        if (item is! Map<String, dynamic>) continue;
        flat.add(HelpdeskCommentModel.fromJson(item));
        final dynamic replies = item['replies'] ?? item['Replies'];
        if (replies is List) walk(replies);
      }
    }

    walk(list);
    return flat;
  }

  HelpdeskCommentModel copyWith({
    final String? commentText,
  }) {
    return HelpdeskCommentModel(
      id: id,
      ticketId: ticketId,
      commentText: commentText ?? this.commentText,
      userName: userName,
      userId: userId,
      userRole: userRole,
      createdOn: createdOn,
      isOwn: isOwn,
      attachments: attachments,
    );
  }

  static int _readInt(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) =>
      _readIntOrNull(src, keys) ?? 0;

  static int? _readIntOrNull(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is int) return v;
      if (v is num) return v.toInt();
      if (v is String) {
        final int? parsed = int.tryParse(v);
        if (parsed != null) return parsed;
      }
    }
    return null;
  }

  static String _readString(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) =>
      _readStringOrNull(src, keys) ?? '';

  static String? _readStringOrNull(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) return v;
    }
    return null;
  }

  static bool? _readBool(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is bool) return v;
    }
    return null;
  }

  static DateTime? _readDate(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) {
        final DateTime? parsed = DateTime.tryParse(v);
        if (parsed != null) return _asUtc(parsed).toLocal();
      }
    }
    return null;
  }

  static DateTime _asUtc(final DateTime dt) => dt.isUtc
      ? dt
      : DateTime.utc(
          dt.year,
          dt.month,
          dt.day,
          dt.hour,
          dt.minute,
          dt.second,
          dt.millisecond,
          dt.microsecond,
        );
}
