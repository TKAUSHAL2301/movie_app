import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class AppConstants {
  static const String failedToClearHistory = 'Failed to clear history';

  static const String playingNow = 'Playing Now';
  static const String popularMovies = 'Popular Movies';
  static const String upcomingMovies = 'Upcoming Movies';
  static const String topRatedMovies = 'Top Rated Movies';
  static const String visitedMovieBox = 'visited_movies';
  static const Size designSize = Size(1320, 2868);
  static List<BarItem> bottomNavIcons = [
    BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
    BarItem(
        filledIcon: Icons.access_time_filled,
        outlinedIcon: Icons.access_time_outlined)
  ];
}
