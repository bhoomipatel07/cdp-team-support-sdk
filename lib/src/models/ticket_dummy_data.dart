import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_conversation_model.dart';

class TicketDummyData {
  static const List<ProjectModel> projects = <ProjectModel>[
    ProjectModel(id: 1, name: 'CDP Photos FlutterApp'),
    ProjectModel(id: 2, name: 'CDP Streaming Web'),
    ProjectModel(id: 3, name: 'CDP Streaming Android'),
    ProjectModel(id: 4, name: 'CDP Shop'),
  ];

  static List<TicketModel> get tickets => <TicketModel>[
        TicketModel(
          id: 1,
          ticketNumber: 'TKT-0026',
          title: 'Ticket Status Not Updating Correctly',
          description:
              'The ticket status is not updating properly on the Ticket Details page. Even after changes are made from the backend or admin panel, the status still shows as "In Progress" and does not reflect the latest state.',
          status: TicketStatus.inProgress,
          project: projects[1],
          clientNote:
              'Hi Team, The ticket status seems to be stuck and not reflecting recent updates. Could you please check if the status update logic or API response is working correctly?',
          createdAt: DateTime(2026, 3, 27, 19, 12),
          updatedAt: DateTime(2026, 4, 1, 18, 23),
          attachments: const <TicketAttachment>[
            TicketAttachment(
              id: 1,
              fileName: 'Screenshot 2026-03-27 103',
              fileExtension: 'PNG',
              fileSizeBytes: 141005,
            ),
          ],
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Assigned to HelpDesk Admin',
              timestamp: DateTime(2026, 3, 30, 14, 42, 54),
              dotColor: const Color(0xFF22C55E),
            ),
            TicketTimelineEntry(
              title: 'Status changed to InProgress',
              timestamp: DateTime(2026, 3, 30, 14, 42, 54),
              dotColor: const Color(0xFFF59E0B),
            ),
            TicketTimelineEntry(
              title: 'Comment added by client',
              timestamp: DateTime(2026, 3, 30, 10, 49, 58),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: '1 file(s) uploaded',
              timestamp: DateTime(2026, 3, 27, 19, 12, 59),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: 'Ticket TKT-0026 created',
              timestamp: DateTime(2026, 3, 27, 19, 12, 56),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 2,
          ticketNumber: 'TKT-0025',
          title: 'Test without category and priority',
          description:
              'Testing ticket creation without category and priority fields.',
          status: TicketStatus.open,
          project: projects[3],
          createdAt: DateTime(2026, 3, 26),
          updatedAt: DateTime(2026, 3, 26),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket TKT-0025 created',
              timestamp: DateTime(2026, 3, 26),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 3,
          ticketNumber: 'TKT-0024',
          title: 'Test from Global API',
          description: 'API endpoint testing for global ticket creation.',
          status: TicketStatus.open,
          project: projects[3],
          createdAt: DateTime(2026, 3, 26),
          updatedAt: DateTime(2026, 3, 26),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket TKT-0024 created',
              timestamp: DateTime(2026, 3, 26),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 4,
          ticketNumber: 'TKT-0023',
          title: 'Uploaded image does not show on ticket detail page',
          description:
              'When uploading an image attachment to a ticket, the image does not appear in the detail view. The file is uploaded successfully but the thumbnail is missing.',
          status: TicketStatus.open,
          project: projects[2],
          clientNote: 'Please check the image rendering on detail page.',
          createdAt: DateTime(2026, 3, 26),
          updatedAt: DateTime(2026, 3, 26),
          attachments: const <TicketAttachment>[
            TicketAttachment(
              id: 2,
              fileName: 'fa4ba9d9-0aa1-4d3e-ae4b-c4016cc66c59',
              fileExtension: 'JPG',
              fileSizeBytes: 20480,
            ),
          ],
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: '1 file(s) uploaded',
              timestamp: DateTime(2026, 3, 26, 15, 13, 16),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: 'Ticket TKT-0023 created',
              timestamp: DateTime(2026, 3, 26),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 5,
          ticketNumber: 'TKT-0022',
          title: 'Ticket Conversation Section Not Updating',
          description:
              'The conversation section on ticket detail does not refresh when a new message is sent. User has to manually reload the page.',
          status: TicketStatus.open,
          project: projects[1],
          createdAt: DateTime(2026, 3, 26),
          updatedAt: DateTime(2026, 3, 26),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket TKT-0022 created',
              timestamp: DateTime(2026, 3, 26),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 6,
          ticketNumber: 'TKT-0017',
          title: 'Detail page is not showing proper data.',
          description: 'Detail page is not showing proper data.',
          status: TicketStatus.open,
          project: projects[0],
          clientNote: 'Fix it quickly,',
          createdAt: DateTime(2026, 3, 25, 15, 57),
          updatedAt: DateTime(2026, 4, 1, 15, 28),
          attachments: const <TicketAttachment>[
            TicketAttachment(
              id: 3,
              fileName: 'fa4ba9d9-0aa1-4d3e-ae4b',
              fileExtension: 'JPG',
              fileSizeBytes: 20480,
            ),
          ],
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket updated by client',
              timestamp: DateTime(2026, 4, 1, 15, 28, 16),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: 'Ticket updated by client',
              timestamp: DateTime(2026, 4, 1, 15, 22, 31),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: '1 file(s) uploaded',
              timestamp: DateTime(2026, 4, 1, 15, 13, 16),
              dotColor: const Color(0xFF6B7280),
            ),
            TicketTimelineEntry(
              title: 'Ticket TKT-0017 created',
              timestamp: DateTime(2026, 3, 25, 15, 57),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 7,
          ticketNumber: 'TKT-0015',
          title: 'Push notifications not received on Android',
          description:
              'Firebase push notifications are not being delivered on Android devices running Android 13+. The FCM token is registered but no notifications arrive.',
          status: TicketStatus.resolved,
          project: projects[2],
          clientNote: 'Tested on Samsung Galaxy S23 and Pixel 7.',
          createdAt: DateTime(2026, 3, 20),
          updatedAt: DateTime(2026, 3, 28),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Status changed to Resolved',
              timestamp: DateTime(2026, 3, 28),
              dotColor: const Color(0xFF14B8A6),
            ),
            TicketTimelineEntry(
              title: 'Ticket TKT-0015 created',
              timestamp: DateTime(2026, 3, 20),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 8,
          ticketNumber: 'TKT-0012',
          title: 'Cart total calculation incorrect with discount',
          description:
              'When applying a discount coupon, the cart total does not recalculate correctly. The subtotal remains unchanged.',
          status: TicketStatus.open,
          project: projects[0],
          createdAt: DateTime(2026, 3, 18),
          updatedAt: DateTime(2026, 3, 22),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket TKT-0012 created',
              timestamp: DateTime(2026, 3, 18),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
        TicketModel(
          id: 9,
          ticketNumber: 'TKT-0008',
          title: 'Search functionality returns empty results',
          description:
              'The search feature on the categories screen returns empty results for keywords that should match existing products.',
          status: TicketStatus.open,
          project: projects[0],
          createdAt: DateTime(2026, 3, 15),
          updatedAt: DateTime(2026, 3, 19),
          timeline: <TicketTimelineEntry>[
            TicketTimelineEntry(
              title: 'Ticket TKT-0008 created',
              timestamp: DateTime(2026, 3, 15),
              dotColor: const Color(0xFF3B82F6),
            ),
          ],
        ),
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
