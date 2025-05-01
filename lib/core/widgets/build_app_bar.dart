import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:honey_comp/core/constants/app_colors.dart';
import 'package:honey_comp/core/widgets/notification_widget.dart';

AppBar buildAppBar(context,
    {required String title,
    bool backButtonVisibility = true,
    bool notificationVisibility = false}) {
  return AppBar(
    backgroundColor: AppColors.background,
    centerTitle: true,
    title: Text(title),
    actions: [
      Visibility(
        visible: notificationVisibility,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: NotificationWidget(),
        ),
      )
    ],
    leading: Visibility(
      visible: backButtonVisibility,
      child: IconButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              log("No previous screen to go back to");
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
    ),
  );
}
