import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/feature/domain/entity/discovery/item_movie_discovery.dart';
import 'package:base_clean_architecture/feature/domain/usecase/get_movies_discovery_by_genre_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_state.dart';

class MovieDiscoveryCubit extends Cubit<MovieState> {
  final GetMoviesDiscoveryByGenreUseCase getMoviesDiscoveryByGenreUseCase;

  MovieDiscoveryCubit({required this.getMoviesDiscoveryByGenreUseCase}) : super(Init());

  Future<void> getMoviesDiscoveryByGenre(String genreId) async {
    emit(Loading());
    final failureOrMoviesDiscovery = await getMoviesDiscoveryByGenreUseCase.invoke(genreId);
    _eitherLoadedOrErrorState(failureOrMoviesDiscovery);
  }

  Future<void> _eitherLoadedOrErrorState(
    Either<Failure, List<ItemMovieDiscovery>> failureOrMoviesDiscovery,
  ) async {
    emit(failureOrMoviesDiscovery.fold(
      (failure) => Error(message: 'Cannot load Movies'),
      (moviesDiscovery) => Loaded(data: moviesDiscovery),
    ));
  }
}
