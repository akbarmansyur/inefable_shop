import 'package:inefable_shop/models/sub_category.dart';

class Category {
  final String id;
  final String name;
  final String? icon;
  final String? imageUrl;
  final List<SubCategory> subCategories;
  final int displayOrder;
  final bool isActive;

  Category({
    required this.id,
    required this.name,
    this.icon,
    this.imageUrl,
    this.subCategories = const [],
    this.displayOrder = 0,
    this.isActive = true,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'],
      imageUrl: json['imageUrl'],
      subCategories:
          (json['subCategories'] as List<dynamic>?)
              ?.map((item) => SubCategory.fromJson(item))
              .toList() ??
          [],
      displayOrder: json['displayOrder'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'imageUrl': imageUrl,
      'subCategories': subCategories.map((sub) => sub.toJson()).toList(),
      'displayOrder': displayOrder,
      'isActive': isActive,
    };
  }

  Category copyWith({
    String? id,
    String? name,
    String? icon,
    String? imageUrl,
    List<SubCategory>? subCategories,
    int? displayOrder,
    bool? isActive,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      imageUrl: imageUrl ?? this.imageUrl,
      subCategories: subCategories ?? this.subCategories,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
    );
  }
}
