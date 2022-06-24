import 'package:uuid/uuid.dart';

var v4 = const Uuid().v4;

class Patrimony {
  String? id;
  String name;
  String description;
  double price;
  Uuid departmentId;

  Patrimony({
    this.name = '',
    this.description = '',
    this.price = 0,
    this.departmentId = const Uuid(),
  }) {
    id = v4();
  }
}
