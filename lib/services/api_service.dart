import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/api/api_reponse.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/movies/model/movies_model.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        queryParameters: {'language': 'en'},
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.apiKey}',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.addAll([
      InterceptorsWrapper(
          onRequest: onRequest, onResponse: onResponse, onError: onError)
    ]);
  }

  // Get Popular Movies
  Future<ApiResponse<List<MovieModel>>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiConstants.popularMovies,
        queryParameters: {'page': page},
      );

      final movies = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return ApiResponse.success(movies);
    } catch (e) {
      return ApiResponse.error(_handleError(e));
    }
  }

  // Get Movie Details
  Future<ApiResponse<MovieDetailModel>> getMovieDetails(
    int movieId, {
    String? language,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.movieDetails}/$movieId',
      );

      final movieDetails = MovieDetailModel.fromJson(response.data);
      return ApiResponse.success(movieDetails);
    } catch (e) {
      return ApiResponse.error(_handleError(e));
    }
  }

  // Get Upcoming Movies
  Future<ApiResponse<List<MovieModel>>> getUpcomingMovies({
    int page = 1,
    String? language,
    String? region,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.upcomingMovies,
        queryParameters: {'page': page},
      );

      final movies = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();

      return ApiResponse.success(movies);
    } catch (e) {
      return ApiResponse.error(_handleError(e));
    }
  }

  // Get Top Rated Movies
  Future<ApiResponse<List<MovieModel>>> getTopRatedMovies(
      {int page = 1, String? language, String? region}) async {
    try {
      final response = await _dio.get(
        ApiConstants.topRatedMovies,
        queryParameters: {'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();

      return ApiResponse.success(movies);
    } catch (e) {
      return ApiResponse.error(_handleError(e));
    }
  }

  Future<ApiResponse<List<MovieModel>>> getPlayingNowMovies(
      {int page = 1, String? language, String? region}) async {
    try {
      final response = await _dio.get(
        ApiConstants.nowPlayingMovies,
        queryParameters: {'page': page},
      );
      final movies = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();

      return ApiResponse.success(movies);
    } catch (e) {
      return ApiResponse.error(_handleError(e));
    }
  }

  // Error handling
  String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Timeout';
        case DioExceptionType.cancel:
          return 'Request cancelled';
        default:
          return 'Network error occurred';
      }
    }
    return 'Something went wrong';
  }

  // Dispose
  void dispose() {
    _dio.close(force: true);
  }

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('Request [${options.method}] => PATH: ${options.uri}');
    }
    handler.next(options);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    handler.next(response);
  }

  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} => Err: ${err.message}',
      );
    }
    handler.next(err);
  }
}
