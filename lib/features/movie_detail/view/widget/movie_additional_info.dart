import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';

import 'movie_info_row.dart';

class MovieAdditionalInfo extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieAdditionalInfo(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieInfoRow('Rating', '${movie.voteAverage}/10'),
            MovieInfoRow('Release Date',
                movie.releaseDate?.toString().split(' ')[0] ?? ''),
            MovieInfoRow('Runtime', '${movie.runtime} minutes'),
            MovieInfoRow('Status', movie.status ?? ''),
            if (movie.productionCompanies?.isNotEmpty == true)
              MovieInfoRow(
                  'Studio', movie.productionCompanies?.first.name ?? ''),
          ],
        ));
  }
}
