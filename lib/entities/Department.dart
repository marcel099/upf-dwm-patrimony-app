import 'package:uuid/uuid.dart';

var v4 = const Uuid().v4;

class Department {
  String? id;
  String name;

  Department({
    this.name = "",
  }) {
    id = v4();
  }
}
