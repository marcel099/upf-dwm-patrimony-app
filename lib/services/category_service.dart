import 'package:patrimony_app/entities/category.dart';
import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier {
  final List<Category> _categories = [];
  List<Category> get categories => _categories;

  CategoryService();

  void create(Category newCategory) {
    _categories.add(newCategory);

    notifyListeners();
  }

  int _findIndexInList(int id) {
    final int foundIndex =
        _categories.indexWhere(((category) => category.id == id));

    return foundIndex;
  }

  void update(Category updatedCategory) {
    final int foundIndex = _findIndexInList(updatedCategory.id);

    _categories[foundIndex] = updatedCategory;

    notifyListeners();
  }

  void delete(int id) {
    final int foundIndex = _findIndexInList(id);

    _categories.removeAt(foundIndex);
  }
}
