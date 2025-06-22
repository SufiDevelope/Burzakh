import 'package:burzakh/core/extensions/dart_extensions.dart';
import '../../domain/usecase/usecase.dart';
import 'package:burzakh/features/translation/presentation/controller/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Translation extends Cubit<TranslationState> {
  final UseCaseTranslation _useCaseTranslation;
  Translation(this._useCaseTranslation) : super(TranslationInit());


  bool? isNewUser;
  Future<void> checkNewUser()async{
    emit(TranslationInit());
    var response=await _useCaseTranslation.function1();
    if(response.isRight()){
      isNewUser= response.asRight();
      emit(TranslationLoaded());
    }else{
      emit(TranslationError());
    }

  }
}
