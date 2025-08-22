import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/controller/home_controller.dart';
import 'package:inefable_shop/custom_background.dart';
import 'package:inefable_shop/models/product_model.dart';
import 'package:inefable_shop/route/app_pages.dart';
import 'package:inefable_shop/screens/category/category_list_page.dart';
import 'package:inefable_shop/screens/main/components/offer_widget.dart';
import 'package:inefable_shop/screens/notifications_page.dart';
import 'package:inefable_shop/screens/product/product_detail.dart';
import 'package:inefable_shop/screens/product/product_page.dart';
import 'package:inefable_shop/screens/profile_page.dart';
import 'package:inefable_shop/screens/search_page.dart';
import 'package:inefable_shop/screens/shop/check_out_page.dart';
import 'components/custom_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    Widget appBar = SizedBox(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => NotificationsPage())),
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: SvgPicture.asset('assets/icons/search_icon.svg'),
          ),
        ],
      ),
    );

    Widget topHeader = Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.timelines.length, // jumlah item yang ingin digenerate
            (index) {
              return childOfFeatured(
                onTap: () {
                  controller.changeSelectedTimelineIndex(index);
                },
                title: controller.timelines[index],
                size: controller.selectedTimelineIndex.value == index ? 20 : 14,
              );
            }, // builder function
          ),
        ),
      ),
    );

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Hoodie'),
        Tab(text: 'Tshirt'),
        Tab(text: 'Bag'),
        Tab(text: 'Slipper'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(fontSize: 14.0),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: controller.tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomConvexNavbar(
        controller: controller.bottomTabController,
      ),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: controller.bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SafeArea(
              child: Column(
                children: [
                  appBar,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomScrollView(
                        // physics: NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(child: topHeader),
                          SliverToBoxAdapter(child: OfferCarousel()),

                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                // Header Flash Sale
                                Row(
                                  children: [
                                    // Garis vertikal merah
                                    Container(
                                      width: 4,
                                      height: 20,
                                      color: yellow,
                                      margin: const EdgeInsets.only(right: 8),
                                    ),
                                    // Teks Flash Sale
                                    Text(
                                      'Flash Sale',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    // Countdown timer
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
                                            flashSaleProducts: controller
                                                .flashSaleProducts[index],
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
                          // SliverToBoxAdapter(
                          // child: ProductList(products: products),
                          // ),
                          SliverToBoxAdapter(child: tabBar),
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
                                      Get.to(ProductDetailPage());
                                    },
                                    child: ManshoryProductCard(
                                      flashSaleProducts:
                                          controller.allProducts[index],
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
            ),

            CategoryListPage(),
            CheckOutPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }

  Flexible childOfFeatured({
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

class SimpleProductCard extends StatelessWidget {
  const SimpleProductCard({super.key, required this.flashSaleProducts});

  final Product flashSaleProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Lebar setiap item
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: flashSaleProducts.images[0],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                height: 120,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                height: 120,
                width: double.infinity,
                child: Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Text(
                  flashSaleProducts.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Harga Diskon
                Text(
                  'Rp ${flashSaleProducts.flashSalePrice}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                // Harga Asli (coret)
                Text(
                  'Rp ${flashSaleProducts.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  ),
                ),
                // Progress Bar dan Persentase
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 40,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  minHeight: 6,
                ),
                SizedBox(height: 4),
                Text(
                  '40% Sold',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ManshoryProductCard extends StatelessWidget {
  const ManshoryProductCard({super.key, required this.flashSaleProducts});

  final Product flashSaleProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: flashSaleProducts.images[0],

              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                height: 120,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                height: 120,
                width: double.infinity,
                child: Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Text(
                  flashSaleProducts.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Harga Diskon
                Text(
                  'Rp ${flashSaleProducts.flashSalePrice}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                // Harga Asli (coret)
                Text(
                  'Rp ${flashSaleProducts.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  ),
                ),
                // Progress Bar dan Persentase
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
