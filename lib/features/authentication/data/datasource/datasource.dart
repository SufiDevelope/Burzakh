import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/constants/app_apis.dart';
import 'package:burzakh/features/authentication/presentation/model/signup_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationDataSource{
  Future<Either<String,http.Response>> signup({required SignUpModel model});
  Future<Either<String,http.Response>> login({required String email,required String password, required String deviceToken});
  Future<Either<String,http.Response>> resetPassword({required String email,required String password,required String confirmPassword});
  Future<Either<String,http.Response>> verifyOtp({required String email,required String otp});
  Future<Either<String,http.Response>> sendOtp({required String email});
}


class SignUpFunctions extends AuthenticationDataSource{

  // function
  Future<Either<String, http.Response>> signup({required SignUpModel model})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.register}";
      Uri uri=Uri.parse(url);
      var request=http.MultipartRequest("POST", uri);

      request.files.add(await http.MultipartFile.fromPath('passport_copy', model.passportCopy.path,filename: model.passportCopy.path));
      if(model.marsoom!=null){
        request.files.add(await http.MultipartFile.fromPath('marsoom',model.marsoom!.path,filename: model.marsoom!.path));
      }
      if(model.uaePass!=null){
        request.files.add(await http.MultipartFile.fromPath('uae_pass',model.uaePass!.path,filename: model.uaePass!.path));
      }

      request.fields['first_name']=model.firstName;
      request.fields['last_name']=model.lastName;
      request.fields['email']=model.email;
      request.fields['phone_number']=model.phoneNumber;
      request.fields['password']=model.password;
      request.fields['password_confirmation']=model.confirmPassword;
      request.fields['device_token']=model.deviceToken;

      var response=await request.send();
      var result=await http.Response.fromStream(response);
      log("478238 ${result.body}");

      return Right(result);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,http.Response>> login({required String email,required String password, required String deviceToken})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.login}";
      Uri uri=Uri.parse(url);
      var request=http.MultipartRequest("POST", uri);

      request.fields['login']=email;
      request.fields['password']=password;
      request.fields['device_token']=deviceToken;

      var response=await request.send();
      var result=await http.Response.fromStream(response);
      return Right(result);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,http.Response>> resetPassword({required String email,required String password,required String confirmPassword})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.resetPassword}";
      Uri uri=Uri.parse(url);
      var request=http.MultipartRequest("POST", uri);

      request.fields['email']=email;
      request.fields['password']=password;
      request.fields['password_confirmation']=confirmPassword;

      var response=await request.send();
      var result=await http.Response.fromStream(response);
      return Right(result);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,http.Response>> verifyOtp({required String email,required String otp})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.verifyOtp}";
      Uri uri=Uri.parse(url);
      var request=http.MultipartRequest("POST", uri);

      request.fields['email']=email;
      request.fields['otp']=otp;

      var response=await request.send();
      var result=await http.Response.fromStream(response);
      return Right(result);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,http.Response>> sendOtp({required String email})async{
    try{
      String url="${AppApis.baseUrl}${AppApis.sendOtp}";
      Uri uri=Uri.parse(url);
      var request=http.MultipartRequest("POST", uri);

      request.fields['email']=email;

      var response=await request.send();
      var result=await http.Response.fromStream(response);
      return Right(result);
    }catch(e){
      return Left(e.toString());
    }
  }

}