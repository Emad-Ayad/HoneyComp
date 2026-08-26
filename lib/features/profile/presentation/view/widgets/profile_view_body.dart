import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/constants/constants.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';
import 'package:honey_comp/core/services/firebase_auth_service.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/core/services/shared_preferences_singleton.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/my_orders_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getUser();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // User Header
            Column(
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
                  style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Profile Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.shopping_bag_outlined,
                    title: 'طلباتي',
                    onTap: () {
                      Navigator.pushNamed(context, MyOrdersView.routeName);
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.edit_outlined,
                    title: 'تعديل الملف الشخصي',
                    onTap: () {
                      // Navigate to Edit Profile
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.location_on_outlined,
                    title: 'عناويني',
                    onTap: () {
                      // Navigate to My Addresses
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.settings_outlined,
                    title: 'الإعدادات',
                    onTap: () {
                      // Navigate to Settings
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.headset_mic_outlined,
                    title: 'تواصل معنا',
                    onTap: () {
                      // Navigate to Contact Us
                    },
                  ),
                  const Divider(height: 32, thickness: 1),
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: 'تسجيل الخروج',
                    isDestructive: true,
                    onTap: () async {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.primaryColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : AppColors.primaryColor,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.subtitle2.copyWith(
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('تسجيل الخروج', style: AppTextStyles.subtitle1),
          content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟',
              style: AppTextStyles.subtitle2),
          actions: [
            TextButton(
              child: const Text('إلغاء', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('تأكيد', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await getIt.get<FirebaseAuthService>().signOut();
                SharedPreferenceSingleton.remove(kIUserData);
                context.read<CartCubit>().clearCart();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginView.routeName, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
