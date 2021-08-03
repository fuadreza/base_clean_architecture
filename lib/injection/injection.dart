import 'package:base_clean_architecture/core/network/base_api_client.dart';
import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source.dart';
import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source_impl.dart';
import 'package:base_clean_architecture/feature/data/repository/movie_repository_impl.dart';
import 'package:base_clean_architecture/feature/data/service/movie_service.dart';
import 'package:base_clean_architecture/feature/domain/repository/movie_repository.dart';
import 'package:base_clean_architecture/feature/domain/usecase/get_movie_genres_use_case.dart';
import 'package:base_clean_architecture/feature/presentation/bloc/movie_genre_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final di = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc Cubit
  di.registerFactory(
        () => MovieGenreCubit(
      getMovieGenresUseCase: di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(
    () => GetMovieGenresUseCase(
      repository: di(),
    ),
  );

  // Repositories
  di.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      movieService: di(),
    ),
  );

  // Services
  di.registerLazySingleton<MovieService>(
    () => MovieService(
      apiClient: di(),
    ),
  );

  //! Core
  di.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: di(),
    ),
  );

  //! External
  di.registerLazySingleton(() => http.Client());
}
