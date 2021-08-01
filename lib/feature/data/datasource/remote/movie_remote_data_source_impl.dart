
import 'dart:convert';

import 'package:base_clean_architecture/feature/data/datasource/remote/movie_remote_data_source.dart';
import 'package:base_clean_architecture/feature/data/response/movie_genre_dto.dart';
import 'package:base_clean_architecture/feature/data/service/movie_service.dart';
import 'package:flutter/foundation.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final MovieService movieService;

  MovieRemoteDataSourceImpl({required this.movieService});

  @override
  Future<MovieGenreDto> getMovieGenres() async{
    final response = await movieService.getMovieGenres();
    return MovieGenreDto.fromJson(jsonDecode(response));
  }

}