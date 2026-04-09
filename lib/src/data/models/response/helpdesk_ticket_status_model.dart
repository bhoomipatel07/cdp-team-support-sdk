/// A single helpdesk ticket status returned by
/// `HelpdeskTicket/GetHelpdeskTicketStatuses`.
///
/// Example:
/// ```json
/// { "helpdeskStatusId": 2, "statusCode": "InProgress",
///   "statusName": "In Progress", "sortOrder": 2, "isActive": true }
/// ```
///
/// NOTE: this model is **not** used by the dashboard count UI — that is
/// driven by the dedicated counts endpoint.
class HelpdeskTicketStatusModel {
  const HelpdeskTicketStatusModel({
    required this.id,
    required this.statusCode,
    required this.statusName,
    this.sortOrder,
    this.isActive = true,
  });

  final int id;

  /// Machine-readable code (e.g. `Open`, `InProgress`). This is what the
  /// `GetMyHelpdeskTickets` `Status` query param expects.
  final String statusCode;

  /// Human-readable label (e.g. `In Progress`).
  final String statusName;

  final int? sortOrder;
  final bool isActive;

  /// Back-compat alias used in older UI code that expected `.name`.
  String get name => statusName;

  factory HelpdeskTicketStatusModel.fromJson(final Map<String, dynamic> json) {
    return HelpdeskTicketStatusModel(
      id: _readInt(json, const <String>[
        'helpdeskStatusId',
        'HelpdeskStatusId',
        'statusId',
        'StatusId',
        'id',
        'Id',
      ]),
      statusCode: _readString(json, const <String>[
        'statusCode',
        'StatusCode',
        'code',
        'Code',
      ]),
      statusName: _readString(json, const <String>[
        'statusName',
        'StatusName',
        'name',
        'Name',
        'title',
        'Title',
      ]),
      sortOrder: _readIntOrNull(json, const <String>[
        'sortOrder',
        'SortOrder',
        'displayOrder',
        'DisplayOrder',
        'order',
        'Order',
      ]),
      isActive: _readBool(json, const <String>['isActive', 'IsActive']) ?? true,
    );
  }

  static List<HelpdeskTicketStatusModel> fromJsonList(final dynamic data) {
    final List<dynamic>? list = data is List
        ? data
        : (data is Map<String, dynamic> && data['result'] is List
            ? data['result'] as List<dynamic>
            : null);

    if (list == null) return const <HelpdeskTicketStatusModel>[];

    return list
        .whereType<Map<String, dynamic>>()
        .map(HelpdeskTicketStatusModel.fromJson)
        .where((final HelpdeskTicketStatusModel s) => s.isActive)
        .toList()
      ..sort((final HelpdeskTicketStatusModel a,
              final HelpdeskTicketStatusModel b) =>
          (a.sortOrder ?? a.id).compareTo(b.sortOrder ?? b.id));
  }

  @override
  bool operator ==(final Object other) =>
      other is HelpdeskTicketStatusModel && other.id == id;

  @override
  int get hashCode => id.hashCode;

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
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) return v;
    }
    return '';
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
}
