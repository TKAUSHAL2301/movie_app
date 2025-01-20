import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/app_palete.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';
import 'package:movie_app/services/hive_service.dart';

class ClearAllDialog extends StatefulWidget {
  const ClearAllDialog({super.key});

  @override
  State<ClearAllDialog> createState() => _ClearAllDialogState();
}

class _ClearAllDialogState extends State<ClearAllDialog> {
  final RecentVisitsController controller = Get.find();
  final HiveService hiveService = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppPalette.tertiaryColor,
      title: Text('Clear History',
          style: TextStyle(color: AppPalette.primaryColor)),
      content: Text(
        'Are you sure you want to clear all history?',
        style: TextStyle(color: AppPalette.primaryColor),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: Text('Clear'),
          onPressed: () {
            hiveService.clearAll();
            controller.recentVisits.clear();
            Get.back();
          },
        ),
      ],
    );
  }
}
