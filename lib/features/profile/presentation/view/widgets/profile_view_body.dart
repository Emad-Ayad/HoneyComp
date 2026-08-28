import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';
import 'package:honey_comp/features/auth/domain/entities/user_entity.dart';
import 'package:honey_comp/features/auth/presentaion/view/login_view.dart';
import 'package:honey_comp/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/edit_profile_view.dart';
import 'package:honey_comp/features/profile/presentation/view/my_orders_view.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late UserEntity user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  void _refreshUser() {
    setState(() {
      user = getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutLoading) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
          if (state is SignOutSuccess) {
            context.read<CartCubit>().clearCart();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginView.routeName, (route) => false);
          } else if (state is SignOutFailure) {
            buildSnackBar(context, state.errMessage);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: _isLoading,
          child: SafeArea(
            child: Column(
              children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
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
          ),
          
          const SizedBox(height: 8),
          
          // Options Section
          Expanded(
            child: Container(
              color: const Color(0xFFF9F9F9), // Light background for the list
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildProfileOption(
                    icon: Icons.shopping_bag_outlined,
                    title: 'طلباتي',
                    onTap: () {
                      Navigator.pushNamed(context, MyOrdersView.routeName);
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.person_outline,
                    title: 'تعديل الملف الشخصي',
                    onTap: () async {
                      final result = await Navigator.pushNamed(context, EditProfileView.routeName);
                      if (result == true) {
                        _refreshUser();
                      }
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.location_on_outlined,
                    title: 'عناويني',
                    onTap: () {
                      // Navigate to Addresses
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
                    icon: Icons.help_outline,
                    title: 'تواصل معنا',
                    onTap: () {
                      // Navigate to Contact Us
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(height: 1, indent: 16, endIndent: 16),
                  ),
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: 'تسجيل الخروج',
                    isDestructive: true,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
        );
      },
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
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
              child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<SignOutCubit>().signOut();
              },
            ),
          ],
        );
      },
    );
  }
}
