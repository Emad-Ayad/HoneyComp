import 'package:honey_comp/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/helper_functions/get_user_data.dart';
import 'package:honey_comp/core/widgets/notification_widget.dart';
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
          "Emad",
          //TODO Wait till finish developing
          // getUser().name,
          style: AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(S.of(context).welcomeOmda,
          style: AppTextStyles.subtitle2,
        ),
        trailing: const NotificationWidget(),
      ),
    );
  }
}

