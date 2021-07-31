

import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';
import 'package:either_dart/either.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieGenre>>> getMovieGenres();
}