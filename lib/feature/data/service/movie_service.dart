import 'package:base_clean_architecture/core/network/base_api_client.dart';

class MovieService {
  final BaseApiClient apiClient;
  final String apiKey = 'ef2b66099a63d242660e26a77cd29a6b';

  MovieService({required this.apiClient});

  Future<String> getMovieGenres() async {
    final url = '/3/genre/movie/list';
    final params = {
      'api_key': apiKey,
    };
    return apiClient.get(url: url, params: params);
  }

  Future<String> getMoviesDiscovery(String genreId) async {
    final url = '/3/discover/movie';
    final params = {
      'api_key': apiKey,
      'with_genres': genreId
    };
    return apiClient.get(url: url, params: params);
  }
}