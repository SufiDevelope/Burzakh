
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';


import '../../domain/repository/repository.dart';
import '../model/cda_model.dart';
import '../datasource/datasource.dart';
import '../model/rta_model.dart';

class EmiratiRepositoryImpl extends EmiratiRepository{
  final EmiratiDataSource dataSourceName;
  EmiratiRepositoryImpl({required this.dataSourceName});


  @override
  Future<Either<String,Response>> uploadCda({required CdaModel model}) {
    return dataSourceName.uploadCda(model: model);
  }
  @override
  Future<Either<String,Response>> getCda({required String userId}) {
    return dataSourceName.getCda(userId: userId);
  }
  @override
  Future<Either<String,Response>> getRta({required String userId}){
    return dataSourceName.getRta(userId: userId);
  }

  @override
  Future<Either<String,Response>> uploadRta({required RtaModel model}) {
    return dataSourceName.uploadRta(model: model);
  }

  @override
  Future<Either<String,Response>> cancelRta({required String id,required String userId,}) {
    return dataSourceName.cancelRta(userId: userId,id: id);
  }

  @override
  Future<Either<String,Response>> cancelCda({required String id,required String userId,}) {
    return dataSourceName.cancelCda(id: id, userId: userId);
  }

}