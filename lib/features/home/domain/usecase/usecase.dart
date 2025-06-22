import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../data/model/document_upload_model.dart';
import '../../data/model/graveyard_model.dart';
import '../repository/repository.dart';
import 'package:http/http.dart' as http;

class DocumentUseCase {
  final DocumentRepo repository;
  DocumentUseCase({required this.repository});

  Future<Either<String, http.Response>> uploadDocument(
      {required DocumentUploadModel model}) {
    return repository.uploadDocument(model: model);
  }

  Future<Either<String, http.Response>> getCases({required String userId}) {
    return repository.getCases(userId: userId);
  }

  Future<Either<String, http.Response>> recentActivity(
      {required String userId}) {
    return repository.recentActivity(userId: userId);
  }

  Future<Either<String, http.Response>> caseDetail(
      {required String userId, required String caseId}) {
    return repository.caseDetail(userId: userId, caseId: caseId);
  }

  Future<Either<String, http.Response>> caseGraveyardDetail(
      {required String userId, required String caseId}) {
    return repository.caseGraveyardDetail(userId: userId, caseId: caseId);
  }

  Future<Either<String, http.Response>> uploadGraveyardApproval(
      {required GraveyardModel model}) {
    return repository.uploadGraveyardApproval(model: model);
  }

  Future<Either<String, http.Response>> uploadAdditionalDocument(
      {required caseId, required userId, required File file}) {
    return repository.uploadAdditionalDocuments(
        userId: userId, caseId: caseId, file: file);
  }
}
