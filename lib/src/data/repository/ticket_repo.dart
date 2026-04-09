import 'package:cdp_team_support_sdk/src/data/api/dio_client.dart';
import 'package:cdp_team_support_sdk/src/data/api/either.dart';
import 'package:cdp_team_support_sdk/src/data/api/endpoints.dart';
import 'package:cdp_team_support_sdk/src/data/api/typedef.dart';
import 'package:cdp_team_support_sdk/src/data/errors/failure.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/common_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_detail_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_list_response_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/helpdesk_ticket_status_model.dart';
import 'package:cdp_team_support_sdk/src/data/models/response/ticket_dashboard_counts_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class TicketRepo {
  ResultFuture<TicketDashboardCountsModel> getDashboardCounts();

  ResultFuture<List<HelpdeskTicketStatusModel>> getTicketStatuses();

  ResultFuture<HelpdeskTicketListResponseModel> getMyTickets({
    required final int pageNumber,
    required final int pageSize,
    final String? statusCode,
    final String? search,
  });

  ResultFuture<HelpdeskTicketDetailModel> getTicketDetail({
    required final int ticketId,
  });

  ResultFuture<CommonResponseModel> deleteTicket({
    required final int ticketId,
  });

  ResultFuture<CommonResponseModel> addOrUpdateTicket({
    required final String title,
    required final String description,
    required final int helpdeskProjectId,
    required final String projectName,
    required final String clientNote,

    /// Pass a non-null id when editing an existing ticket.
    final int? helpdeskTicketId,
  });
}

class TicketRepoImp implements TicketRepo {
  TicketRepoImp({final DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  final DioClient _dioClient;

  @override
  ResultFuture<TicketDashboardCountsModel> getDashboardCounts() async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getHelpdeskTicketDashboardCounts,
      );

      final TicketDashboardCountsModel model =
          TicketDashboardCountsModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right<Failure, TicketDashboardCountsModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getDashboardCounts DioException: ${e.message}');
      return Left<Failure, TicketDashboardCountsModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getDashboardCounts error: $e');
      return Left<Failure, TicketDashboardCountsModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<List<HelpdeskTicketStatusModel>> getTicketStatuses() async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getHelpdeskTicketStatuses,
      );

      final List<HelpdeskTicketStatusModel> statuses =
          HelpdeskTicketStatusModel.fromJsonList(response.data);
      return Right<Failure, List<HelpdeskTicketStatusModel>>(statuses);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getTicketStatuses DioException: ${e.message}');
      return Left<Failure, List<HelpdeskTicketStatusModel>>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getTicketStatuses error: $e');
      return Left<Failure, List<HelpdeskTicketStatusModel>>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<HelpdeskTicketListResponseModel> getMyTickets({
    required final int pageNumber,
    required final int pageSize,
    final String? statusCode,
    final String? search,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getMyHelpdeskTickets(
          pageNumber: pageNumber,
          pageSize: pageSize,
          status: statusCode,
          search: search,
        ),
      );

      final HelpdeskTicketListResponseModel model =
          HelpdeskTicketListResponseModel.fromJson(response.data);
      return Right<Failure, HelpdeskTicketListResponseModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getMyTickets DioException: ${e.message}');
      return Left<Failure, HelpdeskTicketListResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getMyTickets error: $e');
      return Left<Failure, HelpdeskTicketListResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<HelpdeskTicketDetailModel> getTicketDetail({
    required final int ticketId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.get(
        SupportEndpoints.getHelpdeskTicketDetail(ticketId: ticketId),
      );
      final HelpdeskTicketDetailModel model =
          HelpdeskTicketDetailModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right<Failure, HelpdeskTicketDetailModel>(model);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] getTicketDetail DioException: ${e.message}');
      return Left<Failure, HelpdeskTicketDetailModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] getTicketDetail error: $e');
      return Left<Failure, HelpdeskTicketDetailModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<CommonResponseModel> deleteTicket({
    required final int ticketId,
  }) async {
    try {
      final Response<dynamic> response = await _dioClient.delete(
        SupportEndpoints.deleteHelpdeskTicket(ticketId: ticketId),
      );
      final CommonResponseModel result = CommonResponseModel.fromJson(
        response.data is Map<String, dynamic>
            ? response.data as Map<String, dynamic>
            : <String, dynamic>{'success': true},
      );
      return Right<Failure, CommonResponseModel>(result);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] deleteTicket DioException: ${e.message}');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] deleteTicket error: $e');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }

  @override
  ResultFuture<CommonResponseModel> addOrUpdateTicket({
    required final String title,
    required final String description,
    required final int helpdeskProjectId,
    required final String projectName,
    required final String clientNote,
    final int? helpdeskTicketId,
  }) async {
    try {
      final Map<String, dynamic> body = <String, dynamic>{
        // API treats 0 as "create new"; any non-zero id is an update.
        'helpdeskTicketId': helpdeskTicketId ?? 0,
        'helpdeskProjectId': helpdeskProjectId,
        'title': title,
        'description': description,
        'projectName': projectName,
        'clientNote': clientNote,
      };

      final Response<dynamic> response = await _dioClient.post(
        SupportEndpoints.addOrUpdateHelpdeskTicket,
        data: body,
      );

      final CommonResponseModel result = CommonResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right<Failure, CommonResponseModel>(result);
    } on DioException catch (e) {
      debugPrint('[SupportSDK] addOrUpdateTicket DioException: ${e.message}');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.message, statusCode: e.response?.statusCode),
      );
    } catch (e) {
      debugPrint('[SupportSDK] addOrUpdateTicket error: $e');
      return Left<Failure, CommonResponseModel>(
        ApiFailure(message: e.toString()),
      );
    }
  }
}
