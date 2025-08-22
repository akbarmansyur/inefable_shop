import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomConvexNavbar extends StatelessWidget {
  final TabController controller;
  const CustomConvexNavbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react,
      backgroundColor: Colors.white, // warna dasar
      activeColor: Colors.black,
      color: Colors.grey,
      initialActiveIndex: controller.index,
      items: [
        TabItem(icon: Icons.home_rounded, title: 'Beranda'),
        TabItem(icon: Icons.category_rounded, title: 'Kategori'),
        TabItem(icon: Icons.shopping_cart_outlined, title: 'Keranjang'),
        TabItem(icon: Icons.person_rounded, title: 'Profil'),
      ],
      onTap: (int index) {
        controller.animateTo(index);
      },
    );
  }
}
