import 'package:flutter/material.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/custom_home_navigation_bar.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomHomeNavigationBar(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
