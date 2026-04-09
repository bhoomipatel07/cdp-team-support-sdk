import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_conversation_model.dart';

class TicketDummyData {
  /// Real helpdesk projects. IDs match the `HelpdeskProjectId` values in
  /// the backend and are sent as `helpdeskProjectId` on create/update.
  static const List<ProjectModel> projects = <ProjectModel>[
    ProjectModel(id: 1, name: 'CDP Shop Web'),
    ProjectModel(id: 2, name: 'CDP Streaming Web'),
    ProjectModel(id: 3, name: 'CDP Streaming IOS'),
    ProjectModel(id: 4, name: 'CDP Streaming Android'),
    ProjectModel(id: 5, name: 'CDP Photos FlutterApp'),
    ProjectModel(id: 6, name: 'CDP Photos Web'),
  ];

  static List<ConversationMessage> getConversationsForTicket(
      final int ticketId) {
    switch (ticketId) {
      case 1:
        return <ConversationMessage>[
          ConversationMessage(
            id: 1,
            senderName: 'Tech Support Admin',
            senderInitials: 'TS',
            senderRole: MessageUserRole.admin,
            message: 'Hello Todd Ahern!!',
            timestamp: DateTime(2026, 3, 30, 10, 30),
            isEdited: true,
          ),
          ConversationMessage(
            id: 2,
            senderName: 'Todd Ahern',
            senderInitials: 'TA',
            senderRole: MessageUserRole.user,
            message: 'Hello team!!',
            timestamp: DateTime(2026, 3, 30, 10, 35),
            likeCount: 1,
            isOwnMessage: true,
          ),
        ];
      case 6:
        return <ConversationMessage>[
          ConversationMessage(
            id: 3,
            senderName: 'Todd Ahern',
            senderInitials: 'TA',
            senderRole: MessageUserRole.user,
            message: 'Hiiii',
            timestamp: DateTime(2026, 3, 25, 16, 0),
            isOwnMessage: true,
            isEdited: true,
          ),
          ConversationMessage(
            id: 4,
            senderName: 'Unknown',
            senderInitials: 'U',
            senderRole: MessageUserRole.admin,
            message: 'Hello',
            timestamp: DateTime(2026, 3, 25, 16, 5),
          ),
        ];
      default:
        return <ConversationMessage>[];
    }
  }
}
