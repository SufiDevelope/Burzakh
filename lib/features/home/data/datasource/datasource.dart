import 'dart:developer';
import 'dart:io';

import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/features/home/data/model/document_upload_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../model/graveyard_model.dart';

abstract class DocumentDataSource {
  Future<Either<String, http.Response>> uploadDocument(
      {required DocumentUploadModel model});
  Future<Either<String, http.Response>> uploadGraveyardApproval(
      {required GraveyardModel model});
  Future<Either<String, http.Response>> getCases({required String userId});
  Future<Either<String, http.Response>> recentActivity(
      {required String userId});
  Future<Either<String, http.Response>> caseDetail(
      {required String userId, required String caseId});
  Future<Either<String, http.Response>> caseGraveyardDetail(
      {required String userId, required String caseId});
  Future<Either<String, http.Response>> uploadAdditionalDocuments(
      {required String userId, required String caseId, required File file});
}

class DocumentProcess extends DocumentDataSource {
  // function
  // Future<Either<String, http.Response>> uploadDocument({required DocumentUploadModel model})async{
  //   try{
  //     String url = "${AppApis.baseUrl}${AppApis.documentSubmission}";
  //     Uri uri = Uri.parse(url);
  //     var request=await http.MultipartRequest("POST", uri);
  //     request.fields['user_id']=model.userId;
  //     request.fields['resting_place']=model.restingPlace;
  //     request.files.add(await http.MultipartFile.fromPath('death_notification_file', model.deathNotificationFile.path,filename:model.deathNotificationFile.path ));
  //     request.files.add(await http.MultipartFile.fromPath('passport_or_emirate_id_front', model.passportOrEmirateIdFront.path,filename:model.deathNotificationFile.path ));
  //     request.files.add(await http.MultipartFile.fromPath('passport_or_emirate_id_back', model.passportOrEmirateIdBack.path,filename:model.deathNotificationFile.path ));
  //     request.files.add(await http.MultipartFile.fromPath('hospital_certificate', model.hospitalCertification.path,filename:model.deathNotificationFile.path ));

  //     var response=await request.send();
  //     var result=await http.Response.fromStream(response);
  //     return Right(result);
  //   }catch(e){
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, http.Response>> uploadDocument(
      {required DocumentUploadModel model}) async {
    try {
      String url = "${AppApis.baseUrl}${AppApis.documentSubmission}";
      Uri uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);

      // Add form fields
      request.fields['user_id'] = model.userId;
      request.fields['resting_place'] = model.restingPlace;
      request.fields['name_of_deceased'] = model.nameofdeceased;
      request.fields['cause_of_death'] = model.causeofdeath;
      request.fields['date_of_death'] = model.dateofdeath;
      request.fields['location'] = model.locationofdeath;

      // Add files
      request.files.add(await http.MultipartFile.fromPath(
        'death_notification_file',
        model.deathNotificationFile.path,
        filename: model.deathNotificationFile.path.split('/').last,
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'passport_or_emirate_id_front',
        model.passportOrEmirateIdFront.path,
        filename: model.passportOrEmirateIdFront.path.split('/').last,
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'passport_or_emirate_id_back',
        model.passportOrEmirateIdBack.path,
        filename: model.passportOrEmirateIdBack.path.split('/').last,
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'hospital_certificate',
        model.hospitalCertification.path,
        filename: model.hospitalCertification.path.split('/').last,
      ));

      var response = await request.send();
      var result = await http.Response.fromStream(response);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // function
  Future<Either<String, http.Response>> uploadGraveyardApproval(
      {required GraveyardModel model}) async {
    try {
      log("243689 ${model.caseId}");
      String url = "${AppApis.baseUrl}${AppApis.graveSupervisorSubmission}";
      Uri uri = Uri.parse(url);
      var request = await http.MultipartRequest("POST", uri);
      request.fields['user_id'] = model.userId;
      request.fields['case_id'] = model.caseId;
      request.fields['preferred_cemetery'] = model.preferrredComm;
      request.fields['loved_one_city'] = model.lovedcitizen;
      request.fields['burial_timing'] = model.burialTiming;
      request.files.add(await http.MultipartFile.fromPath(
          'police_clearence_certificate', model.policeClearance.path,
          filename: model.policeClearance.path));
      var response = await request.send();
      var result = await http.Response.fromStream(response);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, http.Response>> getCases(
      {required String userId}) async {
    try {
      String url = "${AppApis.baseUrl}${AppApis.getCase}$userId";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, http.Response>> recentActivity(
      {required String userId}) async {
    try {
      String url = "${AppApis.baseUrl}${AppApis.recentActivity}$userId";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);

      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, http.Response>> caseDetail(
      {required String userId, required String caseId}) async {
    try {
      log("83462523  //${caseId}");
      String url =
          "${AppApis.baseUrl}${AppApis.caseDetail(userId: userId, caseId: caseId)}";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, http.Response>> caseGraveyardDetail(
      {required String userId, required String caseId}) async {
    try {
      String url =
          "${AppApis.baseUrl}${AppApis.caseGraveyardDetail(userId: userId, caseId: caseId)}";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, http.Response>> uploadAdditionalDocuments(
      {required String userId,
      required String caseId,
      required File file}) async {
    try {
      String url = AppApis.uploadAdditionalDoc(caseId);
      Uri uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      request.fields['user_id'] = userId;
      request.files.add(await http.MultipartFile.fromPath(
        'additional_document_upload_user',
        file.path,
        filename: file.path.split('/').last,
      ));
      var response = await request.send();
      var result = await http.Response.fromStream(response);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
