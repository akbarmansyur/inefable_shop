class FlashSaleProduct {
  final String id;
  final String name;
  final String image;
  final double originalPrice;
  final double discountPrice;
  final int soldPercentage;
  final double rating;
  final int reviewCount;

  FlashSaleProduct({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountPrice,
    required this.soldPercentage,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  // Hitung persentase diskon
  int get discountPercentage {
    return (((originalPrice - discountPrice) / originalPrice) * 100).round();
  }
}
