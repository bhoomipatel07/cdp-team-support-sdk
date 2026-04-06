enum MessageUserRole {
  admin('ADMIN'),
  user('USER');

  const MessageUserRole(this.label);
  final String label;
}

class ConversationMessage {
  final int id;
  final String senderName;
  final String senderInitials;
  final MessageUserRole senderRole;
  final String message;
  final DateTime timestamp;
  final int likeCount;
  final int dislikeCount;
  final bool isOwnMessage;
  final bool isEdited;

  const ConversationMessage({
    required this.id,
    required this.senderName,
    required this.senderInitials,
    required this.senderRole,
    required this.message,
    required this.timestamp,
    this.likeCount = 0,
    this.dislikeCount = 0,
    this.isOwnMessage = false,
    this.isEdited = false,
  });

  ConversationMessage copyWith({
    final int? id,
    final String? senderName,
    final String? senderInitials,
    final MessageUserRole? senderRole,
    final String? message,
    final DateTime? timestamp,
    final int? likeCount,
    final int? dislikeCount,
    final bool? isOwnMessage,
    final bool? isEdited,
  }) {
    return ConversationMessage(
      id: id ?? this.id,
      senderName: senderName ?? this.senderName,
      senderInitials: senderInitials ?? this.senderInitials,
      senderRole: senderRole ?? this.senderRole,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      isOwnMessage: isOwnMessage ?? this.isOwnMessage,
      isEdited: isEdited ?? this.isEdited,
    );
  }
}
