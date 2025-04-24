import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/repos/products_repo/products_repo.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/home/presentation/cubits/products_cubit.dart';
import 'package:honey_comp/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
