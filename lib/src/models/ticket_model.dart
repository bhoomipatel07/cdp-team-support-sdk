import 'package:flutter/material.dart';

enum TicketStatus {
  open('Open', Color(0xFF22C55E), Icons.folder_open_rounded),
  inProgress('In Progress', Color(0xFFF59E0B), Icons.access_time_rounded),
  resolved('Resolved', Color(0xFF14B8A6), Icons.check_circle_outline_rounded),
  closed('Closed', Color(0xFF6B7280), Icons.lock_outline_rounded);

  const TicketStatus(this.label, this.color, this.icon);
  final String label;
  final Color color;
  final IconData icon;

  /// Best-effort mapping from an API status name to a local enum value.
  /// Unknown names fall back to [TicketStatus.open].
  static TicketStatus fromName(final String? name) {
    if (name == null) return TicketStatus.open;
    final String n = name.trim().toLowerCase().replaceAll('_', ' ');
    for (final TicketStatus s in TicketStatus.values) {
      if (s.label.toLowerCase() == n) return s;
    }
    if (n.contains('progress')) return TicketStatus.inProgress;
    if (n.contains('resolve')) return TicketStatus.resolved;
    if (n.contains('close')) return TicketStatus.closed;
    return TicketStatus.open;
  }
}

class ProjectModel {
  final int id;
  final String name;

  const ProjectModel({required this.id, required this.name});

  @override
  String toString() => name;

  // Equality by id so dropdown value lookups work even when a project
  // is reconstructed from a different source (API detail response vs
  // the static projects list).
  @override
  bool operator ==(final Object other) =>
      other is ProjectModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class TicketAttachment {
  final int id;
  final String fileName;
  final String fileExtension;
  final int fileSizeBytes;
  final String? localPath;

  /// Fully-qualified URL for remote (server-stored) attachments. When
  /// set, the UI streams the image from the network instead of reading
  /// from [localPath].
  final String? remoteUrl;

  const TicketAttachment({
    required this.id,
    required this.fileName,
    required this.fileExtension,
    required this.fileSizeBytes,
    this.localPath,
    this.remoteUrl,
  });

  bool get isImage {
    final String ext = fileExtension.toUpperCase();
    return ext == 'PNG' || ext == 'JPG' || ext == 'JPEG' || ext == 'GIF';
  }

  String get formattedSize {
    if (fileSizeBytes < 1024) return '$fileSizeBytes B';
    if (fileSizeBytes < 1024 * 1024) {
      return '${(fileSizeBytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(fileSizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

class TicketTimelineEntry {
  final String title;
  final DateTime timestamp;
  final Color dotColor;

  const TicketTimelineEntry({
    required this.title,
    required this.timestamp,
    required this.dotColor,
  });
}

class TicketModel {
  final int id;
  final String ticketNumber;
  final String title;
  final String description;
  final TicketStatus status;
  final ProjectModel? project;
  final String? clientNote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<TicketAttachment> attachments;
  final List<TicketTimelineEntry> timeline;

  const TicketModel({
    required this.id,
    required this.ticketNumber,
    required this.title,
    required this.description,
    required this.status,
    this.project,
    this.clientNote,
    required this.createdAt,
    required this.updatedAt,
    this.attachments = const <TicketAttachment>[],
    this.timeline = const <TicketTimelineEntry>[],
  });

  /// Parses a ticket list item from the CDP helpdesk API.
  ///
  /// The API is .NET so keys may arrive as PascalCase or camelCase, and
  /// the status is returned as a string name which is mapped to
  /// [TicketStatus] best-effort.
  factory TicketModel.fromJson(final Map<String, dynamic> json) {
    final int id = _readInt(json, <String>[
      'helpdeskTicketId',
      'HelpdeskTicketId',
      'id',
      'Id',
    ]);

    final String ticketNumber = _readString(json, <String>[
      'ticketNumber',
      'TicketNumber',
      'ticketNo',
      'TicketNo',
    ]);

    final String? statusName = _readStringOrNull(json, <String>[
      'statusName',
      'StatusName',
      'status',
      'Status',
    ]);

    final int? projectId = _readIntOrNull(json, <String>[
      'helpdeskProjectId',
      'HelpdeskProjectId',
      'projectId',
      'ProjectId',
    ]);
    final String? projectName = _readStringOrNull(json, <String>[
      'projectName',
      'ProjectName',
    ]);

    return TicketModel(
      id: id,
      ticketNumber: ticketNumber.isEmpty
          ? 'TKT-${id.toString().padLeft(4, '0')}'
          : ticketNumber,
      title: _readString(json, <String>['title', 'Title']),
      description: _readString(
        json,
        <String>['description', 'Description'],
      ),
      status: TicketStatus.fromName(statusName),
      project: projectName != null
          ? ProjectModel(id: projectId ?? 0, name: projectName)
          : null,
      clientNote: _readStringOrNull(
        json,
        <String>['clientNote', 'ClientNote', 'note', 'Note'],
      ),
      createdAt: _readDate(json, <String>[
            'createdAt',
            'CreatedAt',
            'createdOn',
            'CreatedOn',
          ]) ??
          DateTime.now(),
      updatedAt: _readDate(json, <String>[
            'updatedAt',
            'UpdatedAt',
            'updatedOn',
            'UpdatedOn',
            'modifiedOn',
            'ModifiedOn',
          ]) ??
          DateTime.now(),
    );
  }

  TicketModel copyWith({
    final int? id,
    final String? ticketNumber,
    final String? title,
    final String? description,
    final TicketStatus? status,
    final ProjectModel? project,
    final String? clientNote,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final List<TicketAttachment>? attachments,
    final List<TicketTimelineEntry>? timeline,
  }) {
    return TicketModel(
      id: id ?? this.id,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      project: project ?? this.project,
      clientNote: clientNote ?? this.clientNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      attachments: attachments ?? this.attachments,
      timeline: timeline ?? this.timeline,
    );
  }
}

// ── JSON read helpers (shared by TicketModel.fromJson) ────────────────

int _readInt(final Map<String, dynamic> src, final List<String> keys) =>
    _readIntOrNull(src, keys) ?? 0;

int? _readIntOrNull(
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

String _readString(final Map<String, dynamic> src, final List<String> keys) =>
    _readStringOrNull(src, keys) ?? '';

String? _readStringOrNull(
  final Map<String, dynamic> src,
  final List<String> keys,
) {
  for (final String k in keys) {
    final dynamic v = src[k];
    if (v is String && v.isNotEmpty) return v;
  }
  return null;
}

DateTime? _readDate(
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

DateTime _asUtc(final DateTime dt) => dt.isUtc
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
