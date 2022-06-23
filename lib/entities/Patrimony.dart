import 'package:uuid/uuid.dart';

class Patrimony {
  final Uuid id;
  final String name;
  final String description;
  final double price;

  const Patrimony({
    this.id = const Uuid(),
    this.name = '',
    this.description = '',
    this.price = 0,
  });

  factory Patrimony.fromJson(Map<String, dynamic> json) {
    return Patrimony(
      id: json["id"],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
