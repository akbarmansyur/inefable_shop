import 'package:flutter/material.dart';
import 'package:inefable_shop/app_properties.dart';
import 'package:inefable_shop/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 80,
                width: 90,
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(category.name, textAlign: TextAlign.right),
                ),
              ),
              Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [yellow, yellow],
                    center: Alignment(0, 0),
                    radius: 0.8,
                    focal: Alignment(0, 0),
                    focalRadius: 0.1,
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                child: Center(child: Image.asset(category.imageUrl ?? "")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
