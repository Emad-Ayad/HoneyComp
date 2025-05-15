import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false});

  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.bodyText2.copyWith(
            color: const Color(0xff949d9e),
          ),
          fillColor: AppColors.lightGray,
          filled: true,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xffe6e9e9),
        ));
  }
}
