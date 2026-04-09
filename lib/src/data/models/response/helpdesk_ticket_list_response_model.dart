import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';

/// Paginated list of helpdesk tickets returned by
/// `HelpdeskTicket/GetMyHelpdeskTickets`.
///
/// Tolerates several common CDP wrapper shapes:
///   • top-level `{ items/data/tickets, totalCount/totalRecords, ... }`
///   • nested `{ "result": { items: [...], ... } }`
///   • bare list `[ { ... }, { ... } ]`
class HelpdeskTicketListResponseModel {
  const HelpdeskTicketListResponseModel({
    required this.items,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
  });

  final List<TicketModel> items;
  final int totalCount;
  final int pageNumber;
  final int pageSize;

  /// True when more pages are available based on [totalCount].
  bool get hasMore => pageNumber * pageSize < totalCount;

  factory HelpdeskTicketListResponseModel.fromJson(final dynamic data) {
    // Bare list → wrap as single-page response.
    if (data is List) {
      return HelpdeskTicketListResponseModel(
        items: data
            .whereType<Map<String, dynamic>>()
            .map(TicketModel.fromJson)
            .toList(),
        totalCount: data.length,
        pageNumber: 1,
        pageSize: data.length,
      );
    }

    if (data is! Map<String, dynamic>) {
      return const HelpdeskTicketListResponseModel(
        items: <TicketModel>[],
        totalCount: 0,
        pageNumber: 1,
        pageSize: 0,
      );
    }

    // Optionally unwrap `{ "result": ... }`.
    final Map<String, dynamic> src = data['result'] is Map<String, dynamic>
        ? data['result'] as Map<String, dynamic>
        : data;

    // Items may live under many keys.
    List<dynamic>? rawItems;
    for (final String key in const <String>[
      'items',
      'Items',
      'data',
      'Data',
      'tickets',
      'Tickets',
      'records',
      'Records',
      'list',
      'List',
    ]) {
      if (src[key] is List) {
        rawItems = src[key] as List<dynamic>;
        break;
      }
    }
    // Some APIs put the list directly in `result`.
    if (rawItems == null && data['result'] is List) {
      rawItems = data['result'] as List<dynamic>;
    }

    final List<TicketModel> items = (rawItems ?? const <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(TicketModel.fromJson)
        .toList();

    return HelpdeskTicketListResponseModel(
      items: items,
      totalCount: _readInt(
        src,
        <String>[
          'totalCount',
          'TotalCount',
          'totalRecords',
          'TotalRecords',
          'total',
          'Total',
        ],
      ),
      pageNumber: _readInt(
        src,
        <String>['pageNumber', 'PageNumber', 'page', 'Page'],
        fallback: 1,
      ),
      pageSize: _readInt(
        src,
        <String>['pageSize', 'PageSize', 'limit', 'Limit'],
        fallback: items.length,
      ),
    );
  }

  static int _readInt(
    final Map<String, dynamic> src,
    final List<String> keys, {
    final int fallback = 0,
  }) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is int) return v;
      if (v is num) return v.toInt();
      if (v is String) {
        final int? parsed = int.tryParse(v);
        if (parsed != null) return parsed;
      }
    }
    return fallback;
  }
}
