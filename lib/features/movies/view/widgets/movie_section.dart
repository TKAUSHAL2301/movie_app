import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/dimension_const.dart';
import 'package:movie_app/features/movies/controller/movies_controller.dart';
import 'package:movie_app/features/movies/model/movies_model.dart';

class MovieSection extends StatefulWidget {
  final String title;
  final List<MovieModel> movies;

  const MovieSection({required this.title, required this.movies, super.key});

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  final MoviesController _moviesController = Get.find();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _setupScrollListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount:
                  widget.movies.length + (_moviesController.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == widget.movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Colors.red),
                    ),
                  );
                }
                final movie = widget.movies[index];
                return GestureDetector(
                  onTap: () => _moviesController.onTapMovie(movie),
                  child: Container(
                    width: DimensionConst.movieListHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${ApiConstants.baseImageUrl}${movie.posterPath}',
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Container(),
                              errorWidget: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[900],
                                  child: const Icon(Icons.movie,
                                      color: Colors.white),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setupScrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await _moviesController.loadMoreMovies(widget.title);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
