class ChatModel{
  String message;
  String admin_type;
  String user_id;
  ChatModel({required this.message,required this.admin_type,required this.user_id});

 factory ChatModel.fromJson(Map<String,dynamic> map){
   return ChatModel(
       message: map['message'],
       admin_type: map['admin_type'],
       user_id: map['user_id']
   );
 }
}