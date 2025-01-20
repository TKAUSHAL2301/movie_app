import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie_detail/view/movie_detail_view.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';
import 'package:movie_app/features/recent_visits/model/recent_visits_model.dart';

import 'movie_list_tile.dart';

class AnimatedListItem extends StatefulWidget {
  final RecentVisitsModel movie;
  final Animation<double> animation;
  final GlobalKey<AnimatedListState> listKey;

  final int index;

  const AnimatedListItem(this.movie, this.animation, this.index, this.listKey,
      {super.key});

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  final RecentVisitsController recentVisitsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animation.drive(
        Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ),
      ),
      child: FadeTransition(
        opacity: widget.animation,
        child: Column(
          children: [
            Dismissible(
              key: Key(widget.movie.id.toString()),
              onDismissed: (_) =>
                  recentVisitsController.deleteVisitedMovie(widget.movie.id),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: MovieListTile(
                movie: widget.movie,
                onTap: () => Get.to(
                  () => MovieDetailView(
                      movieId: widget.movie.id,
                      movieImageUrl: widget.movie.posterPath),
                  transition: Transition.fadeIn,
                ),
              ),
            ),
            if (widget.index < recentVisitsController.recentVisits.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
          ],
        ),
      ),
    );
  }
}
