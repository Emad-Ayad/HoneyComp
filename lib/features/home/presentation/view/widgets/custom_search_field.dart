import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.lightGray,
          blurRadius: 9,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: const Icon(Icons.filter_list),
            prefixIcon: const Icon(Icons.search),
            hintText: "أبحث عن....",
            hintStyle: AppTextStyles.bodyText2.copyWith(
              color: AppColors.gray,
            ),
            fillColor: AppColors.background,
            filled: true,
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder()),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.secondaryColor,
    ),
  );
}
