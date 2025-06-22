import 'dart:io';

import 'package:burzakh/features/home/data/datasource/datasource.dart';
import 'package:burzakh/features/splash/data/datasource/datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../domain/repository/repository.dart';
import '../model/document_upload_model.dart';
import '../model/graveyard_model.dart';

class DocumentRepoImpl extends DocumentRepo{
  final DocumentDataSource dataSourceName;
  DocumentRepoImpl({required this.dataSourceName});


  @override
  Future<Either<String,http.Response>> uploadDocument({required DocumentUploadModel model}){
    return dataSourceName.uploadDocument(model: model);
  }

  @override
  Future<Either<String,http.Response>> getCases({required String userId}){
    return dataSourceName.getCases(userId: userId);
  }

  @override
  Future<Either<String,http.Response>> recentActivity({required String userId}){
    return dataSourceName.recentActivity(userId: userId);
  }

  @override
  Future<Either<String, http.Response>> caseDetail({required String userId,required String caseId}){
    return dataSourceName.caseDetail(userId: userId, caseId: caseId);
  }

  @override
  Future<Either<String, http.Response>> caseGraveyardDetail({required String userId,required String caseId}){
    return dataSourceName.caseGraveyardDetail(userId: userId, caseId: caseId);
  }

  @override
  Future<Either<String,http.Response>> uploadGraveyardApproval({required GraveyardModel model}){
    return dataSourceName.uploadGraveyardApproval(model: model);
  }

  @override
  Future<Either<String, http.Response>> uploadAdditionalDocuments({required String userId, required String caseId, required File file}) {
    return dataSourceName.uploadAdditionalDocuments(userId: userId, caseId: caseId, file: file);
  }


}