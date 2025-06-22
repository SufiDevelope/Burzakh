import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/core/extensions/dart_extensions.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/chat/cubit/chat_state.dart';
import 'package:burzakh/features/new_ui/chat/domain/usecase/chat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/chat_model.dart';

class ChatCubit extends Cubit<ChatState>{
  final ChatUsecase usecase;
  final AuthenticationCubit authenticationCubit;
  ChatCubit({required this.usecase,required this.authenticationCubit}):super(ChatInit());


  bool isSendingMessage=false;
  bool isLoadingChat=false;

  List<ChatModel> chatList=[];

  void isSendingMessageLoading(bool val){
    emit(ChatLoading());
    isSendingMessage=val;
    emit(ChatLoaded());

  }

  emptyChatList(){
    emit(ChatLoading());
    chatList=[];
    emit(ChatLoaded());
  }
  void isLoadingChatLoading(bool val){
    emit(ChatLoading());
    isLoadingChat=val;
    emit(ChatLoaded());

  }

  Future<String> sendChat(String id,String adminType, String message)async{
    isSendingMessageLoading(true);
    emit(ChatLoading());
   var response=await usecase.sendChat(id: id, userId: authenticationCubit.userModel!.id.toString(), adminType: adminType, message: message);
   if(response is Left){
     showMessage(response.asLeft(),isError: true);
     isSendingMessageLoading(false);
     emit(ChatLoaded());
     return "400";
   }else{
     var data=response.asRight();
     if(data.statusCode>=200&&data.statusCode<=300){
       log("83624  ${data.body}");
       isSendingMessageLoading(false);
       emit(ChatLoaded());
       return "200";
     }else{
       var value=jsonDecode(data.body);
       showMessage('${value['errors']}',isError: true);
       isSendingMessageLoading(false);
       emit(ChatLoaded());
       return "400";
     }
   }

  }

  Future<String>  receiveChat({required String id,bool isFirstTime=false})async{
    if(isFirstTime){
      chatList=[];
      isLoadingChatLoading(true);
    }
    log("398274 $isFirstTime");

    emit(ChatLoading());
    var response=await usecase.receiveChat(id: id, userId: authenticationCubit.userModel!.id.toString(),);
    if(response is Left){
      showMessage(response.asLeft(),isError: true);
      if(isFirstTime){
        isLoadingChatLoading(false);
      }
      emit(ChatLoaded());
      return '400';
    }else{
      var data=response.asRight();
      if(data.statusCode>=200&&data.statusCode<=300){
        var value=jsonDecode(data.body);
        var messageList=value['data'];
        if(messageList is List){
          chatList=messageList.map((e) => ChatModel.fromJson(e),).toList();
        }
        isLoadingChatLoading(false);
        emit(ChatLoaded());

        return '200';
      }else{
        var value=jsonDecode(data.body);
        showMessage('${value['errors']}',isError: true);
        if(isFirstTime){
          isLoadingChatLoading(false);
        }
        emit(ChatLoaded());
        return '400';
      }
    }


  }



}