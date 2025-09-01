import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/models/product.dart';
import 'package:inefable_shop/screens/product/view_product_page.dart';
import 'package:rubber/rubber.dart';

class FashionItem {
  final String name;
  final String description;
  final int price;
  final String imagePath;

  FashionItem(this.name, this.description, this.price, this.imagePath);
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final SearchController _searchController = SearchController();
  final List<String> _searchHistory = [];

  void _onSearch(String value) {
    if (value.isNotEmpty && !_searchHistory.contains(value)) {
      setState(() {
        _searchHistory.insert(0, value);
        // Batasi riwayat pencarian hingga 5 item
        if (_searchHistory.length > 5) {
          _searchHistory.removeLast();
        }
      });
    }
  }

  final List<FashionItem> _allItems = [
    FashionItem('Kaos Polos', 'Kaos katun premium', 99000, 'assets/tshirt.png'),
    FashionItem(
      'Jeans Slim Fit',
      'Celana jeans stretch',
      299000,
      'assets/jeans.png',
    ),
    FashionItem(
      'Jaket Denim',
      'Jaket denim vintage',
      399000,
      'assets/jacket.png',
    ),
    FashionItem(
      'Dress Floral',
      'Dress motif bunga',
      259000,
      'assets/dress.png',
    ),
    FashionItem(
      'Sepatu Sneakers',
      'Sepatu kasual nyaman',
      459000,
      'assets/shoes.png',
    ),
    FashionItem('Tas Ransel', 'Tas backpack fashion', 199000, 'assets/bag.png'),
    FashionItem('Topi Baseball', 'Topi casual', 89000, 'assets/hat.png'),
    FashionItem(
      'Kacamata Hitam',
      'Kacamata UV protection',
      159000,
      'assets/sunglasses.png',
    ),
  ];

  void _clearHistory() {
    setState(() {
      _searchHistory.clear();
    });
  }

  String selectedPeriod = "";
  String selectedCategory = "";
  String selectedPrice = "";

  List<Product> products = [
    Product(
      'assets/headphones_2.png',
      'Skullcandy headset L325',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      102.99,
    ),
    Product(
      'assets/headphones_3.png',
      'Skullcandy headset X25',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      55.99,
    ),
    Product(
      'assets/headphones.png',
      'Blackzy PRO hedphones M003',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Nec nam aliquam sem et tortor consequat id porta nibh. Orci porta non pulvinar neque laoreet suspendisse. Id nibh tortor id aliquet. Dui sapien eget mi proin. Viverra vitae congue eu consequat ac felis donec. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Vulputate mi sit amet mauris commodo quis imperdiet. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sit amet cursus sit amet dictum sit amet justo. Mattis pellentesque id nibh tortor. Sed blandit libero volutpat sed cras ornare arcu dui. Fermentum et sollicitudin ac orci phasellus. Ipsum nunc aliquet bibendum enim facilisis gravida. Viverra suspendisse potenti nullam ac tortor. Dapibus ultrices in iaculis nunc sed. Nisi porta lorem mollis aliquam ut porttitor leo a. Phasellus egestas tellus rutrum tellus pellentesque. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Eros in cursus turpis massa. Eget mauris pharetra et ultrices neque.',
      152.99,
    ),
  ];

  List<String> timeFilter = ['Brand', 'New', 'Latest', 'Trending', 'Discount'];

  List<String> categoryFilter = [
    'Skull Candy',
    'Boat',
    'JBL',
    'Micromax',
    'Seg',
  ];

  List<String> priceFilter = [
    '\$50-200',
    '\$200-400',
    '\$400-800',
    '\$800-1000',
  ];

  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController();

  late RubberAnimationController _controller;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _controller = RubberAnimationController(
      vsync: this,
      halfBoundValue: AnimationControllerValue(percentage: 0.4),
      upperBoundValue: AnimationControllerValue(percentage: 0.4),
      lowerBoundValue: AnimationControllerValue(pixel: 50),
      duration: Duration(milliseconds: 200),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  void _expand() {
    _controller.expand();
  }

  Widget _getLowerLayer() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            child: TextField(
              focusNode: _focusNode,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Search',
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CloseButton(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.orange, width: 1)),
          ),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                List<Product> tempList = [];
                for (var product in products) {
                  if (product.name.toLowerCase().contains(value)) {
                    tempList.add(product);
                  }
                }
                setState(() {
                  searchResults.clear();
                  searchResults.addAll(tempList);
                });
                return;
              } else {
                setState(() {
                  searchResults.clear();
                  searchResults.addAll(products);
                });
              }
            },
            cursorColor: darkGrey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              prefixIcon: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                fit: BoxFit.scaleDown,
              ),
              suffix: TextButton(
                onPressed: () {
                  searchController.clear();
                  searchResults.clear();
                },
                child: Text('Clear', style: TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.orange[50],
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  onTap: () {
                    //   Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         ViewProductPage(product: searchResults[index]),
                    //   ),
                    // );
                  },
                  title: Text(searchResults[index].name),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getUpperLayer() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, -3),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        //          controller: _scrollController,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Filters', style: TextStyle(color: Colors.grey[300])),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                top: 16.0,
                bottom: 16.0,
              ),
              child: Text(
                'Sort By',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPeriod = timeFilter[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 20.0,
                      ),
                      decoration: selectedPeriod == timeFilter[index]
                          ? BoxDecoration(
                              color: Color(0xffFDB846),
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                            )
                          : BoxDecoration(),
                      child: Text(
                        timeFilter[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: timeFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = categoryFilter[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 20.0,
                      ),
                      decoration: selectedCategory == categoryFilter[index]
                          ? BoxDecoration(
                              color: Color(0xffFDB846),
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                            )
                          : BoxDecoration(),
                      child: Text(
                        categoryFilter[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: categoryFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPrice = priceFilter[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 20.0,
                      ),
                      decoration: selectedPrice == priceFilter[index]
                          ? BoxDecoration(
                              color: Color(0xffFDB846),
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                            )
                          : BoxDecoration(),
                      child: Text(
                        priceFilter[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: priceFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //          bottomSheet: ClipRRect(
      //            borderRadius: BorderRadius.only(
      //                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
      //            child: BottomSheet(
      //                onClosing: () {},
      //                builder: (_) => Container(
      //                      padding: EdgeInsets.all(16.0),
      //                      child: Row(
      //                          mainAxisAlignment: MainAxisAlignment.center,
      //                          children: <Widget>[Text('Filters')]),
      //                      color: Colors.white,
      //                      width: MediaQuery.of(context).size.height,
      //                    )),
      //          ),
      // body: RubberBottomSheet(
      //   lowerLayer: _getLowerLayer(), // The underlying page (Widget)
      //   upperLayer: _getUpperLayer(), // The bottomsheet content (Widget)
      //   animationController: _controller, // The one we created earlier
      // ),
      body: SearchAnchor(
        searchController: _searchController,
        viewBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        viewElevation: 2,
        viewHintText: 'Cari produk fashion...',
        viewLeading: const Icon(Icons.search),
        viewTrailing: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
              },
            ),
        ],
        builder: (BuildContext context, SearchController controller) {
          return IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              controller.openView();
            },
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
              final String query = controller.value.text;
              final List<FashionItem> results = query.isEmpty
                  ? _allItems
                  : _allItems.where((item) {
                      return item.name.toLowerCase().contains(
                            query.toLowerCase(),
                          ) ||
                          item.description.toLowerCase().contains(
                            query.toLowerCase(),
                          );
                    }).toList();

              // Jika tidak ada hasil pencarian
              if (results.isEmpty) {
                return [
                  ListTile(
                    title: Text('Tidak ditemukan hasil untuk "$query"'),
                    leading: const Icon(Icons.search_off),
                  ),
                ];
              }

              return [
                // Section hasil pencarian
                ...results.map(
                  (item) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink.shade100,
                      child: const Icon(Icons.shopping_bag, color: Colors.pink),
                    ),
                    title: Text(item.name),
                    subtitle: Text('Rp ${item.price.toString()}'),
                    onTap: () {
                      setState(() {
                        controller.closeView(query);
                        _onSearch(query);
                      });
                      // Navigate to product detail page
                      _showProductDetail(context, item);
                    },
                  ),
                ),

                // Section riwayat pencarian jika ada
                if (_searchHistory.isNotEmpty && query.isEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Riwayat Pencarian',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ..._searchHistory.map(
                    (term) => ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(term),
                      onTap: () {
                        setState(() {
                          controller.text = term;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Hapus riwayat'),
                    onTap: _clearHistory,
                  ),
                ],
              ];
            },
      ),
    );
  }

  void _showProductDetail(BuildContext context, FashionItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.description),
              const SizedBox(height: 8),
              Text(
                'Rp ${item.price.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan ke keranjang
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} ditambahkan ke keranjang'),
                  ),
                );
              },
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        );
      },
    );
  }
}
