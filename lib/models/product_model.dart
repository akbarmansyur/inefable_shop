class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final List<String> images;
  final bool isFlashSale;
  final int? flashSalePrice;
  final String brand;
  final List<String> categories;
  final double rating;
  final int reviewCount;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    this.isFlashSale = false,
    this.flashSalePrice,
    required this.brand,
    required this.categories,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.stock = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images']),
      isFlashSale: json['isFlashSale'] ?? false,
      flashSalePrice: json['flashSalePrice'],
      brand: json['brand'],
      categories: List<String>.from(json['categories']),
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      stock: json['stock'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'images': images,
    'isFlashSale': isFlashSale,
    'flashSalePrice': flashSalePrice,
    'brand': brand,
    'categories': categories,
    'rating': rating,
    'reviewCount': reviewCount,
    'stock': stock,
  };
}
