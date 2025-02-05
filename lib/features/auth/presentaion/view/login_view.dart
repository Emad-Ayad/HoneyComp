import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: SignInBlocConsumer(),
    );
  }
}

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          buildSnackBar(context, state.errMessage);
        } else if (state is SignInSuccess) {
          buildSnackBar(context, "Mission Done Successfully");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
