import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/core/widgets/social_auth.dart';
import 'package:honey_comp/generated/l10n.dart';

import '../../../../../gen/assets.gen.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: S.of(context).login),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  hintText: S.of(context).email,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: S.of(context).password,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xffC9CECF),
                    )),
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
              CustomButton(onPressed: () {}, title: S.of(context).login),
              const SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).dontHaveAccount,
                    style: AppTextStyles.bodyText1
                        .copyWith(color: const Color(0xff949D9E)),
                  ),
                  Text(
                    S.of(context).makeAccount,
                    style: AppTextStyles.bodyText1
                        .copyWith(color: const Color(0xff1B5E37)),
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
    );
  }
}
