/// Generic write-endpoint response used across the SDK for endpoints that
/// just return success/message (create, update, delete, etc.).
class CommonResponseModel {
  const CommonResponseModel({
    required this.success,
    this.message,
    this.statusCode,
    this.id,
  });

  final bool success;
  final String? message;
  final int? statusCode;

  /// Newly-created / updated record id when the endpoint returns one.
  final int? id;

  factory CommonResponseModel.fromJson(final Map<String, dynamic> json) {
    // Tolerate an optional `{ "result": { ... } }` wrapper.
    final Map<String, dynamic> src =
        json['result'] is Map<String, dynamic>
            ? json['result'] as Map<String, dynamic>
            : json;

    final bool success = _readBool(
          src,
          <String>['success', 'Success', 'isSuccess', 'IsSuccess'],
        ) ??
        // Fall back to statusCode if no explicit success flag.
        ((_readInt(src, <String>['statusCode', 'StatusCode']) ?? 0) < 400);

    return CommonResponseModel(
      success: success,
      message: _readString(
        src,
        <String>['message', 'Message', 'errorMessage', 'ErrorMessage'],
      ),
      statusCode: _readInt(src, <String>['statusCode', 'StatusCode']),
      id: _readInt(
        src,
        <String>[
          'id',
          'Id',
          'helpdeskTicketId',
          'HelpdeskTicketId',
        ],
      ),
    );
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

  static int? _readInt(
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

  static String? _readString(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) return v;
    }
    return null;
  }
}
