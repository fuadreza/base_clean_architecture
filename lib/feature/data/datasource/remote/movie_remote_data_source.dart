
import 'package:base_clean_architecture/feature/data/response/movie_genre_dto.dart';

abstract class MovieRemoteDataSource {
  Future<MovieGenreDto> getMovieGenres();
}