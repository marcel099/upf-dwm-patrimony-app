import 'package:uuid/uuid.dart';

class Department {
  final Uuid id;
  final String name;

  const Department({
    this.id = const Uuid(),
    this.name = "",
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json["id"],
      name: json['name'],
    );
  }
}
