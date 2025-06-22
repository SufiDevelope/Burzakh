
import 'package:dartz/dartz.dart';
import '../repository/repository.dart';

class UseCaseTranslation{
  final RepositoryTranslation repository;
  UseCaseTranslation({required this.repository});

  Future<Either<String, bool>> function1()async {
    return repository.function1();
  }

}
