import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;

  @override
  void initState() {
    super.initState();
    _name = getUser().name;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الاسم بالكامل',
              style: AppTextStyles.subtitle2,
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'أدخل اسمك',
              keyboardType: TextInputType.name,
              initialValue: _name,
              onSaved: (value) {
                _name = value ?? '';
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<EditProfileCubit>().updateUserName(newName: _name);
                }
              },
              title: 'حفظ التعديلات',
            ),
          ],
        ),
      ),
    );
  }
}
