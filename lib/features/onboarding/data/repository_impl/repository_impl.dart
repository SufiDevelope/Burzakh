import 'package:burzakh/features/splash/data/datasource/datasource.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends DataSourceName{
  final DataSourceName dataSourceName;
  RepositoryImpl({required this.dataSourceName});


  @override
  Future<Either<String, bool>> function1() {
    return dataSourceName.function1();
  }

}