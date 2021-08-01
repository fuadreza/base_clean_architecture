import 'package:base_clean_architecture/core/network/base_api_client.dart';
import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source.dart';
import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source_impl.dart';
import 'package:base_clean_architecture/feature/data/repository/movie_repository_impl.dart';
import 'package:base_clean_architecture/feature/data/service/movie_service.dart';
import 'package:base_clean_architecture/feature/domain/repository/movie_repository.dart';
import 'package:base_clean_architecture/feature/domain/usecase/get_movie_genres_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final gi = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  // gi.registerFactory(
  //       () => NumberTriviaBloc(
  //     concrete: gi(),
  //     inputConverter: gi(),
  //     random: gi(),
  //   ),
  // );

  // Use cases
  gi.registerLazySingleton(
    () => GetMovieGenresUseCase(
      repository: gi(),
    ),
  );

  // Repositories
  gi.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: gi(),
    ),
  );

  // Data sources
  gi.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      movieService: gi(),
    ),
  );

  // Services
  gi.registerLazySingleton<MovieService>(
    () => MovieService(
      apiClient: gi(),
    ),
  );

  //! Core
  gi.registerLazySingleton<BaseApiClient>(
    () => BaseApiClient(
      client: gi(),
    ),
  );

  //! External
  gi.registerLazySingleton(() => http.Client());
}
