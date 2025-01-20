import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_palete.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppPalette.darkGreyColor,
      expandedHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Movie App',
            style: TextStyle(
                color: AppPalette.tertiaryColor, fontWeight: FontWeight.bold)),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // ignore: deprecated_member_use
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
