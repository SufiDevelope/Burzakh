import 'package:burzakh/features/new_ui/chat/domain/repository/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ChatUsecase{

 final ChatRepository chatRepository;
 ChatUsecase({required this.chatRepository});

  Future<Either<String,http.Response>> sendChat({required String id,required String userId,required String adminType,required String message}){
    return chatRepository.sendChat(id: id, userId: userId, adminType: adminType, message: message);
  }

 Future<Either<String,http.Response>> receiveChat({required String id,required String userId,}){
    return chatRepository.receiveChat(id: id, userId: userId);
  }

}