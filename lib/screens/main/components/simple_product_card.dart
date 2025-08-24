import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inefable_shop/models/product_model.dart';

class SimpleProductCard extends StatelessWidget {
  const SimpleProductCard({
    super.key,
    required this.product,
    this.isFlash = false,
    this.isManshory = false,
  });

  final Product product;
  final bool isFlash;
  final bool isManshory;

  @override
  Widget build(BuildContext context) {
    Widget cardProduct() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: product.images[0],
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: isManshory ? 200 : null,
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: isManshory ? 200 : null,
              child: Icon(Icons.error),
            );
          },
        ),
      );
    }

    return Container(
      width: isManshory ? null : 150,
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
          isManshory ? cardProduct() : Expanded(child: cardProduct()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Harga Diskon
                product.isFlashSale
                    ? Column(
                        children: [
                          Text(
                            'Rp ${product.flashSalePrice}',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Rp ${product.price}',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'Rp ${product.price}',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                // Progress Bar dan Persentase
                isFlash
                    ? Column(
                        children: [
                          SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: 40,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red,
                            ),
                            minHeight: 6,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '40% Sold',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
