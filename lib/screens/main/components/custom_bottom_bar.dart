import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inefable_shop/app_properties.dart';

class CustomConvexNavbar extends StatelessWidget {
  final TabController controller;
  const CustomConvexNavbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react,
      backgroundColor: Colors.white, // warna dasar
      activeColor: yellow,
      color: Colors.grey,
      initialActiveIndex: controller.index,
      items: [
        TabItem(icon: Iconsax.home, title: 'Home'),
        TabItem(icon: Iconsax.shop, title: 'Shop'),
        TabItem(icon: Iconsax.favorite_chart, title: 'Wishlist'),
        TabItem(icon: Iconsax.user, title: 'Profil'),
      ],
      onTap: (int index) {
        controller.animateTo(index);
      },
    );
  }
}
