import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdp_team_support_sdk/src/bloc/ticket/ticket_bloc.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/common_enums.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';
import 'package:cdp_team_support_sdk/src/views/tickets/widgets/sdk_app_bar.dart';

class CreateTicketScreen extends StatelessWidget {
  final bool isEditMode;
  final TicketModel? ticketData;

  const CreateTicketScreen({
    super.key,
    this.isEditMode = false,
    this.ticketData,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TicketBloc>(
      create: (final BuildContext context) =>
          TicketBloc()..add(const OnLoadTickets()),
      child: _CreateTicketBody(
        isEditMode: isEditMode,
        ticketData: ticketData,
      ),
    );
  }
}

class _CreateTicketBody extends StatefulWidget {
  final bool isEditMode;
  final TicketModel? ticketData;

  const _CreateTicketBody({
    required this.isEditMode,
    this.ticketData,
  });

  @override
  State<_CreateTicketBody> createState() => _CreateTicketBodyState();
}

class _CreateTicketBodyState extends State<_CreateTicketBody> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _noteController;
  final List<PlatformFile> _pickedFiles = <PlatformFile>[];
  ProjectModel? _selectedProject;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.ticketData?.title ?? '');
    _descController =
        TextEditingController(text: widget.ticketData?.description ?? '');
    _noteController =
        TextEditingController(text: widget.ticketData?.clientNote ?? '');
    _selectedProject = widget.ticketData?.project;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickFiles() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: <String>[
        'jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'docx',
        'xls', 'xlsx', 'txt', 'zip', 'csv',
      ],
    );
    if (result != null && mounted) {
      final bool? confirmed = await _showPreviewDialog(result.files);
      if (confirmed == true) {
        setState(() {
          _pickedFiles.addAll(result.files);
        });
      }
    }
  }

  Future<bool?> _showPreviewDialog(final List<PlatformFile> files) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (final BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(
            horizontal: isTab ? 100 : 20,
            vertical: 60,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: SdkColors.splashDeep.withValues(alpha: 0.1)),
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
                      const Icon(Icons.preview_outlined,
                          color: Colors.white, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Preview Files (${files.length})',
                          style: sdkRubikW700(isTablet: isTab).copyWith(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(dialogContext, false),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.close_rounded,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 350),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemCount: files.length,
                    separatorBuilder: (final BuildContext _, final int __) =>
                        const SizedBox(height: 10),
                    itemBuilder:
                        (final BuildContext context, final int index) {
                      final PlatformFile file = files[index];
                      final bool isImage = <String>[
                        'jpg', 'jpeg', 'png', 'gif'
                      ].contains(file.extension?.toLowerCase());
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: SdkColors.bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: SdkColors.homeBorder, width: 1),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: SdkColors.homeBorder, width: 1),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: isImage && file.path != null
                                    ? Image.file(File(file.path!),
                                        fit: BoxFit.cover)
                                    : Icon(
                                        _getFileIcon(
                                            file.extension ?? 'file'),
                                        color: SdkColors.splashGlow,
                                        size: 28),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    file.name,
                                    style: sdkRubikW500(isTablet: isTab)
                                        .copyWith(
                                            fontSize: 13,
                                            color: SdkColors.splashDeep),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    _formatSize(file.size),
                                    style: sdkRubikW400(isTablet: isTab)
                                        .copyWith(
                                            fontSize: 11,
                                            color: SdkColors.homeSubtext),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.check_circle_rounded,
                                color: Color(0xFF22C55E), size: 22),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pop(dialogContext, false),
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: SdkColors.splashDeep
                                      .withValues(alpha: 0.25)),
                            ),
                            child: Center(
                              child: Text('Cancel',
                                  style: sdkRubikW600(isTablet: isTab)
                                      .copyWith(
                                          fontSize: 14,
                                          color: SdkColors.splashDeep)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pop(dialogContext, true),
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: SdkColors.splashDeep,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('Confirm',
                                  style: sdkRubikW600(isTablet: isTab)
                                      .copyWith(
                                          fontSize: 14,
                                          color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatSize(final int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  IconData _getFileIcon(final String ext) {
    switch (ext.toLowerCase()) {
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Icons.image_outlined;
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: BlocConsumer<TicketBloc, TicketState>(
        listener: (final BuildContext context, final TicketState state) {
          if (state.isTicketCreated) {
            Navigator.pop(context, true);
          }
        },
        builder: (final BuildContext context, final TicketState state) {
          return Scaffold(
            backgroundColor: SdkColors.bgColor,
            appBar: SdkAppBar(
              title:
                  widget.isEditMode ? 'Edit Ticket' : 'Create New Ticket',
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isTab
                    ? MediaQuery.of(context).size.width / 6
                    : 16,
                vertical: 20,
              ),
              child: Form(
                key: context.read<TicketBloc>().formKey,
                child: _buildFormCard(context, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormCard(final BuildContext context, final TicketState state) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      padding: EdgeInsets.all(isTab ? 28 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: SdkColors.homeShadow,
            blurRadius: 16,
            spreadRadius: -2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.isEditMode
                ? 'Update your ticket details'
                : 'Submit a support request to our team',
            style: sdkRubikW400(isTablet: isTab)
                .copyWith(fontSize: 13, color: SdkColors.homeSubtext),
          ),
          const SizedBox(height: 20),

          // Title
          _buildLabel('TITLE', isRequired: true),
          const SizedBox(height: 8),
          TextFormField(
            controller: _titleController,
            style: sdkRubikW500(isTablet: isTab)
                .copyWith(fontSize: 14, color: SdkColors.splashDeep),
            cursorColor: SdkColors.splashDeep,
            decoration: InputDecoration(
              hintText: 'Brief description of the issue',
              hintStyle: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.homeSubtext),
              filled: true,
              fillColor: SdkColors.bgColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.homeBorder, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.splashDeep, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.colorError500, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: SdkColors.colorError500, width: 1.5),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
            onChanged: (final String value) {
              context.read<TicketBloc>().add(OnChangeTitle(title: value));
            },
            validator: (final String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Description
          _buildLabel('DESCRIPTION', isRequired: true),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descController,
            maxLines: 5,
            maxLength: 200,
            style: sdkRubikW500(isTablet: isTab)
                .copyWith(fontSize: 14, color: SdkColors.splashDeep),
            cursorColor: SdkColors.splashDeep,
            decoration: InputDecoration(
              hintText: 'Detailed description of the issue',
              hintStyle: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.homeSubtext),
              filled: true,
              fillColor: SdkColors.bgColor,
              counterStyle: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 11, color: SdkColors.homeSubtext),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.homeBorder, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.splashDeep, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.colorError500, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: SdkColors.colorError500, width: 1.5),
              ),
              contentPadding: const EdgeInsets.all(14),
            ),
            onChanged: (final String value) {
              context
                  .read<TicketBloc>()
                  .add(OnChangeDescription(description: value));
            },
            validator: (final String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'Description is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Project dropdown
          _buildLabel('PROJECT'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: SdkColors.bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: SdkColors.homeBorder, width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ProjectModel?>(
                value: _selectedProject ?? state.selectedProject,
                isExpanded: true,
                dropdownColor: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down_rounded,
                    color: SdkColors.homeSubtext),
                hint: Text(
                  'Select a project (optional)',
                  style: sdkRubikW400(isTablet: isTab).copyWith(
                      fontSize: 14, color: SdkColors.homeSubtext),
                ),
                items: state.projects
                    .map((final ProjectModel p) =>
                        DropdownMenuItem<ProjectModel>(
                          value: p,
                          child: Text(p.name,
                              style: sdkRubikW500(isTablet: isTab)
                                  .copyWith(
                                      fontSize: 14,
                                      color: SdkColors.splashDeep)),
                        ))
                    .toList(),
                onChanged: (final ProjectModel? value) {
                  setState(() => _selectedProject = value);
                  context
                      .read<TicketBloc>()
                      .add(OnSelectProject(project: value));
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Client Note
          _buildLabel('CLIENT NOTE'),
          const SizedBox(height: 8),
          TextFormField(
            controller: _noteController,
            maxLines: 3,
            style: sdkRubikW500(isTablet: isTab)
                .copyWith(fontSize: 14, color: SdkColors.splashDeep),
            cursorColor: SdkColors.splashDeep,
            decoration: InputDecoration(
              hintText: 'Additional notes for the support team (optional)',
              hintStyle: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.homeSubtext),
              filled: true,
              fillColor: SdkColors.bgColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.homeBorder, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: SdkColors.splashDeep, width: 1.5),
              ),
              contentPadding: const EdgeInsets.all(14),
            ),
            onChanged: (final String value) {
              context.read<TicketBloc>().add(OnChangeNote(note: value));
            },
          ),
          const SizedBox(height: 24),

          // Attachments
          _buildLabel('Attachments'),
          const SizedBox(height: 8),

          if (widget.isEditMode &&
              widget.ticketData != null &&
              widget.ticketData!.attachments.isNotEmpty) ...<Widget>[
            ...widget.ticketData!.attachments.map(
                (final TicketAttachment a) => _buildExistingAttachment(a)),
            const SizedBox(height: 8),
          ],

          _buildAttachmentArea(),

          if (_pickedFiles.isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            ..._pickedFiles.asMap().entries.map(
                  (final MapEntry<int, PlatformFile> entry) =>
                      _buildPickedFileChip(entry.key, entry.value),
                ),
          ],
          const SizedBox(height: 32),

          // Buttons
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: isTab ? 50 : 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color:
                              SdkColors.splashDeep.withValues(alpha: 0.25)),
                    ),
                    child: Center(
                      child: Text('Cancel',
                          style: sdkRubikW600(isTablet: isTab).copyWith(
                              fontSize: isTab ? 15 : 14,
                              color: SdkColors.splashDeep)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    if (state.loadingState != CommonScreenState.loading) {
                      context
                          .read<TicketBloc>()
                          .add(const OnSubmitTicket());
                    }
                  },
                  child: Container(
                    height: isTab ? 50 : 46,
                    decoration: BoxDecoration(
                      color: SdkColors.splashDeep,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color:
                              SdkColors.splashDeep.withValues(alpha: 0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: state.loadingState == CommonScreenState.loading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                    widget.isEditMode
                                        ? Icons.save_rounded
                                        : Icons.check_rounded,
                                    color: Colors.white,
                                    size: 20),
                                const SizedBox(width: 6),
                                Text(
                                  widget.isEditMode
                                      ? 'Save Changes'
                                      : 'Create Ticket',
                                  style: sdkRubikW600(isTablet: isTab)
                                      .copyWith(
                                          fontSize: isTab ? 15 : 14,
                                          color: Colors.white),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(final String text, {final bool isRequired = false}) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return RichText(
      text: TextSpan(
        text: text,
        style: sdkRubikW600(isTablet: isTab).copyWith(
            fontSize: 12, color: SdkColors.homeSubtext, letterSpacing: 0.6),
        children: <TextSpan>[
          if (isRequired)
            TextSpan(
              text: ' *',
              style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 12, color: SdkColors.colorError500),
            ),
        ],
      ),
    );
  }

  Widget _buildAttachmentArea() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return GestureDetector(
      onTap: _pickFiles,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: SdkColors.bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SdkColors.homeBorder, width: 1),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: SdkColors.splashDeep.withValues(alpha: 0.06),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.cloud_upload_outlined,
                  color: SdkColors.homeSubtext, size: 24),
            ),
            const SizedBox(height: 10),
            Text('Drag & drop files here or',
                style: sdkRubikW400(isTablet: isTab)
                    .copyWith(fontSize: 13, color: SdkColors.homeSubtext)),
            const SizedBox(height: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: SdkColors.splashDeep, width: 1),
              ),
              child: Text('Browse Files',
                  style: sdkRubikW500(isTablet: isTab)
                      .copyWith(fontSize: 13, color: SdkColors.splashDeep)),
            ),
            const SizedBox(height: 8),
            Text(
              'Max 10MB per file. Allowed: images, pdf, doc, xls, txt, zip, csv',
              style: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 10, color: SdkColors.homeSubtext),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExistingAttachment(final TicketAttachment attachment) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.insert_drive_file_outlined,
              size: 20, color: SdkColors.splashGlow),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${attachment.fileName}.${attachment.fileExtension.toLowerCase()}',
                  style: sdkRubikW500(isTablet: isTab)
                      .copyWith(fontSize: 12, color: SdkColors.splashDeep),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(attachment.formattedSize,
                    style: sdkRubikW400(isTablet: isTab)
                        .copyWith(fontSize: 10, color: SdkColors.homeSubtext)),
              ],
            ),
          ),
          const Icon(Icons.check_circle_rounded,
              size: 18, color: Color(0xFF22C55E)),
        ],
      ),
    );
  }

  Widget _buildPickedFileChip(final int index, final PlatformFile file) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    final bool isImage = <String>['jpg', 'jpeg', 'png', 'gif']
        .contains(file.extension?.toLowerCase());
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: SdkColors.homeBorder, width: 0.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: isImage && file.path != null
                  ? Image.file(File(file.path!), fit: BoxFit.cover)
                  : Icon(_getFileIcon(file.extension ?? 'file'),
                      color: SdkColors.splashGlow, size: 20),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(file.name,
                    style: sdkRubikW500(isTablet: isTab).copyWith(
                        fontSize: 12, color: SdkColors.splashDeep),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(_formatSize(file.size),
                    style: sdkRubikW400(isTablet: isTab).copyWith(
                        fontSize: 10, color: SdkColors.homeSubtext)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _pickedFiles.removeAt(index)),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: SdkColors.colorError500.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.close_rounded,
                  size: 16, color: SdkColors.colorError500),
            ),
          ),
        ],
      ),
    );
  }
}
