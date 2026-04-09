import 'package:cdp_team_support_sdk/src/data/api/dio_client.dart';
import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/api/endpoints.dart';
import 'package:cdp_team_support_sdk/src/data/api/typedef.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/common_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_comment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class CommentRepo {
  ResultFuture<List<HelpdeskCommentModel>> getComments({
    required final int ticketId,
  });

  ResultFuture<CommonResponseModel> addOrUpdateComment({
    required final int ticketId,
    required final String commentText,

    /// Non-null when editing an existing comment.
    final int? commentId,

    /// Non-null when posting a reply to another comment.
    final int? parentCommentId,
  });

  ResultFuture<CommonResponseModel> deleteComment({
    required final int commentId,
  });
}

class CommentRepoImp implements CommentRepo {
  CommentRepoImp({final DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  final DioClient _dioClient;

  @override
  ResultFuture<List<HelpdeskCommentModel>> getComments({
    required final int ticketId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getHelpdeskComments(ticketId: ticketId),
      );
      return Right<Failure, List<HelpdeskCommentModel>>(
        HelpdeskCommentModel.fromJsonList(response.data),
      );
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getComments DioException: ${e.message}');
      return Left<Failure, List<HelpdeskCommentModel>>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getComments error: $e');
      return Left<Failure, List<HelpdeskCommentModel>>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<CommonResponseModel> addOrUpdateComment({
    required final int ticketId,
    required final String commentText,
    final int? commentId,
    final int? parentCommentId,
  }) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        'ticketId': ticketId,
        'commentId': commentId ?? 0,
        'commentText': commentText,
        if (parentCommentId != null) 'parentCommentId': parentCommentId,
      };
      final Response<dynamic> response = await _dioClient.post(
        SupportEndpoints.addOrUpdateHelpdeskComment,
        data: body,
      );
      final CommonResponseModel model = CommonResponseModel.fromJson(
        response.data is Map<String, dynamic>
            ? response.data as Map<String, dynamic>
            : <String, dynamic>{'success': true},
      );
      return Right<Failure, CommonResponseModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] addOrUpdateComment DioException: ${e.message}');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] addOrUpdateComment error: $e');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<CommonResponseModel> deleteComment({
    required final int commentId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.delete(
        SupportEndpoints.deleteHelpdeskComment(commentId: commentId),
      );
      final CommonResponseModel model = CommonResponseModel.fromJson(
        response.data is Map<String, dynamic>
            ? response.data as Map<String, dynamic>
            : <String, dynamic>{'success': true},
      );
      return Right<Failure, CommonResponseModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] deleteComment DioException: ${e.message}');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] deleteComment error: $e');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }
}
