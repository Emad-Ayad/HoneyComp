import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: const LoginViewBody(),
    );
  }
}
