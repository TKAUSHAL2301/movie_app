import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';
import 'package:movie_app/services/api_service.dart';

class MovieDetailController extends GetxController {
  final Rxn<MovieDetailModel> _movieDetailModel = Rxn<MovieDetailModel>();
  final RxBool _isLoading = true.obs;
  final RxString _error = ''.obs;

  String get error => _error.value;

  bool get isLoading => _isLoading.value;

  MovieDetailModel get movieDetailModel =>
      _movieDetailModel.value ?? MovieDetailModel();

  set movieDetailModel(MovieDetailModel? value) =>
      _movieDetailModel.value = value;

  set isLoading(bool value) => _isLoading.value = value;

  set error(String value) => _error.value = value;

  void getMovieDetail(int movieId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final response = await Get.find<ApiService>().getMovieDetails(movieId);
      if (response.statusCode == 200) {
        _movieDetailModel.value = response.data;
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      debugPrint(e.toString());
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
