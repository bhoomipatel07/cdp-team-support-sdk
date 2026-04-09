/// A helpdesk attachment record returned alongside tickets or comments.
class HelpdeskAttachmentModel {
  const HelpdeskAttachmentModel({
    required this.id,
    required this.fileName,
    required this.fileExtension,
    required this.fileSizeBytes,
    this.contentType,
    this.url,
    this.uploadedOn,
  });

  final int id;
  final String fileName;
  final String fileExtension;
  final int fileSizeBytes;
  final String? contentType;
  final String? url;
  final DateTime? uploadedOn;

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

  factory HelpdeskAttachmentModel.fromJson(final Map<String, dynamic> json) {
    final String fileName = _readString(
      json,
      const <String>['fileName', 'FileName', 'name', 'Name'],
    );
    String ext = _readString(
      json,
      const <String>['fileExtension', 'FileExtension', 'extension', 'Extension'],
    );
    if (ext.isEmpty && fileName.contains('.')) {
      ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    }

    return HelpdeskAttachmentModel(
      id: _readInt(json, const <String>[
        'helpdeskAttachmentId',
        'HelpdeskAttachmentId',
        'attachmentId',
        'AttachmentId',
        'id',
        'Id',
      ]),
      fileName: fileName,
      fileExtension: ext,
      fileSizeBytes: _readInt(json, const <String>[
        'fileSizeBytes',
        'FileSizeBytes',
        'fileSize',
        'FileSize',
        'size',
        'Size',
      ]),
      contentType: _readStringOrNull(json, const <String>[
        'contentType',
        'ContentType',
        'mimeType',
        'MimeType',
      ]),
      url: _readStringOrNull(json, const <String>[
        'url',
        'Url',
        'fileUrl',
        'FileUrl',
        'viewUrl',
        'ViewUrl',
      ]),
      uploadedOn: _readDate(json, const <String>[
        'uploadedOn',
        'UploadedOn',
        'createdOn',
        'CreatedOn',
      ]),
    );
  }

  static List<HelpdeskAttachmentModel> fromJsonList(final dynamic data) {
    final List<dynamic>? list = data is List
        ? data
        : (data is Map<String, dynamic> && data['result'] is List
            ? data['result'] as List<dynamic>
            : null);

    if (list == null) return const <HelpdeskAttachmentModel>[];
    return list
        .whereType<Map<String, dynamic>>()
        .map(HelpdeskAttachmentModel.fromJson)
        .toList();
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

  static String _readString(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) =>
      _readStringOrNull(src, keys) ?? '';

  static String? _readStringOrNull(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) return v;
    }
    return null;
  }

  static DateTime? _readDate(
    final Map<String, dynamic> src,
    final List<String> keys,
  ) {
    for (final String k in keys) {
      final dynamic v = src[k];
      if (v is String && v.isNotEmpty) {
        final DateTime? parsed = DateTime.tryParse(v);
        if (parsed != null) return parsed;
      }
    }
    return null;
  }
}
