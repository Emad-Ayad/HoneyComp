import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/cart_view.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/custom_home_navigation_bar.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/home_view.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/main_view_body.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/products_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: CustomHomeNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: MainViewBody(currentIndex: _currentIndex),
      ),
    );
  }
}


