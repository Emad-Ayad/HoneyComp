import 'dart:developer';

import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title),
    leading: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            log("No previous screen to go back to");
          }
        },
        icon: const Icon(Icons.arrow_back_ios_new)),
  );
}
