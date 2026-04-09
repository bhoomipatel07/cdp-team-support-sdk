import 'dart:io';

import 'package:cdp_team_support_sdk/src/data/api/dio_client.dart';
import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/api/endpoints.dart';
import 'package:cdp_team_support_sdk/src/data/api/typedef.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/common_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_attachment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class AttachmentRepo {
  /// Uploads one or more files to a ticket (or to a comment when
  /// [commentId] is provided).
  ResultFuture<List<HelpdeskAttachmentModel>> uploadAttachments({
    required final int ticketId,
    required final List<File> files,
    final int? commentId,
  });

  /// Returns a viewable URL for an attachment (used by the UI to load
  /// images / PDFs without streaming through the app).
  ResultFuture<String> getAttachmentViewUrl({
    required final int attachmentId,
  });

  ResultFuture<CommonResponseModel> deleteAttachment({
    required final int attachmentId,
  });
}

class AttachmentRepoImp implements AttachmentRepo {
  AttachmentRepoImp({final DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  final DioClient _dioClient;

  @override
  ResultFuture<List<HelpdeskAttachmentModel>> uploadAttachments({
    required final int ticketId,
    required final List<File> files,
    final int? commentId,
  }) async {
    try {
      final List<MultipartFile> multipartFiles = <MultipartFile>[];
      for (final File f in files) {
        multipartFiles.add(
          await MultipartFile.fromFile(
            f.path,
            filename: f.uri.pathSegments.isNotEmpty
                ? f.uri.pathSegments.last
                : null,
          ),
        );
      }

      final FormData formData = FormData.fromMap(<String, dynamic>{
        'files': multipartFiles,
      });

      final Response<dynamic> response = await _dioClient.post(
        SupportEndpoints.uploadHelpdeskAttachments(
          ticketId: ticketId,
          commentId: commentId,
        ),
        data: formData,
      );

      return Right<Failure, List<HelpdeskAttachmentModel>>(
        HelpdeskAttachmentModel.fromJsonList(response.data),
      );
    } on DioException catch (e) {
      debugPrint('[SupportSDK] uploadAttachments DioException: ${e.message}');
      return Left<Failure, List<HelpdeskAttachmentModel>>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] uploadAttachments error: $e');
      return Left<Failure, List<HelpdeskAttachmentModel>>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<String> getAttachmentViewUrl({
    required final int attachmentId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getHelpdeskAttachmentViewUrl(
          attachmentId: attachmentId,
        ),
      );

      final dynamic data = response.data;
      String? url;
      if (data is String) {
        url = data;
      } else if (data is Map<String, dynamic>) {
        url = (data['url'] ?? data['Url'] ?? data['viewUrl'] ?? data['ViewUrl'])
            ?.toString();
      }

      if (url == null || url.isEmpty) {
        return const Left<Failure, String>(
          ApiFailure(message: 'Empty attachment URL'),
        );
      }
      return Right<Failure, String>(url);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getAttachmentViewUrl DioException: ${e.message}');
      return Left<Failure, String>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getAttachmentViewUrl error: $e');
      return Left<Failure, String>(ApiFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<CommonResponseModel> deleteAttachment({
    required final int attachmentId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.delete(
        SupportEndpoints.deleteHelpdeskAttachment(attachmentId: attachmentId),
      );
      final CommonResponseModel model = CommonResponseModel.fromJson(
        response.data is Map<String, dynamic>
            ? response.data as Map<String, dynamic>
            : <String, dynamic>{'success': true},
      );
      return Right<Failure, CommonResponseModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] deleteAttachment DioException: ${e.message}');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] deleteAttachment error: $e');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }
}
