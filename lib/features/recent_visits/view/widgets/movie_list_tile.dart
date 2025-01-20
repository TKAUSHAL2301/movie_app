import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';
import 'package:movie_app/features/recent_visits/model/recent_visits_model.dart';

class MovieListTile extends StatefulWidget {
  final RecentVisitsModel movie;
  final VoidCallback onTap;

  const MovieListTile({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  State<MovieListTile> createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
  final RecentVisitsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}${widget.movie.posterPath}',
            width: 50,
            height: 75,
            fit: BoxFit.cover,
            errorWidget: (context, error, stackTrace) {
              return Container(
                width: 50,
                height: 75,
                color: Colors.grey,
                child: Icon(Icons.movie),
              );
            },
          ),
        ),
        title: Row(
          children: [
            Expanded(
                child: Text(widget.movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            IconButton(
                onPressed: () => controller.deleteVisitedMovie(widget.movie.id),
                icon: Icon(Icons.delete))
          ],
        ),
        subtitle: Text(widget.movie.overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey)),
        onTap: widget.onTap,
      ),
    );
  }
}
