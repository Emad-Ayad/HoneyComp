import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honey_comp/gen/assets.gen.dart';


class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          color: Color(0XFFEEF8ED),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(Assets.images.notification),
        ));
  }
}