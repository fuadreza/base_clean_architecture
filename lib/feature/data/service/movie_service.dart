
import 'package:base_clean_architecture/core/network/base_api_client.dart';

class MovieService {
  final BaseApiClient apiClient;
  final String apiKey = 'ef2b66099a63d242660e26a77cd29a6b';

  MovieService({required this.apiClient});

  Future<String> getMovieGenres() async {
    final url = '/genre/movie/list';
    return apiClient.get(url: url, path: apiKey);
  }
}