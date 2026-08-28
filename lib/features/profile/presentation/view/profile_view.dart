import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: ProfileViewBody(),
      ),
    );
  }
}
