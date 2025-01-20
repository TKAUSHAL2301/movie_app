import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/core/constants/app_palete.dart';
import 'package:movie_app/features/movies/view/movie_view.dart';
import 'package:movie_app/features/recent_visits/view/recent_visits_view.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = Get.find();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [MovieView(), RecentVisitsView()],
        ),
        bottomNavigationBar: Obx(
          () => WaterDropNavBar(
              waterDropColor: AppPalette.tertiaryColor,
              inactiveIconColor: Colors.grey,
              backgroundColor: AppPalette.darkGreyColor,
              onItemSelected: (index) {
                _controller.currentIndex = index;
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
              selectedIndex: _controller.currentIndex,
              barItems: AppConstants.bottomNavIcons),
        ));
  }
}
