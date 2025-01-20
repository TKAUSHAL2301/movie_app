import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';
import 'package:movie_app/features/recent_visits/view/widgets/clear_all_dialog.dart';

class DeleteAllButton extends StatefulWidget {
  const DeleteAllButton({super.key});

  @override
  State<DeleteAllButton> createState() => _DeleteAllButtonState();
}

class _DeleteAllButtonState extends State<DeleteAllButton> {
  final controller = Get.find<RecentVisitsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.recentVisits.isNotEmpty
        ? IconButton(
            icon: Icon(Icons.delete_sweep),
            onPressed: () => Get.dialog(ClearAllDialog()),
          )
        : SizedBox());
  }
}
