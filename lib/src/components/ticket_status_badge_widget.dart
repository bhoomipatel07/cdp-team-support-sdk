import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class TicketStatusBadge extends StatelessWidget {
  final TicketStatus status;
  final double fontSize;

  const TicketStatusBadge({
    super.key,
    required this.status,
    this.fontSize = 11,
  });

  @override
  Widget build(final BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: status.color.withValues(alpha: 0.25),
          width: 0.5,
        ),
      ),
      child: Text(
        status.label,
        style: sdkRubikW600().copyWith(
          fontSize: fontSize,
          color: status.color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
