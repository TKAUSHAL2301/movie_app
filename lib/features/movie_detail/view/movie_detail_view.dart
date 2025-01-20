import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/widgets/error_screen.dart';
import 'package:movie_app/core/widgets/shimmer.dart';
import 'package:movie_app/features/movie_detail/controller/movie_detail_controller.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';
import 'package:movie_app/features/movie_detail/view/widget/movie_additional_info.dart';
import 'package:movie_app/features/movie_detail/view/widget/movie_app_bar.dart';
import 'package:movie_app/features/movie_detail/view/widget/movie_detail_overview.dart';
import 'package:movie_app/features/movie_detail/view/widget/movie_header_info.dart';

class MovieDetailView extends StatefulWidget {
  final int movieId;
  final String movieImageUrl;

  const MovieDetailView(
      {super.key, required this.movieId, required this.movieImageUrl});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  final MovieDetailController _controller = Get.find();

  MovieDetailModel get movie => _controller.movieDetailModel;

  @override
  void initState() {
    _controller.getMovieDetail(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (_controller.error.isNotEmpty) {
          return ErrorScreen(errorMessage: _controller.error);
        } else {
          return CustomScrollView(
            slivers: [
              MovieAppBar(movieImageUrl: widget.movieImageUrl, movie: movie),
              if (!_controller.isLoading)
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieHeaderInfo(movie),
                      MovieDetailOverview(movie),
                      MovieAdditionalInfo(movie),
                    ],
                  ),
                )
              else
                SliverFillRemaining(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) =>
                      CustomShimmer(),
                )),
            ],
          );
        }
      },
    ));
  }
}
