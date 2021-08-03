
import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/core/usecase/usecase.dart';
import 'package:base_clean_architecture/feature/domain/entity/discovery/item_movie_discovery.dart';
import 'package:base_clean_architecture/feature/domain/repository/movie_repository.dart';
import 'package:either_dart/src/either.dart';

class GetMoviesDiscoveryByGenreUseCase implements UseCase<String, List<ItemMovieDiscovery>> {
  final MovieRepository repository;

  GetMoviesDiscoveryByGenreUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ItemMovieDiscovery>>> invoke(String params) async {
    return await repository.getMoviesDiscovery(params);
  }
}