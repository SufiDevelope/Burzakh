// ignore_for_file: must_be_immutable

import 'package:burzakh/core/extensions/show_message.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable{
@override
  List<Object?> get props => [];
}

class AuthenticationInit extends AuthenticationState{}
class AuthenticationLoading extends AuthenticationState{}
class AuthenticationLoaded extends AuthenticationState{}
class AuthenticationError extends AuthenticationState{}
