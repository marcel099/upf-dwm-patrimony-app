import 'package:uuid/uuid.dart';

class Patrimony {
  Uuid id;
  String name;
  bool status;
  String description;
  String code;
  String imgUrl;
  double price;

  Patrimony({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
    required this.code,
    required this.imgUrl,
    required this.price,
  });

  factory Patrimony.fromJson(Map<String, dynamic> json) {
    return Patrimony(
      id: json["id"],
      name: json['name'],
      status: json['status'],
      description: json['description'],
      code: json['code'],
      imgUrl: json['imgUrl'],
      price: json['price'],
    );
  }
}
