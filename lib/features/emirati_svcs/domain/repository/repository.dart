import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../data/model/cda_model.dart';
import '../../data/model/rta_model.dart';

abstract class EmiratiRepository{
  Future<Either<String,Response>> uploadCda({required CdaModel model});
  Future<Either<String,Response>> getCda({required String userId});
  Future<Either<String,Response>> getRta({required String userId});
  Future<Either<String,Response>> uploadRta({required RtaModel model});

  Future<Either<String,Response>> cancelCda({required String id,required String userId,});
  Future<Either<String,Response>> cancelRta({required String id,required String userId,});
}