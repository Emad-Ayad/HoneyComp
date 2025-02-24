import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/gen/assets.gen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Assets.images.profile.image(),
        title: Text(
          "عماد عياد",
          style: AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "مرحبا بك يا عمدة",
          style: AppTextStyles.subtitle2,
        ),
        trailing: Container(
            width: 40,
            height: 40,
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
              color: Color(0XFFEEF8ED),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(Assets.images.notification),
            )),
      ),
    );
  }
}
