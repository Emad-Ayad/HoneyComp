import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:honey_comp/features/auth/domain/repos/auth_repo.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: const SignUpBlocConsumer(),
    );
  }
}

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          buildSnackBar(context, "SignUp Done Successfully");
        }
        if (state is SignupFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading, child: const SignUpViewBody());
      },
    );
  }
}
