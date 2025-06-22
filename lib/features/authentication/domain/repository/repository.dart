import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../presentation/model/signup_model.dart';

abstract class AuthenticationRepository{
  Future<Either<String,Response>> signup({required SignUpModel model});
  Future<Either<String,Response>> login({required String email,required String password, required String deviceToken});
  Future<Either<String,Response>> resetPassword({required String email,required String password,required String confirmPassword});
  Future<Either<String,Response>> verifyOtp({required String email,required String otp});
  Future<Either<String,Response>> sendOtp({required String email});
}