/// Counts shown on the ticket dashboard stat cards.
///
/// Parsed from `HelpdeskTicket/GetHelpdeskTicketDashboardCounts`. The API
/// is a .NET endpoint so keys may arrive as PascalCase or camelCase; the
/// parser handles both, and also unwraps a top-level `result` wrapper if
/// present.
class TicketDashboardCountsModel {
  const TicketDashboardCountsModel({
    required this.totalCount,
    required this.openCount,
    required this.inProgressCount,
    required this.resolvedCount,
    required this.closedCount,
  });

  final int totalCount;
  final int openCount;
  final int inProgressCount;
  final int resolvedCount;
  final int closedCount;

  factory TicketDashboardCountsModel.fromJson(final Map<String, dynamic> json) {
    // Some CDP endpoints wrap the payload in `{ "result": { ... } }`.
    final Map<String, dynamic> src =
        json['result'] is Map<String, dynamic>
            ? json['result'] as Map<String, dynamic>
            : json;

    return TicketDashboardCountsModel(
      totalCount: _readInt(src, <String>[
        'totalTickets',
        'TotalTickets',
        'totalCount',
        'TotalCount',
        'total',
      ]),
      openCount: _readInt(src, <String>[
        'openTickets',
        'OpenTickets',
        'openCount',
        'OpenCount',
        'open',
      ]),
      inProgressCount: _readInt(src, <String>[
        'inProgressTickets',
        'InProgressTickets',
        'inProgressCount',
        'InProgressCount',
        'inProgress',
      ]),
      resolvedCount: _readInt(src, <String>[
        'resolvedTickets',
        'ResolvedTickets',
        'resolvedCount',
        'ResolvedCount',
        'resolved',
      ]),
      closedCount: _readInt(src, <String>[
        'closedTickets',
        'ClosedTickets',
        'closedCount',
        'ClosedCount',
        'closed',
      ]),
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

  static const TicketDashboardCountsModel empty = TicketDashboardCountsModel(
    totalCount: 0,
    openCount: 0,
    inProgressCount: 0,
    resolvedCount: 0,
    closedCount: 0,
  );
}
