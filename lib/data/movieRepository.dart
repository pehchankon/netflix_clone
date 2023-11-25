import 'apiClient.dart';
import '../models/movie.model.dart';

class MovieRepository {
  final ApiClient apiClient;

  MovieRepository(this.apiClient);

  Future<List<Movie>> fetchAllMovies() async {
    final data =
        await apiClient.fetchData('search/shows?q=all') as List<dynamic>;
    List<Movie> movies = [];
    for (var movieJson in data) {
      movies.add(Movie.fromJson(movieJson['show']));
    }
    return movies;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final data =
        await apiClient.fetchData('search/shows?q=$query') as List<dynamic>;
    List<Movie> movies = [];
    for (var movieJson in data) {
      movies.add(Movie.fromJson(movieJson['show']));
    }
    return movies;
  }
}
