
import 'package:dartz/dartz.dart';
import '../../data/model/cda_model.dart';
import '../../data/model/rta_model.dart';
import '../repository/repository.dart';
import 'package:http/http.dart';

class EmiratiUseCase{
  final EmiratiRepository repository;
  EmiratiUseCase({required this.repository});

  Future<Either<String, Response>> uploadCda({required CdaModel model})async {
    return repository.uploadCda(model: model);
  }
  Future<Either<String,Response>> getCda({required String userId})async {
    return repository.getCda(userId: userId);
  }
  Future<Either<String,Response>> getRta({required String userId})async {
    return repository.getRta(userId: userId);
  }

  Future<Either<String, Response>> uploadRta({required RtaModel model})async {
    return repository.uploadRta(model: model);
  }

  Future<Either<String,Response>> cancelCda({required String id,required String userId,})async {
    return repository.cancelCda(id: id, userId: userId);
  }

  Future<Either<String,Response>> cancelRta({required String id,required String userId,})async {
    return repository.cancelRta(id: id, userId: userId);
  }

}
