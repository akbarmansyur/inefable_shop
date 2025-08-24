class SubCategory {
  final String id;
  final String name;
  final String? imageUrl;
  final bool isActive;

  SubCategory({
    required this.id,
    required this.name,
    this.imageUrl,
    this.isActive = true,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'],
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'imageUrl': imageUrl, 'isActive': isActive};
  }

  SubCategory copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? isActive,
  }) {
    return SubCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
    );
  }
}
