import 'package:uuid/uuid.dart';

var v4 = const Uuid().v4;

class Category {
  String? id;
  String name;

  Category({
    this.name = "",
  }) {
    id = v4();
  }
}
