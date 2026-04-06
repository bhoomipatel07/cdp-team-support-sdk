import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

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
                      onTap: () => _showFilePreview(context, a),
                    ))
                .toList(),
          ),
        ),
      ],
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
