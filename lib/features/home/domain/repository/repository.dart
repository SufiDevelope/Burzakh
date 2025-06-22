import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../data/model/document_upload_model.dart';
import '../../data/model/graveyard_model.dart';

abstract class DocumentRepo {
  Future<Either<String, http.Response>> uploadDocument(
      {required DocumentUploadModel model});
  Future<Either<String, http.Response>> uploadGraveyardApproval(
      {required GraveyardModel model});
  Future<Either<String, http.Response>> getCases({required String userId});
  Future<Either<String, http.Response>> caseDetail(
      {required String userId, required String caseId});
  Future<Either<String, http.Response>> recentActivity(
      {required String userId});
  Future<Either<String, http.Response>> caseGraveyardDetail(
      {required String userId, required String caseId});
  Future<Either<String, http.Response>> uploadAdditionalDocuments(
      {required String userId, required String caseId, required File file});
}
