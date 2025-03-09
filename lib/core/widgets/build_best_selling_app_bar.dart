import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_text_styles.dart';
import 'package:honey_comp/core/widgets/notification_widget.dart';

AppBar buildBestSellingAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'الاكثر مبيعاً',
      style: AppTextStyles.heading3.copyWith(fontSize: 19),
    ),
    leading: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
        icon: const Icon(Icons.arrow_back_ios_new)),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: NotificationWidget(),
      )
    ],
  );
}
