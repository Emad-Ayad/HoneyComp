import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: const SignUpViewBody(),
    );
  }
}
