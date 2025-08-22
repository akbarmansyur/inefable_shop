import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF141414)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF141414),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with indicators
            _buildProductImage(),

            // Product Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Fashion Forward",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            // Product Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Elegant Evening Gown",
                style: TextStyle(fontSize: 16, color: Color(0xFF141414)),
              ),
            ),

            // Price
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "\$350",
                style: TextStyle(fontSize: 16, color: Color(0xFF141414)),
              ),
            ),

            // Product Details
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "This stunning evening gown is crafted from luxurious silk and features a flattering silhouette. Perfect for special occasions.",
                style: TextStyle(fontSize: 16, color: Color(0xFF141414)),
              ),
            ),

            // Color Options
            _buildColorOptions(),

            // Size Options
            _buildSizeOptions(),

            // Action Buttons
            _buildActionButtons(),

            // Customer Reviews Header
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                "Customer Reviews",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            // Rating Summary
            _buildRatingSummary(),

            // Review List
            _buildReviewList(),

            // Related Products
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                "Related Products",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            _buildRelatedProducts(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://lh3.googleusercontent.com/aida-public/AB6AXuCZ8DZiNLCIGu1J-aDRevvwvDXRFzgFxnq0LATN-nssdwvP-6W8Crh0K8GHDn530oa22KVhbq3rrArbGN-Y8veCKPSRTpDgnZJzZVVW8XX3xIhAFkmrVKyYkwlGydaAZlQGHtke0fpnZ3CgZwBafYyYXQIA6u2_npzeazR9-TzyOTj68o7UV-kinVDpsxbYcGrKF6Dg8HmakO0Ne4PwcZ1x-dmnsAuSNLR-m9n8EydtMuVbdAyxpQdPhSobdeRnfp7QQiIFx0pCHBQH",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIndicator(true),
            _buildIndicator(false),
            _buildIndicator(false),
            _buildIndicator(false),
            _buildIndicator(false),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _buildColorOptions() {
    final List<Color> colors = [
      Colors.black,
      Colors.white,
      Colors.purple,
      Colors.green,
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 20,
        children: colors.map((color) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFDBDBDB),
                width: color == Colors.black ? 3 : 1,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSizeOptions() {
    final List<String> sizes = ["S", "M", "L", "XL"];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 12,
        children: sizes.map((size) {
          return Container(
            width: 50,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFDBDBDB),
                width: size == "S" ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                size,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF141414),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDEDED),
                foregroundColor: const Color(0xFF141414),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF141414),
                foregroundColor: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Buy Now",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSummary() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating Number
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "4.5",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF141414),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "120 reviews",
                style: TextStyle(fontSize: 16, color: Color(0xFF141414)),
              ),
            ],
          ),

          const SizedBox(width: 32),

          // Rating Bars
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, 0.4),
                _buildRatingBar(4, 0.3),
                _buildRatingBar(3, 0.15),
                _buildRatingBar(2, 0.1),
                _buildRatingBar(1, 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$stars",
            style: const TextStyle(fontSize: 14, color: Color(0xFF141414)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: const Color(0xFFDBDBDB),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF141414),
              ),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "${(percentage * 100).toInt()}%",
            style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildReviewItem(
            "Olivia Bennett",
            "2 weeks ago",
            "https://lh3.googleusercontent.com/aida-public/AB6AXuABBcKkU02wr5_JRgGtssPbjkL3nigm4RSqpqFRCw7Qn02ErDPzWOI0Btul9jFSRI_5DaNTk1je5h4oLj3FW_ciVAbJ3JRV7o6D2PRRIv9dkJm9tkCPEmTqsiGJ8AAiESQnYT8CXx23T5gg6K_Mqw10ceqnK7YoxckJQ2mYNhJ361KzxAydpfycf-b3DTDP-Gn-qpDfLfPjVXuF4BGmtumKvtlJEJOdnx3Og0LfNU5NpP4BBVkHYoM25raiV0wyZM0HfNTZqnLmd06Y",
            5,
            "Absolutely love this dress! The fit is perfect, and the fabric feels amazing. I received so many compliments at the event.",
            25,
            2,
          ),
          const SizedBox(height: 32),
          _buildReviewItem(
            "Chloe Dubois",
            "1 month ago",
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDgeu38ZPszTaISefK-pVlF06DiyOvLB2dd5QGFDlJuAA3ktYjK9cUWJpZ7jnqRpav4buQHRYngfLO_WQdJVvDL7NqxzlETm1DlpuEkmNMKP7SaFUukCcg65KmZ9spe0CG85hm4MSLtP15BMDdBj2by3K2pkwe2ltUS3mtO4AgCl70dFPWibdZ9N9C2ED5fzzCN-ijrQPzo1U6XLgWFUrCAVYyu6tQ6vcSGU4JIFzk6zEhcY6N9Y5oik48pDuLfpbDq5Q8cFGvyoqiP",
            4,
            "Beautiful dress, but the color was slightly different than expected. Still, it's a great quality piece.",
            18,
            3,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(
    String name,
    String time,
    String imageUrl,
    int rating,
    String comment,
    int likes,
    int dislikes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF141414),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        RatingBar.builder(
          initialRating: rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {},
          ignoreGestures: true,
        ),
        const SizedBox(height: 12),
        Text(
          comment,
          style: const TextStyle(fontSize: 16, color: Color(0xFF141414)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up_outlined, size: 20),
              onPressed: () {},
              color: const Color(0xFF757575),
            ),
            Text(
              "$likes",
              style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
            ),
            const SizedBox(width: 24),
            IconButton(
              icon: const Icon(Icons.thumb_down_outlined, size: 20),
              onPressed: () {},
              color: const Color(0xFF757575),
            ),
            Text(
              "$dislikes",
              style: const TextStyle(fontSize: 14, color: Color(0xFF757575)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRelatedProducts() {
    final List<Map<String, dynamic>> products = [
      {
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuAjlYNAWQ8L9T5yzVqV5q6ej8BhUzb-ZP3I4lb1pUAEqRoXSgi_UdIrjsumdDhYH3oHOp7azgdSuZItz3vnqrCh52eeSUkjQM3f9IDL0UlVe2YCYZRbP52GVWlhfZLKT-A7IcF9m3SXg-W-Zbp6qI-v1d27GxJVRnl134UiUwNRHBTW1Sm3Pilg7Y20dYXscQnY6ALIXl-FymjV5xmv1RnDehZf_GspYNKIjcOVLmJ1fYVqa4j354Kwm8FyXG3_JkaQw79m4ilMXjDa",
        "name": "Summer Dress",
        "price": "\$120",
      },
      {
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuBEYKj5bNokhfVmCE0VHuV4IjUGSNrL_TtRnNGp5SSeFS8QHXWKgyCLF_K56XkSOaCUyfVXtVcTup5BjFHO9sKOY0j23caH7qeqKevhQbIAbDQtymlzancFy8Shh_ebkDeBhSRGy3QA8Pitx5ROIqoh6gj0DsltH6GdKW6nVwyv3unKCMS8TTkZobmW7L5qPhpEsDjKjXd_6RlI5MMoFQr2cJYSXdZ2s-tzC3BAp-5uT9UttDN57wukIMV109DKUkbZrA9pg6mvhT9D",
        "name": "Casual Dress",
        "price": "\$80",
      },
      {
        "image":
            "https://lh3.googleusercontent.com/aida-public/AB6AXuDY0IxThhu1sPa5D9t1rHOlxJI-izwm0wHrp83e1qW5DH9D3tnjxxFeVUPnsnNoxa24MH2Sp5EKmKTn2lqjzkQAUQYfwSBxeZe1iKwkzFFEI4ExIieaK-1XiAp7rpCcodzsBYP8hUAP17vU44b1An297b8lJ4OMHPqAC1ONggfWFjIBDzQgKqGAjlR3Lc9j4FepWkNtpNBxzpCEiUxn9_nB80R87T21iLJVgx7_8xQYht3CpWSVlUESHoSUM5GXpLKvfAn391CVK6z8",
        "name": "Party Dress",
        "price": "\$150",
      },
    ];

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(product["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product["name"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF141414),
                  ),
                ),
                Text(
                  product["price"],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: const Color(0xFFFAFAFA),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1, color: Color(0xFFEDEDED)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(Icons.home_outlined, "Home", false),
                _buildBottomNavItem(Icons.search, "Shop", true),
                _buildBottomNavItem(Icons.favorite_border, "Wishlist", false),
                _buildBottomNavItem(Icons.shopping_bag_outlined, "Cart", false),
                _buildBottomNavItem(Icons.person_outline, "Profile", false),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF141414) : const Color(0xFF757575),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFF141414) : const Color(0xFF757575),
          ),
        ),
      ],
    );
  }
}
