import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ChatInit extends ChatState{}
class ChatLoading extends ChatState{}
class ChatLoaded extends ChatState{}
class ChatError extends ChatState{}

