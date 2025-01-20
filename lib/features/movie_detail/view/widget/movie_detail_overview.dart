import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';

class MovieDetailOverview extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieDetailOverview(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (movie.tagline != null) ...[
            Text(
              movie.tagline!,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            movie.overview ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
