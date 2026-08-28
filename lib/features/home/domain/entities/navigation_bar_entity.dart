import 'package:honey_comp/generated/l10n.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class NavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  NavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<NavigationBarEntity> getNavigationBarItems(BuildContext context) => [
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeHome,
        inActiveImage: Assets.images.icons.home,
        name: S.of(context).home,
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeProducts,
        inActiveImage: Assets.images.icons.products,
        name: S.of(context).products,
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeShoppingCart,
        inActiveImage: Assets.images.icons.shoppingCart,
        name: S.of(context).shoppingCart,
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeUser,
        inActiveImage: Assets.images.icons.user,
        name: S.of(context).myAccount,
      ),
    ];
