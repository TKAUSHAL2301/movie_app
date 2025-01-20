import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_palete.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.error),
          ),
          Text(
            errorMessage,
            style: TextStyle(color: AppPalette.tertiaryColor),
          )
        ],
      ),
    );
  }
}
