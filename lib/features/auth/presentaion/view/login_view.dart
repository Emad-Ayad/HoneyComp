import 'package:flutter/material.dart';
import 'package:honey_comp/features/auth/presentaion/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName='login';

  @override
  Widget build(BuildContext context) {
    return const LoginViewBody();
  }
}
