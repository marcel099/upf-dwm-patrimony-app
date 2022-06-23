import 'package:flutter/material.dart';
import 'package:patrimony_app/entities/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Text(category.name),
    );
  }
}
