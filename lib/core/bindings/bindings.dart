import 'package:get/get.dart';
import 'package:movie_app/features/home/controller/home_controller.dart';
import 'package:movie_app/features/movies/controller/movies_controller.dart';
import 'package:movie_app/features/movie_detail/controller/movie_detail_controller.dart';
import 'package:movie_app/features/recent_visits/controller/recent_visits_controller.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/services/hive_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => HiveService(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => MoviesController(), fenix: true);
    Get.lazyPut(() => MovieDetailController(), fenix: true);
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => HiveService(), fenix: true);
    Get.lazyPut(() => RecentVisitsController(Get.find()), fenix: true);
  }
}
