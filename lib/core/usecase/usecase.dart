import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Params, Type> {
  Future<Either<Failure, Type>> invoke(Params params);
}

class NoParams extends Equatable {

  @override
  List<Object> get props => [];
}