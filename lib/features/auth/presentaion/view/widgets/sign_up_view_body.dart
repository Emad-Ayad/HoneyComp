import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/build_snack_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:honey_comp/generated/l10n.dart';
import '../../../../../core/widgets/password_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isChecked = false;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: S.of(context).newAccount),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Form(
            key: globalKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                    hintText: S.of(context).fullName,
                    onSaved: (value) {
                      name = value!;
                    },
                    keyboardType: TextInputType.name),
                const SizedBox(height: 16),
                CustomTextFormField(
                    hintText: S.of(context).email,
                    onSaved: (value) {
                      email = value!;
                    },
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            log(value.toString());
                          });
                        }),
                    Expanded(
                      child: Text(
                        S.of(context).terms,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: AppTextStyles.bodyText2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        if (isChecked) {
                          globalKey.currentState!.save();
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                                  email: email, password: password, name: name);
                        } else {
                          buildSnackBar(
                              context, 'الرجاء الموافقة علي الشروط والاحكام');
                        }
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    title: S.of(context).signUp),
                const SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).haveAccount,
                      style: AppTextStyles.bodyText1
                          .copyWith(color: const Color(0xff949D9E)),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        S.of(context).login,
                        style: AppTextStyles.bodyText1
                            .copyWith(color: const Color(0xff1B5E37)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
