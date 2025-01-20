import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/recent_visits/view/widgets/delete_all_button.dart';
import 'package:movie_app/features/recent_visits/view/widgets/movie_list_tile.dart';
import 'package:movie_app/features/movie_detail/view/movie_detail_view.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';

class RecentVisitsView extends StatefulWidget {
  const RecentVisitsView({super.key});

  @override
  State<RecentVisitsView> createState() => _RecentVisitsViewState();
}

class _RecentVisitsViewState extends State<RecentVisitsView> {
  final recentVisitsController = Get.find<RecentVisitsController>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      recentVisitsController.loadMoreRecentVisits();
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    recentVisitsController.loadRecentVisits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recent Visits',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          actions: [DeleteAllButton()],
        ),
        body: Obx(
          () => recentVisitsController.recentVisits.isEmpty
              ? Center(
                  child:
                      Text('No recent visits', style: TextStyle(fontSize: 24)),
                )
              : ListView.separated(
                  key: _listKey,
                  separatorBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider()),
                  controller: _scrollController,
                  itemCount: recentVisitsController.recentVisits.length,
                  itemBuilder: (context, index) {
                    final movie = recentVisitsController.recentVisits[index];
                    return Dismissible(
                      key: Key(movie.id.toString()),
                      onDismissed: (_) =>
                          recentVisitsController.deleteVisitedMovie(movie.id),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: MovieListTile(
                        movie: movie,
                        onTap: () => Get.to(
                          () => MovieDetailView(
                              movieId: movie.id,
                              movieImageUrl: movie.posterPath),
                          transition: Transition.fadeIn,
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
