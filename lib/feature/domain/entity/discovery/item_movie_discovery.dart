import 'package:equatable/equatable.dart';

class ItemMovieDiscovery extends Equatable {
  final int id;
  final String overview;
  final String posterPath;
  final String title;

  ItemMovieDiscovery({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object> get props => [id, overview, posterPath, title];
}
