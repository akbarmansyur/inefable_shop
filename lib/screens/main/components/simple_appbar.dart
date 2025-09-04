import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inefable_shop/route/app_pages.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (_) => SearchPage()),
          //     );
          //   },
          //   icon: SvgPicture.asset('assets/icons/search_icon.svg'),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.search),
                child: TextField(
                  enabled: false,
                  // onChanged: (value) => controller.setSearchQuery(value),
                  decoration: InputDecoration(
                    hintText: 'Search for products...',
                    prefixIcon: const Icon(Iconsax.search_normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              //   Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (_) => NotificationsPage()));
            },
            icon: Icon(Iconsax.notification),
          ),
          IconButton(
            onPressed: () {
              //   Navigator.of(
              //   context,
              // ).push(MaterialPageRoute(builder: (_) => NotificationsPage()));
            },
            icon: Icon(Iconsax.shopping_cart),
          ),
        ],
      ),
    );
  }
}
