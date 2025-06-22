import 'package:burzakh/features/new_ui/chat/data/datasource/chat_datasource.dart';
import 'package:burzakh/features/new_ui/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ChatRepositoryImp extends ChatRepository{
  final ChatDatasource datasource;
  ChatRepositoryImp({required this.datasource});

  @override
  Future<Either<String,http.Response>> sendChat({required String id,required String userId,required String adminType,required String message}){
    return datasource.sendChat(id: id, userId: userId, adminType: adminType, message: message);
  }
  @override
  Future<Either<String,http.Response>> receiveChat({required String id,required String userId,}){
    return datasource.receiveChat(id: id, userId: userId);
  }
}