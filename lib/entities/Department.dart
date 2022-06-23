import 'package:uuid/uuid.dart';

class Department {
  Uuid id;
  String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json["id"],
      name: json['name'],
    );
  }
}
