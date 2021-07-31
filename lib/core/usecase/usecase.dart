import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> invoke(Params params);
}

class NoParams extends Equatable {

  @override
  List<Object> get props => [];
}