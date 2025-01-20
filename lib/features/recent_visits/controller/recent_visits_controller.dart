import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/recent_visits/model/recent_visits_model.dart';
import 'package:movie_app/services/hive_service.dart';

class RecentVisitsController extends GetxController {
  final HiveService _movieHiveService;

  final RxList<RecentVisitsModel> _recentVisits = <RecentVisitsModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;
  final RxString _error = ''.obs;

  final RxInt _limit = 6.obs;
  final RxInt _currentOffset = 0.obs;
  final RxBool _hasMoreData = true.obs;

  int get limit => _limit.value;

  List<RecentVisitsModel> get recentVisits => _recentVisits;

  bool get isLoading => _isLoading.value;

  bool get isLoadingMore => _isLoadingMore.value;

  String get error => _error.value;

  int get currentOffset => _currentOffset.value;

  bool get hasMoreData => _hasMoreData.value;

  bool get hasError => _error.value.isNotEmpty;

  set limit(int value) => _limit.value = value;

  set recentVisits(List<RecentVisitsModel> value) =>
      _recentVisits.value = value;

  set isLoading(bool value) => _isLoading.value = value;

  set isLoadingMore(bool value) => _isLoadingMore.value = value;

  set error(String value) => _error.value = value;

  set currentOffset(int value) => _currentOffset.value = value;

  set hasMoreData(bool value) => _hasMoreData.value = value;

  RecentVisitsController(this._movieHiveService);

  @override
  void onInit() {
    super.onInit();
    loadRecentVisits();
  }

  Future<void> loadRecentVisits() async {
    if (isLoading) return;

    try {
      isLoading = true;
      error = '';
      currentOffset = 0;

      final visits = _movieHiveService.getRecentVisits(
          offset: currentOffset, limit: limit);

      recentVisits = visits;
      _hasMoreData.value = visits.length == limit;
      _currentOffset.value = visits.length;
    } catch (e) {
      error = 'Failed to load recent visits';
      debugPrint('Error loading recent visits: $e');
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMoreRecentVisits() async {
    if (isLoadingMore || !hasMoreData) return;

    try {
      isLoadingMore = true;
      error = '';

      final moreVisits = _movieHiveService.getRecentVisits(
        offset: currentOffset,
        limit: _limit.value,
      );

      if (moreVisits.isNotEmpty) {
        recentVisits.addAll(moreVisits);
        currentOffset += moreVisits.length;
        hasMoreData = moreVisits.length == _limit.value;
      } else {
        hasMoreData = false;
      }
    } catch (e) {
      error = 'Failed to load more visits';
      debugPrint('Error loading more visits: $e');
    } finally {
      isLoadingMore = false;
    }
  }

  Future<void> deleteVisitedMovie(int movieId) async {
    try {
      await _movieHiveService.deleteVisitedMovie(movieId);
      recentVisits.removeWhere((movie) => movie.id == movieId);

      if (recentVisits.length < _limit.value && _hasMoreData.value) {
        await loadMoreRecentVisits();
      }
    } catch (e) {
      error = 'Failed to delete movie from history';
      debugPrint('Error deleting visited movie: $e');
    }
  }
}
