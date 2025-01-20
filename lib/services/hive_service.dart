import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/features/movies/model/movies_model.dart';
import 'package:movie_app/features/recent_visits/model/recent_visits_model.dart';

class HiveService {
  static const String boxName = AppConstants.visitedMovieBox;
  static late Box<Map> _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox<Map>(boxName);
  }

  Future<void> addVisitedMovie(MovieModel movie) async {
    final recentVisit = RecentVisitsModel(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
    );
    if (_box.containsKey(recentVisit.id)) {
      await _box.delete(recentVisit.id);
    }
    await _box.put(recentVisit.id, recentVisit.toJson());
  }

  List<RecentVisitsModel> getRecentVisits({int offset = 0, int limit = 10}) {
    final movies =
        _box.values.toList().map((e) => RecentVisitsModel.fromJson(e)).toList();
    final end =
        (offset + limit) < movies.length ? offset + limit : movies.length;
    return movies.sublist(offset, end);
  }

  Future<void> deleteVisitedMovie(int id) async {
    await _box.delete(id);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
