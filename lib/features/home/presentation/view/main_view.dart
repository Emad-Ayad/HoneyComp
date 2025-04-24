import 'package:flutter/material.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/custom_home_navigation_bar.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const String routeName = 'main';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomHomeNavigationBar(),
      body: SafeArea(
        child: HomeView(),
      ),
    );
  }
}
