import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/core/usecase/usecase.dart';
import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';
import 'package:base_clean_architecture/feature/domain/usecase/get_movie_genres_use_case.dart';
import 'package:base_clean_architecture/feature/presentation/bloc/movie_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGenreCubit extends Cubit<MovieState> {
  final GetMovieGenresUseCase getMovieGenresUseCase;

  MovieGenreCubit({required this.getMovieGenresUseCase}) : super(Init());

  Future<void> getMovieGenres() async {
    emit(Loading());
    final failureOrMovieGenres = await getMovieGenresUseCase.invoke(NoParams());
    _eitherLoadedOrErrorState(failureOrMovieGenres);
  }

  Future<void> _eitherLoadedOrErrorState(
    Either<Failure, List<MovieGenre>> failureOrMovieGenres,
  ) async {
    emit(failureOrMovieGenres.fold(
      (failure) => Error(message: 'Cannot load Movie Genres'),
      (movieGenres) => Loaded(data: movieGenres),
    ));
  }
}
