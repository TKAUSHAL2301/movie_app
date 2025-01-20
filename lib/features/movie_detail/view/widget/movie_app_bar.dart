import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';

class MovieAppBar extends StatelessWidget {
  final MovieDetailModel movie;
  final String movieImageUrl;

  const MovieAppBar(
      {super.key, required this.movie, required this.movieImageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Get.height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'movie-${movie.id}',
              child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.baseImageUrl}$movieImageUrl',
                  fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
