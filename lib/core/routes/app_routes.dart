import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/widgets/splash.dart';
import 'package:movie_app/features/home/view/home_view.dart';
import 'package:movie_app/features/recent_visits/view/recent_visits_view.dart';

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const movieDetail = '/movieDetail';
  static const recentVisits = '/recentVisits';

  static Map<String, WidgetBuilder> get routes => {
        initial: (context) => const Splash(),
        home: (context) => const HomeView(),
        recentVisits: (context) => RecentVisitsView()
      };
}
