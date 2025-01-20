import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/bindings/bindings.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/core/constants/app_theme.dart';
import 'package:movie_app/services/hive_service.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: AppConstants.designSize,
        builder: (context, _) {
          return GetMaterialApp(
              title: 'Movie App',
              debugShowCheckedModeBanner: false,
              initialBinding: AppBinding(),
              theme: AppTheme.defaultTheme,
              routes: AppRoutes.routes);
        });
  }
}
