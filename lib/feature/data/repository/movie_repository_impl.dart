import 'package:base_clean_architecture/core/error/exceptions.dart';
import 'package:base_clean_architecture/core/error/failures.dart';
import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source.dart';
import 'package:base_clean_architecture/feature/data/response/movie_genre_dto.dart';
import 'package:base_clean_architecture/feature/domain/entity/genre/movie_genre.dart';
import 'package:base_clean_architecture/feature/domain/repository/movie_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/foundation.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({@required MovieRemoteDataSource this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieGenre>>> getMovieGenres() async{
    try {
      final MovieGenreDto apiResult = await remoteDataSource.getMovieGenres();
      return Right(apiResult.genres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
