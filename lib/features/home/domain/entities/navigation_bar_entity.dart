import 'package:honey_comp/gen/assets.gen.dart';

class NavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  NavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<NavigationBarEntity> get navigationBarItems => [
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeHome,
        inActiveImage: Assets.images.icons.home,
        name: "الرئيسية",
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeProducts,
        inActiveImage: Assets.images.icons.products,
        name: "المنتجات",
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeShoppingCart,
        inActiveImage: Assets.images.icons.shoppingCart,
        name: "سلة التسوق",
      ),
      NavigationBarEntity(
        activeImage: Assets.images.icons.activeUser,
        inActiveImage: Assets.images.icons.user,
        name: "حسابي",
      ),
    ];
