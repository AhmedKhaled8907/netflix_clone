import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/error/failure.dart';

abstract class Usecase<T, Param> {
  Future<Either<Failure, T>> call(Param? param);
}

class NoParams {
  const NoParams();
}
