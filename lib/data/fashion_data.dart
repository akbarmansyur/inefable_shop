import 'package:inefable_shop/models/category.dart';
import 'package:inefable_shop/models/sub_category.dart';

class FashionData {
  static List<Category> get fashionCategories => [
    Category(
      id: '1',
      name: 'Pakaian Wanita',
      icon: '👚',
      imageUrl: 'https://example.com/women-clothing.jpg',
      subCategories: [
        SubCategory(
          id: '1-1',
          name: 'Dress',
          imageUrl: 'https://example.com/dress.jpg',
        ),
        SubCategory(
          id: '1-2',
          name: 'Blouse & Shirt',
          imageUrl: 'https://example.com/blouse.jpg',
        ),
        SubCategory(
          id: '1-3',
          name: 'Rok & Skirt',
          imageUrl: 'https://example.com/skirt.jpg',
        ),
        SubCategory(
          id: '1-4',
          name: 'Celana Wanita',
          imageUrl: 'https://example.com/women-pants.jpg',
        ),
        SubCategory(
          id: '1-5',
          name: 'Jeans Wanita',
          imageUrl: 'https://example.com/women-jeans.jpg',
        ),
        SubCategory(
          id: '1-6',
          name: 'Jumpsuit & Romper',
          imageUrl: 'https://example.com/jumpsuit.jpg',
        ),
      ],
    ),
    Category(
      id: '2',
      name: 'Pakaian Pria',
      icon: '👔',
      imageUrl: 'https://example.com/men-clothing.jpg',
      subCategories: [
        SubCategory(
          id: '2-1',
          name: 'Kemeja Pria',
          imageUrl: 'https://example.com/shirt.jpg',
        ),
        SubCategory(
          id: '2-2',
          name: 'T-Shirt & Kaos',
          imageUrl: 'https://example.com/tshirt.jpg',
        ),
        SubCategory(
          id: '2-3',
          name: 'Celana Jeans',
          imageUrl: 'https://example.com/jeans.jpg',
        ),
        SubCategory(
          id: '2-4',
          name: 'Celana Chino',
          imageUrl: 'https://example.com/chino.jpg',
        ),
        SubCategory(
          id: '2-5',
          name: 'Jaket & Hoodie',
          imageUrl: 'https://example.com/jacket.jpg',
        ),
        SubCategory(
          id: '2-6',
          name: 'Pakaian Dalam',
          imageUrl: 'https://example.com/underwear.jpg',
        ),
      ],
    ),
    Category(
      id: '3',
      name: 'Sepatu',
      icon: '👟',
      imageUrl: 'https://example.com/shoes.jpg',
      subCategories: [
        SubCategory(
          id: '3-1',
          name: 'Sneakers',
          imageUrl: 'https://example.com/sneakers.jpg',
        ),
        SubCategory(
          id: '3-2',
          name: 'Sepatu Formal',
          imageUrl: 'https://example.com/formal-shoes.jpg',
        ),
        SubCategory(
          id: '3-3',
          name: 'Sandals & Flip Flops',
          imageUrl: 'https://example.com/sandals.jpg',
        ),
        SubCategory(
          id: '3-4',
          name: 'Boots',
          imageUrl: 'https://example.com/boots.jpg',
        ),
        SubCategory(
          id: '3-5',
          name: 'Sepatu Olahraga',
          imageUrl: 'https://example.com/sports-shoes.jpg',
        ),
        SubCategory(
          id: '3-6',
          name: 'Sepatu Wanita',
          imageUrl: 'https://example.com/women-shoes.jpg',
        ),
      ],
    ),
    Category(
      id: '4',
      name: 'Tas & Aksesoris',
      icon: '👜',
      imageUrl: 'https://example.com/bags-accessories.jpg',
      subCategories: [
        SubCategory(
          id: '4-1',
          name: 'Tas Wanita',
          imageUrl: 'https://example.com/women-bags.jpg',
        ),
        SubCategory(
          id: '4-2',
          name: 'Tas Pria',
          imageUrl: 'https://example.com/men-bags.jpg',
        ),
        SubCategory(
          id: '4-3',
          name: 'Backpack & Ransel',
          imageUrl: 'https://example.com/backpack.jpg',
        ),
        SubCategory(
          id: '4-4',
          name: 'Dompet',
          imageUrl: 'https://example.com/wallet.jpg',
        ),
        SubCategory(
          id: '4-5',
          name: 'Topi & Hat',
          imageUrl: 'https://example.com/hats.jpg',
        ),
        SubCategory(
          id: '4-6',
          name: 'Scarf & Shawl',
          imageUrl: 'https://example.com/scarf.jpg',
        ),
      ],
    ),
    Category(
      id: '5',
      name: 'Perhiasan',
      icon: '💎',
      imageUrl: 'https://example.com/jewelry.jpg',
      subCategories: [
        SubCategory(
          id: '5-1',
          name: 'Kalung',
          imageUrl: 'https://example.com/necklace.jpg',
        ),
        SubCategory(
          id: '5-2',
          name: 'Gelang',
          imageUrl: 'https://example.com/bracelet.jpg',
        ),
        SubCategory(
          id: '5-3',
          name: 'Cincin',
          imageUrl: 'https://example.com/ring.jpg',
        ),
        SubCategory(
          id: '5-4',
          name: 'Anting',
          imageUrl: 'https://example.com/earrings.jpg',
        ),
        SubCategory(
          id: '5-5',
          name: 'Jam Tangan',
          imageUrl: 'https://example.com/watch.jpg',
        ),
        SubCategory(
          id: '5-6',
          name: 'Aksesoris Rambut',
          imageUrl: 'https://example.com/hair-accessories.jpg',
        ),
      ],
    ),
    Category(
      id: '6',
      name: 'Olahraga & Outdoor',
      icon: '🏃‍♀️',
      imageUrl: 'https://example.com/sports-outdoor.jpg',
      subCategories: [
        SubCategory(
          id: '6-1',
          name: 'Sportswear',
          imageUrl: 'https://example.com/sportswear.jpg',
        ),
        SubCategory(
          id: '6-2',
          name: 'Sepatu Olahraga',
          imageUrl: 'https://example.com/sports-shoes.jpg',
        ),
        SubCategory(
          id: '6-3',
          name: 'Outdoor Gear',
          imageUrl: 'https://example.com/outdoor-gear.jpg',
        ),
        SubCategory(
          id: '6-4',
          name: 'Fitness Equipment',
          imageUrl: 'https://example.com/fitness-equipment.jpg',
        ),
        SubCategory(
          id: '6-5',
          name: 'Swimwear',
          imageUrl: 'https://example.com/swimwear.jpg',
        ),
        SubCategory(
          id: '6-6',
          name: 'Aksesoris Olahraga',
          imageUrl: 'https://example.com/sports-accessories.jpg',
        ),
      ],
    ),
  ];

  // Method untuk mendapatkan kategori berdasarkan ID
  static Category? getCategoryById(String id) {
    try {
      return fashionCategories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Method untuk mendapatkan semua subkategori dari suatu kategori
  static List<SubCategory> getSubCategoriesByCategoryId(String categoryId) {
    final category = getCategoryById(categoryId);
    return category?.subCategories ?? [];
  }

  // Method untuk mencari subkategori berdasarkan nama
  static List<SubCategory> searchSubCategories(String query) {
    return fashionCategories
        .expand((category) => category.subCategories)
        .where(
          (subCategory) =>
              subCategory.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
