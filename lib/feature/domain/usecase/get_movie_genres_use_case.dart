import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/core/usecase/usecase.dart';
import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';
import 'package:base_clean_architecture/feature/domain/repository/movie_repository.dart';
import 'package:either_dart/src/either.dart';

class GetMovieGenresUseCase implements UseCase<NoParams, List<MovieGenre>> {
  final MovieRepository repository;

  GetMovieGenresUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MovieGenre>>> invoke(NoParams params) async {
    return await repository.getMovieGenres();
  }
}
