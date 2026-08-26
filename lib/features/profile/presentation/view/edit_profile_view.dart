import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/services/get_it_service.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:honey_comp/features/profile/domain/repos/profile_repo.dart';
import 'package:honey_comp/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:honey_comp/features/profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileView extends StatelessWidget {
  static const String routeName = 'edit_profile';

  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(getIt.get<ProfileRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'تعديل الملف الشخصي',
            style: AppTextStyles.subtitle1,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileFailure) {
              buildSnackBar(context, state.errMessage);
            } else if (state is EditProfileSuccess) {
              buildSnackBar(context, 'تم حفظ التعديلات بنجاح');
              Navigator.pop(context, true); // Return true so Profile screen can refresh
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is EditProfileLoading,
              child: const EditProfileViewBody(),
            );
          },
        ),
      ),
    );
  }
}
