
import 'package:get/get.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/features/movie_detail/view/movie_detail_view.dart';
import 'package:movie_app/features/movies/model/movies_model.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/services/hive_service.dart';

class MoviesController extends GetxController {
  final ApiService _apiService = Get.find();
  final HiveService _hiveService = Get.find();

  final RxList<MovieModel> _popularMovies = <MovieModel>[].obs;
  final RxList<MovieModel> _upcomingMovies = <MovieModel>[].obs;
  final RxList<MovieModel> _topRatedMovies = <MovieModel>[].obs;
  final RxList<MovieModel> _playingNowMovies = <MovieModel>[].obs;

  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;
  final RxString _error = ''.obs;

  final RxInt _popularPage = 1.obs;
  final RxInt _upcomingPage = 1.obs;
  final RxInt _topRatedPage = 1.obs;
  final RxInt _playingNowPage = 1.obs;
  final RxInt _currentIndex = 0.obs;

  int get playingNowPage => _playingNowPage.value;

  int get currentIndex => _currentIndex.value;

  List<MovieModel> get popularMovies => _popularMovies;

  List<MovieModel> get playingNowMovies => _playingNowMovies;

  List<MovieModel> get upcomingMovies => _upcomingMovies;

  List<MovieModel> get topRatedMovies => _topRatedMovies;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  String get error => _error.value;

  int get popularPage => _popularPage.value;

  int get upcomingPage => _upcomingPage.value;

  int get topRatedPage => _topRatedPage.value;

  set playingNowPage(int value) => _playingNowPage.value = value;

  set playingNowMovies(List<MovieModel> value) =>
      _playingNowMovies.value = value;

  set currentIndex(int value) => _currentIndex.value = value;

  set popularMovies(List<MovieModel> value) => _popularMovies.value = value;

  set upcomingMovies(List<MovieModel> value) => _upcomingMovies.value = value;

  set topRatedMovies(List<MovieModel> value) => _topRatedMovies.value = value;

  set isLoading(bool value) => _isLoading.value = value;

  set isLoadingMore(bool value) => _isLoadingMore.value = value;

  set error(String value) => _error.value = value;

  set popularPage(int value) => _popularPage.value = value;

  set upcomingPage(int value) => _upcomingPage.value = value;

  set topRatedPage(int value) => _topRatedPage.value = value;

  // Fetch Playing Now Movies
  Future<void> fetchPlayingNowMovies({bool loadMore = false}) async {
    if (!loadMore) {
      _isLoading.value = true;
      _playingNowPage.value = 1;
    } else {
      _isLoadingMore.value = true;
    }
    try {
      final movies =
          await _apiService.getPlayingNowMovies(page: _playingNowPage.value);

      if (loadMore) {
        _playingNowMovies.addAll(movies.data ?? []);
      } else {
        _playingNowMovies.value = movies.data ?? [];
      }

      _playingNowPage.value++;
    } catch (e) {
      _error.value = e.toString();
    }
  }

  // Fetch Top Rated Movies
  Future<void> fetchTopRatedMovies({bool loadMore = false}) async {
    if (!loadMore) {
      _isLoading.value = true;
      _topRatedPage.value = 1;
    } else {
      _isLoadingMore.value = true;
    }
    try {
      final movies =
          await _apiService.getTopRatedMovies(page: _topRatedPage.value);

      if (loadMore) {
        _topRatedMovies.addAll(movies.data ?? []);
      } else {
        _topRatedMovies.value = movies.data ?? [];
      }

      _topRatedPage.value++;
    } catch (e) {
      _error.value = e.toString();
    }
  }

  // Fetch Popular Movies
  Future<void> fetchPopularMovies({bool loadMore = false}) async {
    if (!loadMore) {
      _isLoading.value = true;
      _popularPage.value = 1;
    } else {
      _isLoadingMore.value = true;
    }
    try {
      final movies =
          await _apiService.getPopularMovies(page: _popularPage.value);

      if (loadMore) {
        _popularMovies.addAll(movies.data ?? []);
      } else {
        popularMovies = movies.data ?? [];
      }

      _popularPage.value++;
    } catch (e) {
      _error.value = e.toString();
    }
  }

  // Fetch Upcoming Movies
  Future<void> fetchUpcomingMovies({bool loadMore = false}) async {
    if (!loadMore) {
      _isLoading.value = true;
      _upcomingPage.value = 1;
    } else {
      _isLoadingMore.value = true;
    }

    try {
      final movies =
          await _apiService.getUpcomingMovies(page: _upcomingPage.value);

      if (loadMore) {
        _upcomingMovies.addAll(movies.data ?? []);
      } else {
        _upcomingMovies.value = movies.data ?? [];
      }

      _upcomingPage.value++;
    } catch (e) {
      _error.value = e.toString();
    }
  }

  // Fetch Movie Details
  Future<void> onTapMovie(MovieModel movie) async {
    try {
      _hiveService.addVisitedMovie(movie);
      Get.to(
          () => MovieDetailView(
              movieId: movie.id, movieImageUrl: movie.posterPath),
          transition: Transition.zoom);
    } catch (e) {
      _error.value = e.toString();
    }
  }

  Future<void> loadMoreMovies(String category) async {
    switch (category) {
      case AppConstants.playingNow:
        await fetchPlayingNowMovies(loadMore: true);
        break;
      case AppConstants.topRatedMovies:
        await fetchTopRatedMovies(loadMore: true);
        break;
      case AppConstants.popularMovies:
        await fetchPopularMovies(loadMore: true);
        break;
      case AppConstants.upcomingMovies:
        await fetchUpcomingMovies(loadMore: true);
        break;
    }
  }

  // Refresh Data
  Future<void> refreshData() async {
    _popularPage.value = 1;
    _upcomingPage.value = 1;
    loadInitialData();
  }

  void loadInitialData() async {
    await Future.wait([
      fetchPopularMovies(),
      fetchUpcomingMovies(),
      fetchTopRatedMovies(),
      fetchPlayingNowMovies()
    ]);
    isLoading = false;
    isLoadingMore = false;
  }
}
