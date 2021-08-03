

import 'package:base_clean_architecture/feature/domain/entity/discovery/item_movie_discovery.dart';

class MovieDiscoveryDto {
  final List<ItemMovieDiscovery> moviesDiscovery;

  MovieDiscoveryDto({required this.moviesDiscovery});

  factory MovieDiscoveryDto.fromJson(Map<String, dynamic> json) {
    return MovieDiscoveryDto(moviesDiscovery: parseMoviesDiscovery(json['results']));
  }

  static List<ItemMovieDiscovery> parseMoviesDiscovery(json){
    var list = json as List;
    List<ItemMovieDiscovery> movieDiscoveries =
        list.map((data) => MovieDiscoveryModel.toItemMovieDiscovery(MovieDiscoveryModel.fromJson(data))).toList();
    return movieDiscoveries;
  }
}

class MovieDiscoveryModel extends ItemMovieDiscovery {
  final int id;
  final String overview;
  final String posterPath;
  final String title;

  MovieDiscoveryModel({required this.id, required this.overview, required this.posterPath, required this.title}): super(id: id, overview: overview, posterPath: posterPath, title: title);

  factory MovieDiscoveryModel.fromJson(Map<String, dynamic> json) {
    return MovieDiscoveryModel(
      id: json['id'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      title: json['title']
    );
  }

  static ItemMovieDiscovery toItemMovieDiscovery(MovieDiscoveryModel input){
    return ItemMovieDiscovery(
      id: input.id,
      overview: input.overview,
      posterPath: input.posterPath,
      title: input.title
    );
  }
}