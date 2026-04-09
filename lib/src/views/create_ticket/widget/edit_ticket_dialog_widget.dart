import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/models/ticket_model.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class EditTicketDialog extends StatefulWidget {
  final TicketModel ticket;
  final List<ProjectModel> projects;
  final void Function(
      String title, String description, String? note, ProjectModel? project)
  onSave;

  const EditTicketDialog({
    super.key,
    required this.ticket,
    required this.projects,
    required this.onSave,
  });

  @override
  State<EditTicketDialog> createState() => _EditTicketDialogState();
}

class _EditTicketDialogState extends State<EditTicketDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _noteController;
  ProjectModel? _selectedProject;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.ticket.title);
    _descController = TextEditingController(text: widget.ticket.description);
    _noteController =
        TextEditingController(text: widget.ticket.clientNote ?? '');
    _selectedProject = widget.ticket.project;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isTab ? 120 : 20,
          vertical: 40,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
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
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  gradient: sdkLinearGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isTab ? 28 : 22),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Edit Ticket',
                              style: sdkRubikW700(isTablet: isTab).copyWith(
                                fontSize: isTab ? 22 : 18,
                                color: SdkColors.splashDeep,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: SdkColors.splashDeep
                                      .withValues(alpha: 0.06),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.close_rounded,
                                    color: SdkColors.homeSubtext, size: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        _buildLabel('TITLE', isRequired: true),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _titleController,
                          hintText: 'Brief description',
                          validator: (final String? v) =>
                          (v == null || v
                              .trim()
                              .isEmpty)
                              ? 'Title is required'
                              : null,
                        ),
                        const SizedBox(height: 18),
                        _buildLabel('PROJECT', isRequired: true),
                        const SizedBox(height: 8),
                        _buildProjectDropdown(),
                        const SizedBox(height: 18),
                        _buildLabel('DESCRIPTION', isRequired: true),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _descController,
                          hintText: 'Detailed description',
                          maxLines: 4,
                          validator: (final String? v) =>
                          (v == null || v
                              .trim()
                              .isEmpty)
                              ? 'Description is required'
                              : null,
                        ),
                        const SizedBox(height: 18),
                        _buildLabel('NOTE'),
                        const SizedBox(height: 4),
                        Text(
                          '(optional)',
                          style: sdkRubikW400(isTablet: isTab).copyWith(
                              fontSize: 10, color: SdkColors.homeSubtext),
                        ),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _noteController,
                          hintText: 'Additional notes',
                          maxLines: 3,
                        ),
                        const SizedBox(height: 18),
                        _buildLabel('ATTACHMENTS'),
                        const SizedBox(height: 8),
                        if (widget.ticket.attachments.isNotEmpty)
                          ...widget.ticket.attachments.map(
                                  (final TicketAttachment a) =>
                                  _buildAttachmentRow(a)),
                        _buildAddFilesButton(),
                        const SizedBox(height: 24),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  height: isTab ? 48 : 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: SdkColors.splashDeep
                                          .withValues(alpha: 0.25),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style:
                                      sdkRubikW600(isTablet: isTab)
                                          .copyWith(
                                        fontSize: 14,
                                        color: SdkColors.splashDeep,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: _handleSave,
                                child: Container(
                                  height: isTab ? 48 : 44,
                                  decoration: BoxDecoration(
                                    color: SdkColors.splashDeep,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: SdkColors.splashDeep
                                            .withValues(alpha: 0.25),
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Save Changes',
                                      style:
                                      sdkRubikW600(isTablet: isTab)
                                          .copyWith(
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(final String text, {final bool isRequired = false}) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return RichText(
      text: TextSpan(
        text: text,
        style: sdkRubikW600(isTablet: isTab).copyWith(
          fontSize: 11,
          color: SdkColors.homeSubtext,
          letterSpacing: 0.6,
        ),
        children: <TextSpan>[
          if (isRequired)
            TextSpan(
              text: ' *',
              style: sdkRubikW600(isTablet: isTab).copyWith(
                  fontSize: 11, color: SdkColors.colorError500),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required final TextEditingController controller,
    required final String hintText,
    final int maxLines = 1,
    final String? Function(String?)? validator,
  }) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: sdkRubikW500(isTablet: isTab)
          .copyWith(fontSize: 14, color: SdkColors.splashDeep),
      cursorColor: SdkColors.splashDeep,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: sdkRubikW400(isTablet: isTab)
            .copyWith(fontSize: 13, color: SdkColors.homeSubtext),
        filled: true,
        fillColor: SdkColors.bgColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: SdkColors.homeBorder, width: 1),
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
          borderSide:
          const BorderSide(color: SdkColors.colorError500, width: 1.5),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }

  Widget _buildProjectDropdown() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ProjectModel?>(
          value: _selectedProject,
          isExpanded: true,
          dropdownColor: Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: SdkColors.homeSubtext),
          items: widget.projects
              .map((final ProjectModel p) =>
              DropdownMenuItem<ProjectModel>(
                value: p,
                child: Text(p.name,
                    style: sdkRubikW500(isTablet: isTab).copyWith(
                        fontSize: 14, color: SdkColors.splashDeep)),
              ))
              .toList(),
          onChanged: (final ProjectModel? value) {
            setState(() => _selectedProject = value);
          },
        ),
      ),
    );
  }

  Widget _buildAttachmentRow(final TicketAttachment attachment) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: SdkColors.bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SdkColors.homeBorder, width: 1),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.insert_drive_file_outlined,
              size: 18, color: SdkColors.homeSubtext),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${attachment.fileName}.${attachment.fileExtension
                  .toLowerCase()}',
              style: sdkRubikW400(isTablet: isTab)
                  .copyWith(fontSize: 13, color: SdkColors.splashDeep),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.visibility_outlined,
                size: 18, color: SdkColors.homeSubtext),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.close_rounded,
                size: 18, color: SdkColors.colorError500),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFilesButton() {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
        Border.all(color: SdkColors.splashGlow.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.attach_file_rounded,
              size: 16, color: SdkColors.splashGlow),
          const SizedBox(width: 6),
          Text(
            'Add Files',
            style: sdkRubikW500(isTablet: isTab)
                .copyWith(fontSize: 13, color: SdkColors.splashGlow),
          ),
        ],
      ),
    );
  }

  void _handleSave() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    widget.onSave(
      _titleController.text,
      _descController.text,
      _noteController.text.isEmpty ? null : _noteController.text,
      _selectedProject,
    );
    Navigator.pop(context);
  }
}
