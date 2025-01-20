import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/core/constants/app_palete.dart';
import 'package:movie_app/features/movies/view/widgets/movies_app_bar.dart';
import 'package:movie_app/features/movies/view/widgets/movie_section.dart';
import '../controller/movies_controller.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final MoviesController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        backgroundColor: AppPalette.tertiaryColor,
        onRefresh: _controller.refreshData,
        child: _controller.isLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.red))
            : CustomScrollView(
                slivers: [
                  MovieAppBar(),
                  MovieSection(
                    title: AppConstants.playingNow,
                    movies: _controller.playingNowMovies,
                  ),
                  MovieSection(
                    title: AppConstants.popularMovies,
                    movies: _controller.popularMovies,
                  ),
                  MovieSection(
                    title: AppConstants.upcomingMovies,
                    movies: _controller.upcomingMovies,
                  ),
                  MovieSection(
                    title: AppConstants.topRatedMovies,
                    movies: _controller.topRatedMovies,
                  )
                ],
              ),
      ),
    );
  }
}
