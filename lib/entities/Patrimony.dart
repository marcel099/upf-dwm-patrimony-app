import 'package:uuid/uuid.dart';

var v4 = const Uuid().v4;

class Patrimony {
  String? id;
  String name;
  String description;
  double price;
  String departmentId;
  List<String> categoryIds;

  Patrimony({
    this.name = '',
    this.description = '',
    this.price = 0,
    this.departmentId = '',
    this.categoryIds = const [''],
  }) {
    id = v4();
  }
}
