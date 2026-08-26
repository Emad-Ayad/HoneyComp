import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/constants/constants.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getUser();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: AppTextStyles.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              style: AppTextStyles.subtitle1.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () async {
                await getIt.get<FirebaseAuthService>().signOut();
                SharedPreferenceSingleton.remove(kIUserData);
                context.read<CartCubit>().clearCart();
                Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
              },
              title: 'تسجيل الخروج',
            ),
          ],
        ),
      ),
    );
  }
}
