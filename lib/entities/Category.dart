import 'package:uuid/uuid.dart';

class Category {
  final Uuid id;
  final String name;

  const Category({
    this.id = const Uuid(),
    this.name = "",
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json['name'],
    );
  }
}
