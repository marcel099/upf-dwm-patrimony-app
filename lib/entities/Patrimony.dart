import 'package:uuid/uuid.dart';

var v4 = const Uuid().v4;

class Patrimony {
  String? id;
  String name;
  String description;
  double price;
  String departmentId;

  Patrimony({
    this.name = '',
    this.description = '',
    this.price = 0,
    this.departmentId = '',
  }) {
    id = v4();
  }
}
