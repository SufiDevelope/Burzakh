import 'package:burzakh/features/translation/data/datasource/datasource.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends DataSourceTranslation{
  final DataSourceTranslation dataSourceTranslation;
  RepositoryImpl({required this.dataSourceTranslation});


  @override
  Future<Either<String, bool>> function1() {
    return dataSourceTranslation.function1();
  }

}