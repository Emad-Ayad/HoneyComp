import 'package:flutter/material.dart';
import 'package:honey_comp/features/home/domain/entities/navigation_bar_entity.dart';

import 'navigation_bar_item.dart';

class CustomHomeNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomHomeNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<CustomHomeNavigationBar> createState() =>
      _CustomHomeNavigationBarState();
}

class _CustomHomeNavigationBarState extends State<CustomHomeNavigationBar> {

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
              flex: index == widget.currentIndex ? 3 :2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onTap(index);
                  });
                },
                child: NavigationBarItem(
                  isActive: widget.currentIndex == index,
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
