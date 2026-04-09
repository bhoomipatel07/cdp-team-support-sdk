import 'dart:io';

import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/repository/attachment_repo.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketAttachmentWidget extends StatelessWidget {
  final List<TicketAttachment> attachments;

  const TicketAttachmentWidget({super.key, required this.attachments});

  @override
  Widget build(final BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'YOUR ATTACHMENTS (${attachments.length})',
          style: sdkRubikW600(isTablet: isTab).copyWith(
            fontSize: 11,
            color: SdkColors.homeSubtext,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: attachments
                .map((final TicketAttachment a) => _AttachmentCard(
                      attachment: a,
                      onTap: () => _handleAttachmentTap(context, a),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Future<void> _handleAttachmentTap(
    final BuildContext context,
    final TicketAttachment attachment,
  ) async {
    // Images can be rendered inline in the existing dialog.
    if (attachment.isImage) {
      _showFilePreview(context, attachment);
      return;
    }

    // For PDFs / docs / etc. fetch a viewable URL from the API and
    // launch it in the system's default handler.
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Opening file…'),
      ),
    );

    final Either<Failure, String> result = await AttachmentRepoImp()
        .getAttachmentViewUrl(attachmentId: attachment.id);

    if (!context.mounted) return;

    await result.fold(
      (final Failure error) async {
        messenger.showSnackBar(
          SnackBar(
            content: Text('Failed to open: ${error.message ?? 'unknown'}'),
            backgroundColor: SdkColors.colorError500,
          ),
        );
      },
      (final String url) async {
        final Uri uri = Uri.tryParse(url) ?? Uri();
        final bool ok = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!ok && context.mounted) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('No application available to open this file'),
              backgroundColor: SdkColors.colorError500,
            ),
          );
        }
      },
    );
  }

  void _showFilePreview(
      final BuildContext context, final TicketAttachment attachment) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (final BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(
            horizontal: isTab ? 80 : 20,
            vertical: 60,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600, maxHeight: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: SdkColors.splashDeep.withValues(alpha: 0.1),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: SdkColors.splashDeep.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: SdkColors.splashDeep,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        attachment.isImage
                            ? Icons.image_outlined
                            : Icons.insert_drive_file_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${attachment.fileName}.${attachment.fileExtension.toLowerCase()}',
                              style: sdkRubikW600(isTablet: isTab).copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${attachment.formattedSize} . ${attachment.fileExtension}',
                              style: sdkRubikW400(isTablet: isTab).copyWith(
                                fontSize: 11,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(dialogContext),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    child: attachment.isImage && attachment.localPath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(attachment.localPath!),
                              fit: BoxFit.contain,
                            ),
                          )
                        : attachment.isImage && attachment.remoteUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  attachment.remoteUrl!,
                                  fit: BoxFit.contain,
                                  headers: _authHeaders(),
                                  loadingBuilder: (
                                    final BuildContext _,
                                    final Widget child,
                                    final ImageChunkEvent? progress,
                                  ) {
                                    if (progress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: SdkColors.splashDeep,
                                      ),
                                    );
                                  },
                                  errorBuilder: (
                                    final BuildContext _,
                                    final Object __,
                                    final StackTrace? ___,
                                  ) =>
                                      _buildFallback(context, attachment),
                                ),
                              )
                            : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: SdkColors.splashDeep
                                      .withValues(alpha: 0.06),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _getFileIcon(attachment.fileExtension),
                                  color: SdkColors.splashDeep,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                attachment.fileName,
                                style:
                                    sdkRubikW600(isTablet: isTab).copyWith(
                                  fontSize: 16,
                                  color: SdkColors.splashDeep,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${attachment.formattedSize} . ${attachment.fileExtension}',
                                style:
                                    sdkRubikW400(isTablet: isTab).copyWith(
                                  fontSize: 13,
                                  color: SdkColors.homeSubtext,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'File preview not available',
                                style:
                                    sdkRubikW400(isTablet: isTab).copyWith(
                                  fontSize: 12,
                                  color: SdkColors.homeSubtext,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Container(
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    gradient: sdkLinearGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getFileIcon(final String ext) {
    switch (ext.toUpperCase()) {
      case 'PNG':
      case 'JPG':
      case 'JPEG':
        return Icons.image_outlined;
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'DOC':
      case 'DOCX':
        return Icons.description_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  Widget _buildFallback(
    final BuildContext context,
    final TicketAttachment attachment,
  ) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: SdkColors.splashDeep.withValues(alpha: 0.06),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getFileIcon(attachment.fileExtension),
            color: SdkColors.splashDeep,
            size: 40,
          ),
        ),
        const SizedBox(height: 16),
        Text('Failed to load preview',
            style: sdkRubikW500(isTablet: isTab)
                .copyWith(fontSize: 13, color: SdkColors.homeSubtext)),
      ],
    );
  }
}

/// Builds the Bearer auth header required by the attachment endpoints.
/// Returns an empty map if no token is configured.
Map<String, String> _authHeaders() {
  final String token = SupportSdkConfig.instance.authToken;
  if (token.isEmpty) return const <String, String>{};
  return <String, String>{'Authorization': 'Bearer $token'};
}

class _AttachmentCard extends StatelessWidget {
  final TicketAttachment attachment;
  final VoidCallback onTap;

  const _AttachmentCard({required this.attachment, required this.onTap});

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isTab ? 160 : 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SdkColors.homeBorder, width: 1),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: SdkColors.homeShadow,
              blurRadius: 8,
              spreadRadius: -2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: isTab ? 100 : 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: SdkColors.bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  if (attachment.isImage && attachment.localPath != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.file(
                        File(attachment.localPath!),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (attachment.isImage && attachment.remoteUrl != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        attachment.remoteUrl!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        headers: _authHeaders(),
                        errorBuilder: (
                          final BuildContext _,
                          final Object __,
                          final StackTrace? ___,
                        ) =>
                            Center(
                          child: Icon(
                            _getFileIcon(attachment.fileExtension),
                            color: SdkColors.splashGlow.withValues(alpha: 0.5),
                            size: 36,
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Icon(
                        _getFileIcon(attachment.fileExtension),
                        color: SdkColors.splashGlow.withValues(alpha: 0.5),
                        size: 36,
                      ),
                    ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: SdkColors.splashDeep.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Click to view',
                        style: sdkRubikW500(isTablet: isTab).copyWith(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${attachment.fileName}...',
                    style: sdkRubikW500(isTablet: isTab).copyWith(
                      fontSize: 11,
                      color: SdkColors.splashDeep,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${attachment.formattedSize} . ${attachment.fileExtension}',
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: 10,
                      color: SdkColors.homeSubtext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFileIcon(final String ext) {
    switch (ext.toUpperCase()) {
      case 'PNG':
      case 'JPG':
      case 'JPEG':
        return Icons.image_outlined;
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'DOC':
      case 'DOCX':
        return Icons.description_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }
}
