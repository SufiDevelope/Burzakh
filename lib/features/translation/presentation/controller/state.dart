import 'package:equatable/equatable.dart';

abstract class TranslationState extends Equatable{
@override // TODO: implement props
  List<Object?> get props => [];
}

class TranslationInit extends TranslationState{}
class TranslationLoading extends TranslationState{}
class TranslationLoaded extends TranslationState{}
class TranslationError extends TranslationState{}
