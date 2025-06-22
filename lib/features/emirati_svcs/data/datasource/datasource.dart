import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/constants/app_apis.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../model/cda_model.dart';
import '../model/rta_model.dart';

abstract class EmiratiDataSource{
  Future<Either<String,Response>> uploadCda({required CdaModel model});
  Future<Either<String,Response>> getCda({required String userId});
  Future<Either<String,Response>> getRta({required String userId});
  Future<Either<String,Response>> uploadRta({required RtaModel model});
  Future<Either<String,Response>> cancelCda({required String id,required String userId,});
  Future<Either<String,Response>> cancelRta({required String id,required String userId,});

}


class EmiratiFunctionClass extends EmiratiDataSource{

  // function
  Future<Either<String, Response>> uploadCda({required CdaModel model})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.cda}";
      Uri uri=Uri.parse(url);
      var response =await post(uri,body: model.toJson());
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,Response>> cancelCda({required String id,required String userId,})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.cancelCda}";
      var body={
        "submission_id":id,
        "user_id":userId
      };
      Uri uri=Uri.parse(url);
      var response =await post(uri,body: body);
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,Response>> cancelRta({required String id,required String userId,})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.cancelRta}";
      var body={
        "submission_id":id,
        "user_id":userId
      };
      Uri uri=Uri.parse(url);
      var response =await post(uri,body: body);
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }

  // function
  Future<Either<String,Response>> getCda({required String userId})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.getCda}/$userId";
      log("3829472 $url");
      Uri uri=Uri.parse(url);
      var response =await get(uri);
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }

  // function
  Future<Either<String,Response>> getRta({required String userId})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.getRta}/$userId";
      Uri uri=Uri.parse(url);
      var response =await get(uri);
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String, Response>> uploadRta({required RtaModel model})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.rta}";
      Uri uri=Uri.parse(url);
      var response =await post(uri,body: model.toJson());
      return Right(response);
    }catch(e){
      return Left(e.toString());
    }
  }
}