import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_attachment_model.dart';

/// A single timeline / activity log entry on a ticket detail response.
class HelpdeskActivityLogModel {
  const HelpdeskActivityLogModel({
    required this.id,
    required this.description,
    required this.type,
    required this.createdOn,
    this.fieldChanged,
    this.oldValue,
    this.newValue,
    this.userId,
  });

  final int id;
  final String description;
  final String type;
  final DateTime createdOn;
  final String? fieldChanged;
  final String? oldValue;
  final String? newValue;
  final int? userId;

  factory HelpdeskActivityLogModel.fromJson(final Map<String, dynamic> json) {
    return HelpdeskActivityLogModel(
      id: _readInt(json, const <String>[
        'helpdeskActivityLogId',
        'HelpdeskActivityLogId',
        'id',
        'Id',
      ]),
      description: _readString(json, const <String>[
        'description',
        'Description',
      ]),
      type: _readString(json, const <String>['type', 'Type']),
      fieldChanged: _readStringOrNull(json, const <String>[
        'fieldChanged',
        'FieldChanged',
      ]),
      oldValue: _readStringOrNull(json, const <String>['oldValue', 'OldValue']),
      newValue: _readStringOrNull(json, const <String>['newValue', 'NewValue']),
      userId: _readIntOrNull(json, const <String>['userId', 'UserId']),
      createdOn: _readDate(json, const <String>['createdOn', 'CreatedOn']) ??
          DateTime.now(),
    );
  }

  static List<HelpdeskActivityLogModel> fromJsonList(final dynamic data) {
    if (data is! List) return const <HelpdeskActivityLogModel>[];
    return data
        .whereType<Map<String, dynamic>>()
        .map(HelpdeskActivityLogModel.fromJson)
        .toList();
  }

  static int _readInt(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is int) return v;
      if (v is num) return v.toInt();
    }
    return 0;
  }

  static int? _readIntOrNull(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is int) return v;
      if (v is num) return v.toInt();
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

  static DateTime? _readDate(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) {
        return DateTime.tryParse(v);
      }
    }
    return null;
  }
}

/// Full ticket detail returned by
/// `HelpdeskTicket/GetHelpdeskTicketDetail/{ticketId}`.
class HelpdeskTicketDetailModel {
  const HelpdeskTicketDetailModel({
    required this.id,
    required this.ticketNumber,
    required this.title,
    required this.description,
    required this.statusName,
    required this.createdOn,
    this.priority,
    this.projectId,
    this.projectName,
    this.assignedTo,
    this.assignedToName,
    this.team,
    this.clientNote,
    this.updatedOn,
    this.commentCount = 0,
    this.attachmentCount = 0,
    this.attachments = const <HelpdeskAttachmentModel>[],
    this.timeline = const <HelpdeskActivityLogModel>[],
  });

  final int id;
  final String ticketNumber;
  final String title;
  final String description;
  final String statusName;
  final String? priority;
  final int? projectId;
  final String? projectName;
  final int? assignedTo;
  final String? assignedToName;
  final String? team;
  final String? clientNote;
  final DateTime createdOn;
  final DateTime? updatedOn;
  final int commentCount;
  final int attachmentCount;
  final List<HelpdeskAttachmentModel> attachments;
  final List<HelpdeskActivityLogModel> timeline;

  factory HelpdeskTicketDetailModel.fromJson(final Map<String, dynamic> data) {
    // Tolerate optional `{ "result": ... }` wrapper.
    final Map<String, dynamic> json = data['result'] is Map<String, dynamic>
        ? data['result'] as Map<String, dynamic>
        : data;

    return HelpdeskTicketDetailModel(
      id: _readInt(json, const <String>[
        'helpdeskTicketId',
        'HelpdeskTicketId',
        'id',
        'Id',
      ]),
      ticketNumber: _readString(json, const <String>[
        'ticketNumber',
        'TicketNumber',
      ]),
      title: _readString(json, const <String>['title', 'Title']),
      description: _readString(json, const <String>[
        'description',
        'Description',
      ]),
      statusName: _readString(json, const <String>[
        'status',
        'Status',
        'statusName',
        'StatusName',
      ]),
      priority: _readStringOrNull(json, const <String>['priority', 'Priority']),
      projectId: _readIntOrNull(json, const <String>[
        'helpdeskProjectId',
        'HelpdeskProjectId',
        'projectId',
        'ProjectId',
      ]),
      projectName: _readStringOrNull(json, const <String>[
        'projectName',
        'ProjectName',
      ]),
      assignedTo: _readIntOrNull(json, const <String>[
        'assignedTo',
        'AssignedTo',
      ]),
      assignedToName: _readStringOrNull(json, const <String>[
        'assignedToName',
        'AssignedToName',
      ]),
      team: _readStringOrNull(json, const <String>['team', 'Team']),
      clientNote: _readStringOrNull(json, const <String>[
        'clientNote',
        'ClientNote',
      ]),
      createdOn: _readDate(json, const <String>['createdOn', 'CreatedOn']) ??
          DateTime.now(),
      updatedOn: _readDate(json, const <String>['updatedOn', 'UpdatedOn']),
      commentCount: _readInt(json, const <String>[
        'commentCount',
        'CommentCount',
      ]),
      attachmentCount: _readInt(json, const <String>[
        'attachmentCount',
        'AttachmentCount',
      ]),
      attachments: HelpdeskAttachmentModel.fromJsonList(
        json['attachments'] ?? json['Attachments'],
      ),
      timeline: HelpdeskActivityLogModel.fromJsonList(
        json['timeline'] ?? json['Timeline'],
      ),
    );
  }

  static int _readInt(
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
    return 0;
  }

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

  static DateTime? _readDate(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) {
        return DateTime.tryParse(v);
      }
    }
    return null;
  }
}
