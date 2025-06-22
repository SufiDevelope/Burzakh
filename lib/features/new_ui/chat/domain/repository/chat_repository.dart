import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
abstract class ChatRepository{
  Future<Either<String,http.Response>> sendChat({required String id,required String userId,required String adminType,required String message});
  Future<Either<String,http.Response>> receiveChat({required String id,required String userId,});

}