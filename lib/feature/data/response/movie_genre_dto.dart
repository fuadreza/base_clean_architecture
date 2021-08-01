import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';

class MovieGenreDto {
  final List<MovieGenre> genres;

  MovieGenreDto({required this.genres});

  factory MovieGenreDto.fromJson(Map<String, dynamic> json) {
    return MovieGenreDto(genres: parseMovieGenres(json['genres']));
  }

  static List<MovieGenre> parseMovieGenres(json) {
    var list = json as List;
    List<MovieGenre> movieGenres =
        list.map((data) => MovieGenreModel.toMovieGenre(MovieGenreModel.fromJson(data))).toList();
    return movieGenres;
  }
}

class MovieGenreModel extends MovieGenre {
  final int id;
  final String name;

  MovieGenreModel({required this.id, required this.name}) : super(id: id, name: name);

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) {
    return MovieGenreModel(id: json['id'], name: json['name']);
  }

  static MovieGenre toMovieGenre(MovieGenreModel input) {
    return MovieGenre(id: input.id, name: input.name);
  }
}
