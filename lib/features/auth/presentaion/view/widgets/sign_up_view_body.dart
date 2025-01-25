import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/widgets/build_app_bar.dart';
import 'package:honey_comp/core/widgets/custom_button.dart';
import 'package:honey_comp/core/widgets/custom_text_form_field.dart';
import 'package:honey_comp/generated/l10n.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: S.of(context).newAccount),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  hintText: S.of(context).fullName,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 16),
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isChecked, onChanged: (value){
                    setState(() {
                      isChecked =value!;
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
              CustomButton(onPressed: () {}, title: S.of(context).signUp),
              const SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).haveAccount,
                    style: AppTextStyles.bodyText1
                        .copyWith(color: const Color(0xff949D9E)),
                  ),
                  Text(
                    S.of(context).login,
                    style: AppTextStyles.bodyText1
                        .copyWith(color: const Color(0xff1B5E37)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
