import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_detail/model/movie_detail_model.dart';

class MovieHeaderInfo extends StatelessWidget {
  final MovieDetailModel movie;

  const MovieHeaderInfo(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                movie.releaseDate?.year.toString() ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 12),
              Text(
                '${movie.runtime} min',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  movie.adult == true ? '18+' : '13+',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: (movie.genres ?? [])
                .map((genre) => Chip(
                      label: Text(genre.name ?? ''),
                      backgroundColor: Colors.grey[800],
                      labelStyle: const TextStyle(color: Colors.white),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
