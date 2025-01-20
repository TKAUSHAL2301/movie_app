class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = String.fromEnvironment('MOVIE_API_KEY');

  //Image
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  // Endpoints
  static const String trendingMovies = '/trending/movie/week';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String upcomingMovies = '/movie/upcoming';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String movieDetails = '/movie';
  static const String searchMovie = '/search/movie';
  static const String genres = '/genre/movie/list';
}
