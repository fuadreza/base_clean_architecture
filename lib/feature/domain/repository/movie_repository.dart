import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/feature/domain/entity/discovery/item_movie_discovery.dart';
import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';
import 'package:either_dart/either.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieGenre>>> getMovieGenres();

  Future<Either<Failure, List<ItemMovieDiscovery>>> getMoviesDiscovery(String genreId);
}