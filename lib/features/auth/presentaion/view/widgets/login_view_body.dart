import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/core/widgets/password_field.dart';
import 'package:honey_comp/core/widgets/social_auth.dart';
import 'package:honey_comp/features/auth/presentaion/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:honey_comp/features/auth/presentaion/view/sign_up_view.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:honey_comp/generated/l10n.dart';
import 'or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: S.of(context).login),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Form(
            key: globalKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).forgotPassword,
                        style: AppTextStyles.bodyTextShade,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                CustomButton(
                    onPressed: () {
                      if(globalKey.currentState!.validate()){
                        globalKey.currentState!.save();
                        context.read<SignInCubit>().signInWithEmailAndPassword(
                            email: email, password: password);
                      }else{
                        setState(() {
                          autoValidateMode=AutovalidateMode.always;
                        });
                      }

                    },
                    title: S.of(context).login),
                const SizedBox(height: 33),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).dontHaveAccount,
                      style: AppTextStyles.bodyText1
                          .copyWith(color: const Color(0xff949D9E)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUpView.routeName);
                      },
                      child: Text(
                        S.of(context).makeAccount,
                        style: AppTextStyles.bodyText1
                            .copyWith(color: const Color(0xff1B5E37)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                const OrDivider(
                  text: "أو",
                ),
                const SizedBox(height: 33),
                SocialAuth(
                  onPressed: () {},
                  title: "تسجيل بواسطة جوجل",
                  icon: Assets.images.google.image(),
                ),
                const SizedBox(height: 16),
                SocialAuth(
                  onPressed: () {},
                  title: "تسجيل بواسطة أبل",
                  icon: Assets.images.apple.image(),
                ),
                const SizedBox(height: 16),
                SocialAuth(
                  onPressed: () {},
                  title: "تسجيل بواسطة فيسبوك",
                  icon: Assets.images.facebook.image(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
