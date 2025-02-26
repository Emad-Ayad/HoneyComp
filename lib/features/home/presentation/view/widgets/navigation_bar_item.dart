import 'package:flutter/material.dart';

import '../../../domain/entities/navigation_bar_entity.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isActive, required this.navigationBarEntity});

  final bool isActive;
  final NavigationBarEntity navigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            image: navigationBarEntity.activeImage,
            text: navigationBarEntity.name,
          )
        : InActiveItem(image: navigationBarEntity.inActiveImage);
  }
}
