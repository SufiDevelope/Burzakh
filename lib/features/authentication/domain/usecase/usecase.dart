
import 'package:burzakh/features/authentication/presentation/model/signup_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../repository/repository.dart';

class AuthenticationUseCase{
  final AuthenticationRepository repository;
  AuthenticationUseCase({required this.repository});

  Future<Either<String, Response>> signup({required SignUpModel model})async {
    return repository.signup(model: model);
  }


  Future<Either<String,Response>> login({required String email,required String password, required String deviceToken})async{
    return repository.login(email: email, password: password, deviceToken: deviceToken);
  }

  Future<Either<String,Response>> resetPassword({required String email,required String password,required String confirmPassword})async{
    return repository.resetPassword(confirmPassword: confirmPassword,email: email, password: password);
  }


  Future<Either<String,Response>> verifyOtp({required String email,required String otp})async{
    return repository.verifyOtp(email: email, otp: otp);
  }

  Future<Either<String,Response>> sendOtp({required String email})async{
    return repository.sendOtp(email: email);
  }

}
