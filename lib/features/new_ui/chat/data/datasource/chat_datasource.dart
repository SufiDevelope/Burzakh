import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/constants/app_apis.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


abstract class ChatDatasource{
  Future<Either<String,http.Response>> sendChat({required String id,required String userId,required String adminType,required String message});
  Future<Either<String,http.Response>> receiveChat({required String id,required String userId,});
}

class UserChat extends ChatDatasource{
  Future<Either<String,http.Response>> sendChat({required String id,required String userId,required String adminType,required String message})async{

    try{
      String url="${AppApis.baseUrl}${AppApis.sendChat(id: id)}";
      final body={
        'user_id':userId,
        'admin_type':adminType,
        'message':message,
      };
      var json=jsonEncode(body);
      var respo=await http.post(Uri.parse(url),body: jsonEncode(body),headers: {'Content-Type': 'application/json'},);
      return Right(respo);
    }catch(e){
      return Left("$e");
    }
  }
  Future<Either<String,http.Response>> receiveChat({required String id,required String userId,})async{

    try{
      String url="${AppApis.baseUrl}${AppApis.recieveChat(id: id)}/$userId/$id";
      var respo=await http.get(Uri.parse(url));
      return Right(respo);
    }catch(e){
      return Left("$e");
    }
  }

}