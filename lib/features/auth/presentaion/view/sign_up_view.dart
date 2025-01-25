import 'package:flutter/material.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName='signUp';

  @override
  Widget build(BuildContext context) {
    return const SignUpViewBody();
  }
}
