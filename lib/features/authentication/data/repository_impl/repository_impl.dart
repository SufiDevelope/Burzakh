import 'package:burzakh/features/splash/data/datasource/datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../domain/repository/repository.dart';
import '../../presentation/model/signup_model.dart';
import '../datasource/datasource.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{
  final AuthenticationDataSource dataSourceName;
  AuthenticationRepositoryImpl({required this.dataSourceName});


  @override
  Future<Either<String, Response>> signup({required SignUpModel model}) {
    return dataSourceName.signup(model:model);
  }

  @override
  Future<Either<String,Response>> login({required String email,required String password, required String deviceToken})async{
    return dataSourceName.login(email: email, password: password, deviceToken: deviceToken);
  }



  @override
  Future<Either<String,Response>> resetPassword({required String email,required String password,required String confirmPassword})async{
    return dataSourceName.resetPassword(email: email, password: password,confirmPassword: confirmPassword);
  }


  @override
  Future<Either<String,Response>> verifyOtp({required String email,required String otp})async{
    return dataSourceName.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<Either<String,Response>> sendOtp({required String email})async{
    return dataSourceName.sendOtp(email: email);
  }

}