import 'package:flutter/material.dart';
import 'package:honey_comp/features/home/domain/entities/navigation_bar_entity.dart';

import 'navigation_bar_item.dart';

class CustomHomeNavigationBar extends StatefulWidget {
  const CustomHomeNavigationBar({super.key});

  @override
  State<CustomHomeNavigationBar> createState() =>
      _CustomHomeNavigationBarState();
}

class _CustomHomeNavigationBarState extends State<CustomHomeNavigationBar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 15,
            color: Colors.black12,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: navigationBarItems.asMap().entries.map(
          (e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == activeIndex ? 3 :2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: NavigationBarItem(
                  isActive: activeIndex == index,
                  navigationBarEntity: entity,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
