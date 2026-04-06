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
}

class ProjectModel {
  final int id;
  final String name;

  const ProjectModel({required this.id, required this.name});

  @override
  String toString() => name;
}

class TicketAttachment {
  final int id;
  final String fileName;
  final String fileExtension;
  final int fileSizeBytes;
  final String? localPath;

  const TicketAttachment({
    required this.id,
    required this.fileName,
    required this.fileExtension,
    required this.fileSizeBytes,
    this.localPath,
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
