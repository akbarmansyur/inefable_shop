import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/controller/home_controller.dart';
import 'package:inefable_shop/custom_background.dart';
import 'package:inefable_shop/route/app_pages.dart';
import 'package:inefable_shop/screens/category/shop_page.dart';
import 'package:inefable_shop/screens/main/components/offer_widget.dart';
import 'package:inefable_shop/screens/main/components/simple_appbar.dart';
import 'package:inefable_shop/screens/main/components/simple_product_card.dart';
import 'package:inefable_shop/screens/profile_page.dart';
import 'package:inefable_shop/screens/shop/check_out_page.dart';
import 'components/custom_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Scaffold(
      bottomNavigationBar: CustomConvexNavbar(
        controller: controller.bottomTabController,
      ),
      body: CustomPaint(
        painter: MainBackground(),
        child: SafeArea(
          child: TabBarView(
            controller: controller.bottomTabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  SimpleAppBar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomScrollView(
                        // physics: NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(child: OfferCarousel()),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Container(
                                      width: 4,
                                      height: 20,
                                      color: yellow,
                                      margin: const EdgeInsets.only(right: 8),
                                    ),
                                    // Teks Flash Sale
                                    Text(
                                      'Produk Baru',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),

                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Lihat Semua',
                                        style: TextStyle(
                                          color: darkGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 235,
                                  child: Obx(
                                    () => ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                      ),
                                      itemCount: controller.newItem.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.productdetail,
                                              arguments:
                                                  controller.newItem[index],
                                            );
                                          },
                                          child: SimpleProductCard(
                                            product: controller.newItem[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    // Garis vertikal merah
                                    Container(
                                      width: 4,
                                      height: 20,
                                      color: yellow,
                                      margin: const EdgeInsets.only(right: 8),
                                    ),
                                    Text(
                                      'Flash Sale',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    CountdownTimer(
                                      endTime:
                                          DateTime.now()
                                              .millisecondsSinceEpoch +
                                          1000 * 60 * 60 * 2, // 2 jam
                                      widgetBuilder: (_, time) {
                                        if (time == null) {
                                          return Text('Flash Sale Ended!');
                                        }
                                        return Text(
                                          '${time.hours}:${time.min}:${time.sec}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      },
                                    ),
                                    Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Lihat Semua',
                                        style: TextStyle(
                                          color: darkGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                // List Produk Flash Sale (Horizontal Scroll)
                                SizedBox(
                                  height:
                                      235, // Sesuaikan tinggi sesuai kebutuhan
                                  child: Obx(
                                    () => ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                      ),
                                      itemCount:
                                          controller.flashSaleProducts.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.productdetail,
                                              arguments: controller
                                                  .flashSaleProducts[index],
                                            );
                                          },
                                          child: SimpleProductCard(
                                            product: controller
                                                .flashSaleProducts[index],
                                            isFlash: true,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20), // Jarak sebelum TabBar
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 20)),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 4,
                                    height: 20,
                                    color: yellow,
                                    margin: const EdgeInsets.only(right: 8),
                                  ),
                                  Center(
                                    child: Text(
                                      'Recommended',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 20)),
                          Obx(
                            () => SliverMasonryGrid.count(
                              childCount: controller.allProducts.length,
                              crossAxisCount: 2, // jumlah kolom
                              mainAxisSpacing: 8, // jarak antar item vertikal
                              crossAxisSpacing: 8,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.productdetail,
                                        arguments:
                                            controller.allProducts[index],
                                      );
                                    },
                                    child: SimpleProductCard(
                                      product: controller.allProducts[index],
                                      isManshory: true,
                                    ),
                                  ),
                            ),
                          ), // jarak antar item horizontal)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ShopPage(),
              CheckOutPage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget childOfFeatured({
    required String title,
    required double size,
    required VoidCallback onTap,
  }) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: size, color: darkGrey),
        ),
      ),
    );
  }
}
