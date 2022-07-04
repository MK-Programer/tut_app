import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
